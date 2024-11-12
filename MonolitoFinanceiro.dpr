program MonolitoFinanceiro;

uses
  Vcl.Forms,
  MonolitoFinanceiro.View.Principal in 'src\View\MonolitoFinanceiro.View.Principal.pas' {Frm_Principal},
  MonolitoFinanceiro.View.CadastroPadrao in 'src\View\MonolitoFinanceiro.View.CadastroPadrao.pas' {Frm_CadastroPadrao},
  MonolitoFinanceiro.View.Splash in 'src\View\MonolitoFinanceiro.View.Splash.pas' {Frm_Splash},
  MonolitoFinanceiro.Model.Conexao in 'src\Model\MonolitoFinanceiro.Model.Conexao.pas' {DataModule_PgConexao: TDataModule},
  MonolitoFinanceiro.View.CadastroUsuarios in 'src\View\MonolitoFinanceiro.View.CadastroUsuarios.pas' {Frm_CadastroUsuarios},
  MonolitoFinanceiro.Model.Usuarios in 'src\Model\MonolitoFinanceiro.Model.Usuarios.pas' {DataModule_Usuarios: TDataModule},
  MonolitoFinanceiro.Utilitarios in 'src\Util\MonolitoFinanceiro.Utilitarios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule_PgConexao, DataModule_PgConexao);
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.CreateForm(TFrm_CadastroPadrao, Frm_CadastroPadrao);
  Application.CreateForm(TFrm_Splash, Frm_Splash);
  Application.CreateForm(TFrm_CadastroUsuarios, Frm_CadastroUsuarios);
  Application.CreateForm(TDataModule_Usuarios, DataModule_Usuarios);
  Application.Run;
end.
