unit MonolitoFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MonolitoFinanceiro.Model.Conexao;

type
  TDataModule_Usuarios = class(TDataModule)
    Sql_Usuarios: TFDQuery;
    ClientDataSet_Usuarios: TClientDataSet;
    DataSetProvider_Usuarios: TDataSetProvider;
    ClientDataSet_Usuariosid: TWideStringField;
    ClientDataSet_Usuariosnome: TWideStringField;
    ClientDataSet_Usuarioslogin: TWideStringField;
    ClientDataSet_Usuariossenha: TWideStringField;
    ClientDataSet_Usuariosstatus: TWideStringField;
    ClientDataSet_Usuariosdata: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
    function temLoginCadastrado(Login : String; ID :string) : Boolean;
  end;

var
  DataModule_Usuarios: TDataModule_Usuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule_Usuarios }

function TDataModule_Usuarios.temLoginCadastrado(Login, ID: string): Boolean;
var
  SQLConsulta : TFDQuery;
begin
  Result := False;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := DataModule_PgConexao.TFDConnection_PgConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT id FROM usuarios WHERE login = :LOGIN');
    SQLConsulta.ParamByName('LOGIN').AsString := Login;
    SQLConsulta.Open();

    if not SQLConsulta.IsEmpty then
      Result := SQLConsulta.FieldByName('ID').AsString <> ID;

  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;

end;

end.
