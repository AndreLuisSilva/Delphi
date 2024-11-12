unit MonolitoFinanceiro.Model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModule_PgConexao = class(TDataModule)
    TFDConnection_PgConexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    const ARQUIVOCFG = 'ini.cfg';
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarConfiguracoes;
    procedure Conectar;
    procedure Desconectar;
  end;

var
  DataModule_PgConexao: TDataModule_PgConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TFrm_PgSqlConexao }

procedure TDataModule_PgConexao.CarregarConfiguracoes;
var
  ParametroNome : String;
  ParametroValor : String;
  Contador : Integer;
  ListaParametros : TStringList;

begin

  TFDConnection_PgConexao.Params.Clear;

  if not FileExists(ARQUIVOCFG) then
    raise Exception.Create('Arquivo de configura��o n�o encontrado!');
  ListaParametros := TStringlist.Create;

  try
    ListaParametros.LoadFromFile(ARQUIVOCFG);

    for Contador := 0 to Pred(ListaParametros.Count) do
    begin
      if ListaParametros[Contador].IndexOf('=') > 0 then
      begin
        ParametroNome := ListaParametros[Contador].Split(['='])[0].Trim;
        ParametroValor := ListaParametros[Contador].Split(['='])[1].Trim;
        TFDConnection_PgConexao.Params.Add(ParametroNome + '=' + ParametroValor);
      end;
    end;

  finally
     ListaParametros.Free;
  end;
end;

procedure TDataModule_PgConexao.Conectar;
begin
  TFDConnection_PgConexao.Connected;
end;

procedure TDataModule_PgConexao.DataModuleCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
  Conectar;
end;

procedure TDataModule_PgConexao.Desconectar;
begin
  TFDConnection_PgConexao.Connected := False;
end;

end.
