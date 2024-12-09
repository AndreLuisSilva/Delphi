program MonolitoFinanceiro;

uses
  Vcl.Forms,
  MonolitoFinanceiro.View.Principal in 'src\View\MonolitoFinanceiro.View.Principal.pas' {Frm_Principal},
  MonolitoFinanceiro.View.CadastroPadrao in 'src\View\MonolitoFinanceiro.View.CadastroPadrao.pas' {Frm_CadastroPadrao},
  MonolitoFinanceiro.View.Splash in 'src\View\MonolitoFinanceiro.View.Splash.pas' {Frm_Splash},
  MonolitoFinanceiro.Model.Conexao in 'src\Model\MonolitoFinanceiro.Model.Conexao.pas' {DataModule_PgConexao: TDataModule},
  MonolitoFinanceiro.View.CadastroUsuarios in 'src\View\MonolitoFinanceiro.View.CadastroUsuarios.pas' {Frm_CadastroUsuarios},
  MonolitoFinanceiro.Model.Usuarios in 'src\Model\MonolitoFinanceiro.Model.Usuarios.pas' {DataModule_Usuarios: TDataModule},
  MonolitoFinanceiro.Utilitarios in 'src\Util\MonolitoFinanceiro.Utilitarios.pas',
  MonolitoFinanceiro.View.Login in 'src\View\MonolitoFinanceiro.View.Login.pas' {Frm_Login},
  MonolitoFinanceiro.Model.Entidades.Usuarios in 'src\Model\Entidades\MonolitoFinanceiro.Model.Entidades.Usuarios.pas',
  MonolitoFinanceiro.Model.Sistema in 'src\Model\MonolitoFinanceiro.Model.Sistema.pas' {DataModule_Sistema: TDataModule},
  MonolitoFinanceiro.View.RedefinirSenha in 'src\View\MonolitoFinanceiro.View.RedefinirSenha.pas' {Frm_RedefinirSenha},
  MonolitoFinanceiro.Model.Caixa in 'src\Model\MonolitoFinanceiro.Model.Caixa.pas' {DataModule_Caixa: TDataModule},
  MonolitoFinanceiro.View.Caixa in 'src\View\MonolitoFinanceiro.View.Caixa.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule_PgConexao, DataModule_PgConexao);
  Application.CreateForm(TDataModule_Usuarios, DataModule_Usuarios);
  Application.CreateForm(TDataModule_Caixa, DataModule_Caixa);
  Application.CreateForm(TDataModule_Sistema, DataModule_Sistema);
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.CreateForm(TFrm_CadastroPadrao, Frm_CadastroPadrao);
  Application.CreateForm(TFrm_CadastroUsuarios, Frm_CadastroUsuarios);
  Application.CreateForm(TFrm_Caixa, Frm_Caixa);
  Application.Run;
end.
