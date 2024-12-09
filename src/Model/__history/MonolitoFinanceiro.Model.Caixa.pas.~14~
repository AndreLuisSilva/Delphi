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
    ClientDataSet_Caixa_id: TLargeintField;
    ClientDataSet_Caixa_numero_doc: TWideStringField;
    ClientDataSet_Caixa_descricao: TWideStringField;
    ClientDataSet_Caixa_valor: TFMTBCDField;
    ClientDataSet_Caixa_tipo: TWideStringField;
    ClientDataSet_Caixa_data_cadastro: TDateField;

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
