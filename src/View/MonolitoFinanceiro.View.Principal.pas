unit MonolitoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls,
  MonolitoFinanceiro.Model.Usuarios;

type
  TFrm_Principal = class(TForm)
    MainMenu: TMainMenu;
    main_cadastros: TMenuItem;
    main_relatorios: TMenuItem;
    main_ajuda: TMenuItem;
    menu_usuarios: TMenuItem;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure menu_usuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

uses
  MonolitoFinanceiro.View.CadastroPadrao,
  MonolitoFinanceiro.View.CadastroUsuarios,
  MonolitoFinanceiro.View.Splash,
  MonolitoFinanceiro.View.Login;

{$R *.dfm}

procedure TFrm_Principal.FormCreate(Sender: TObject);
begin

  Frm_Splash := TFrm_Splash.Create(Nil);

  try
     Frm_Splash.ShowModal;
  finally
      FreeAndNil(Frm_Splash);
  end;

  Frm_Login := TFrm_Login.Create(Nil);

  try
     Frm_Login.ShowModal;
     if Frm_Login.ShowModal <> mrOk then
      Application.Terminate;
  finally
      FreeAndNil(Frm_Login);
  end;
  //StatusBar1.Panels.Items[1].Text := 'Usu�rio: ' + DataModule_Usuarios.getUsuarioLogado.nomeUsuarioLogado;
end;

procedure TFrm_Principal.menu_usuariosClick(Sender: TObject);
begin
   Frm_CadastroUsuarios.Show;
end;

end.
