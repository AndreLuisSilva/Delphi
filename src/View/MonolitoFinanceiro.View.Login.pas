unit MonolitoFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, MonolitoFinanceiro.Model.Usuarios, MonolitoFinanceiro.Model.Sistema;

type
  TFrm_Login = class(TForm)
    pnl_pricipal: TPanel;
    pnl_left: TPanel;
    pnl_center: TPanel;
    pnl_top: TPanel;
    img_login: TImage;
    lbl_top: TLabel;
    pnl_usuario: TPanel;
    pnl_bottom: TPanel;
    btn_entrar: TButton;
    btn_cancelar: TButton;
    pnl_senha: TPanel;
    lbl_usuario: TLabel;
    txt_usuario: TEdit;
    lbl_senha: TLabel;
    txt_senha: TEdit;
    procedure btn_entrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure LimparTxt(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Login: TFrm_Login;

implementation

{$R *.dfm}

procedure TFrm_Login.btn_cancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_Login.btn_entrarClick(Sender: TObject);
begin
  if Trim(txt_usuario.Text) = '' then
  begin
    txt_usuario.SetFocus;
    Application.MessageBox('Informe o seu usu�rio!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Trim(txt_senha.Text) = '' then
  begin
    txt_senha.SetFocus;
    Application.MessageBox('Informe a sua senha!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  try
    DataModule_Usuarios.efetuarLogin(Trim(txt_usuario.Text), Trim(txt_senha.Text));
    DataModule_Sistema.dataUltimoAcesso(Now);
    DataModule_Sistema.usuarioUltimoAcesso(DataModule_Usuarios.getUsuarioLogado.loginUsuarioLogado);
    ModalResult := mrOk;
    LimparTxt(txt_usuario);
    LimparTxt(txt_senha);

  Except
    on Erro: Exception do
    begin
      Application.MessageBox(PWideChar(Erro.Message), 'Aten��o', MB_OK + MB_ICONWARNING);
      txt_usuario.SetFocus;
    end;

  end;

end;

procedure TFrm_Login.FormShow(Sender: TObject);
begin
  txt_usuario.Text := DataModule_Sistema.usuarioUltimoAcesso;
  txt_usuario.SetFocus;
end;

procedure TFrm_Login.LimparTxt(Sender: TObject);
begin
  if (Sender is TEdit) then (Sender as TEdit).Text := '';
end;

end.
