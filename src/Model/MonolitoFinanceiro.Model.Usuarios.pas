unit MonolitoFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Model.Entidades.Usuarios;

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
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FEntidadeUsuario: TModelEntidadeUsuario;
    { Private declarations }
  public
    { Public declarations }
    function temLoginCadastrado(Login : String; ID :string) : Boolean;
    procedure efetuarLogin(Usuario : String; Senha : String);
    function getUsuarioLogado: TModelEntidadeUsuario;
  end;
var
  DataModule_Usuarios: TDataModule_Usuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule_Usuarios }

procedure TDataModule_Usuarios.DataModuleCreate(Sender: TObject);
begin
  FEntidadeUsuario := TModelEntidadeUsuario.Create;
end;

procedure TDataModule_Usuarios.DataModuleDestroy(Sender: TObject);
begin
  FEntidadeUsuario.Free;
end;

procedure TDataModule_Usuarios.efetuarLogin(Usuario, Senha: String);
var
 SQLConsulta : TFDQuery;
begin
 SQLConsulta := TFDQuery.Create(nil);
 try
  SQLConsulta.Connection := DataModule_PgConexao.TFDConnection_PgConexao;
  SQLConsulta.SQL.Clear;
  SQLConsulta.SQL.Add('SELECT * FROM usuarios WHERE login = :LOGIN AND senha = :SENHA');
  SQLConsulta.ParamByName('LOGIN').AsString := Usuario;
  SQLConsulta.ParamByName('SENHA').AsString := Senha;
  SQLConsulta.Open();

  if SQLConsulta.IsEmpty then
    raise Exception.Create('Usuários ou senha inválidos!');
  if SQLConsulta.FieldByName('STATUS').AsString <> 'A' then
    raise Exception.Create('Usuário bloqueado, favor entrar em contato com o administrador!');

  FEntidadeUsuario.idUsuarioLogado := SQLConsulta.FieldByName('ID').AsString;
  FEntidadeUsuario.nomeUsuarioLogado := SQLConsulta.FieldByName('NOME').AsString;
  FEntidadeUsuario.loginUsuarioLogado := SQLConsulta.FieldByName('LOGIN').AsString;
 finally
  SQLConsulta.Close;
  SQLConsulta.Free;
 end;
end;

function TDataModule_Usuarios.getUsuarioLogado: TModelEntidadeUsuario;
begin
  Result := FEntidadeUsuario;
end;

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
