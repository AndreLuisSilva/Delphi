unit MonolitoFinanceiro.Model.Caixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModule_Caixa = class(TDataModule)
    Sql_Caixa: TFDQuery;
    ClientDataSet_Caixa: TClientDataSet;
    DataSetProvider_Caixa: TDataSetProvider;
    ClientDataSet_Caixaid: TLargeintField;
    ClientDataSet_Caixanumero_doc: TWideStringField;
    ClientDataSet_Caixadescricao: TWideStringField;
    ClientDataSet_Caixavalor: TFMTBCDField;
    ClientDataSet_Caixatipo: TWideStringField;
    ClientDataSet_Caixadata_cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule_Caixa: TDataModule_Caixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
