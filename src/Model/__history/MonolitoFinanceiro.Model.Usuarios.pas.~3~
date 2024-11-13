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
  end;

var
  DataModule_Usuarios: TDataModule_Usuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
