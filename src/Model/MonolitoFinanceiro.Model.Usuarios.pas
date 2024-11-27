unit MonolitoFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Model.Entidades.Usuarios,
  BCrypt;

type
  TDataModule_Usuarios = class(TDataModule)
    Sql_Usuarios: TFDQuery;
    ClientDataSet_Usuarios: TClientDataSet;
    DataSetProvider_Usuarios: TDataSetProvider;
    ClientDataSet_Usuariosnome: TWideStringField;
    ClientDataSet_Usuarioslogin: TWideStringField;
    ClientDataSet_Usuariossenha: TWideStringField;
    ClientDataSet_Usuariosstatus: TWideStringField;
    ClientDataSet_Usuariosdata: TDateField;
    ClientDataSet_Usuariosid: TLargeintField;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    FEntidadeUsuario: TModelEntidadeUsuario;
    { Private declarations }
  public
    { Public declarations }
    function temLoginCadastrado(Login : String; ID :Integer) : Boolean;
    procedure efetuarLogin(Usuario : String; Senha : String);
    function getUsuarioLogado: TModelEntidadeUsuario;
    procedure limparSenha(IDUsuario : Integer);
    procedure redefinirSenha(Usuario : TModelEntidadeUsuario);
    const SENHA_TEMP = '1234';
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
 LHash : String;

begin
 SQLConsulta := TFDQuery.Create(nil);
 try
  SQLConsulta.Connection := DataModule_PgConexao.TFDConnection_PgConexao;
  SQLConsulta.SQL.Clear;
  SQLConsulta.SQL.Add('SELECT * FROM usuarios WHERE login = :LOGIN');
  SQLConsulta.ParamByName('LOGIN').AsString := Usuario;
  SQLConsulta.Open();

  if SQLConsulta.IsEmpty then
    raise Exception.Create('Usuários ou senha inválidos!');

  if not TBCrypt.CompareHash(Senha, SQLConsulta.FieldByName('SENHA').AsString) then
    raise Exception.Create('Senha inválida!');

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

procedure TDataModule_Usuarios.limparSenha(IDUsuario: Integer);
var
  SQLQuery : TFDQuery;
begin
  SQLQuery := TFDQuery.Create(nil);
  try
    SQLQuery.Connection := DataModule_PgConexao.TFDConnection_PgConexao;
    SQLQuery.SQL.Clear;
    SQLQuery.SQL.Add('UPDATE usuarios SET senha_temporaria = :SENHA_TEMPORARIA, senha = :SENHA WHERE id = :ID');
    SQLQuery.ParamByName('SENHA_TEMPORARIA').AsString := 'S';
    SQLQuery.ParamByName('SENHA').AsString := TBCrypt.GenerateHash(SENHA_TEMP);
    SQLQuery.ParamByName('ID').AsInteger := IDUsuario;
    SQLQuery.ExecSQL;
  finally
    SQLQuery.Close;
    SQLQuery.Free;
  end;
end;

procedure TDataModule_Usuarios.redefinirSenha(Usuario: TModelEntidadeUsuario);
begin

end;

function TDataModule_Usuarios.temLoginCadastrado(Login: String; ID: Integer): Boolean;
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
      Result := SQLConsulta.FieldByName('ID').AsInteger <> ID;

  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;

end;

end.
