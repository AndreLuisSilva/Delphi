unit MonolitoFinanceiro.View.RedefinirSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  MonolitoFinanceiro.Model.Entidades.Usuarios,
  MonolitoFinanceiro.Model.Usuarios;

type
  TFrm_RedefinirSenha = class(TForm)
    pnl_principal: TPanel;
    pnl_top: TPanel;
    pnl_center: TPanel;
    pnl_bottom: TPanel;
    lbl_usuario: TLabel;
    txt_senha: TEdit;
    txt_confirmar_senha: TEdit;
    btn_confirmar: TButton;
    btn_cancelar: TButton;
    lbl_texto: TLabel;
    lbl_senha: TLabel;
    lbl_confirmar_senha: TLabel;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_confirmarClick(Sender: TObject);
  private
    FUsuario: TModelEntidadeUsuario;
    procedure SetUsuario(const Value: TModelEntidadeUsuario);
    { Private declarations }
  public
    { Public declarations }
    property Usuario : TModelEntidadeUsuario read FUsuario write SetUsuario;
  end;

var
  Frm_RedefinirSenha: TFrm_RedefinirSenha;

implementation

{$R *.dfm}

procedure TFrm_RedefinirSenha.btn_cancelarClick(Sender: TObject);
begin
  //Application.Terminate;
  ModalResult := mrCancel;
end;

procedure TFrm_RedefinirSenha.btn_confirmarClick(Sender: TObject);
begin
  txt_senha.Text := Trim(txt_senha.Text);
  txt_confirmar_senha.Text := Trim(txt_confirmar_senha.Text);

  if txt_senha.Text = '' then
  begin
    txt_senha.SetFocus;
    Application.MessageBox('Campo senha n�o pode ser vazio!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

 if txt_confirmar_senha.Text = '' then
  begin
    txt_confirmar_senha.SetFocus;
    Application.MessageBox('Campo confirmar senha n�o pode ser vazio!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if txt_senha.Text <> txt_confirmar_senha.Text then
  begin
    txt_senha.SetFocus;
    Application.MessageBox('Senha diferente da confirma��o!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  Usuario.senhaUsuarioLogado := txt_senha.Text;
  DataModule_Usuarios.redefinirSenha(Usuario);
  Application.MessageBox('Senha alterada com sucesso!', 'Sucesso', MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;

 end;

procedure TFrm_RedefinirSenha.FormShow(Sender: TObject);
begin
  lbl_usuario.Caption := FUsuario.nomeUsuarioLogado;
end;

procedure TFrm_RedefinirSenha.SetUsuario(const Value: TModelEntidadeUsuario);
begin
  FUsuario := Value;
end;

end.
