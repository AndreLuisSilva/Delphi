unit MonolitoFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TFrm_Login = class(TForm)
    pnl_pricipal: TPanel;
    pnl_left: TPanel;
    pnl_center: TPanel;
    pnl_top: TPanel;
    img_login: TImage;
    lbl_top: TLabel;
    pnl_usuario: TPanel;
    lbl_usuario: TLabel;
    txt_usuario: TEdit;
    pnl_bottom: TPanel;
    btn_entrar: TButton;
    btn_cancelar: TButton;
    pnl_senha: TPanel;
    lbl_senha: TLabel;
    txt_senha: TEdit;
    procedure btn_entrarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Login: TFrm_Login;

implementation

{$R *.dfm}


procedure TFrm_Login.btn_entrarClick(Sender: TObject);
begin
  if Trim(txt_usuario.Text) = '' then
  begin
    txt_usuario.SetFocus;
    Application.MessageBox('Informe o seu usuário!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Trim(txt_senha.Text) = '' then
  begin
    txt_senha.SetFocus;
    Application.MessageBox('Informe a sua senha!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
end;

end.
