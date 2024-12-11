object DataModule_Caixa: TDataModule_Caixa
  Height = 480
  Width = 640
  object Sql_Caixa: TFDQuery
    Connection = DataModule_PgConexao.TFDConnection_PgConexao
    Left = 544
    Top = 392
  end
  object ClientDataSet_Caixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Caixa'
    Left = 288
    Top = 392
    object ClientDataSet_Caixaid: TLargeintField
      FieldName = 'id'
    end
    object ClientDataSet_Caixanumero_doc: TWideStringField
      FieldName = 'numero_doc'
    end
    object ClientDataSet_Caixadescricao: TWideStringField
      FieldName = 'descricao'
      Size = 200
    end
    object ClientDataSet_Caixavalor: TFMTBCDField
      FieldName = 'valor'
      Size = 18
    end
    object ClientDataSet_Caixatipo: TWideStringField
      FieldName = 'tipo'
      Size = 1
    end
    object ClientDataSet_Caixadata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
  end
  object DataSetProvider_Caixa: TDataSetProvider
    DataSet = Sql_Caixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 432
    Top = 392
  end
end
