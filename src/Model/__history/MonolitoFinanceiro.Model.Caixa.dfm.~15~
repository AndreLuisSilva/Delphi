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
    object ClientDataSet_Caixa_id: TLargeintField
      FieldName = '_id'
    end
    object ClientDataSet_Caixa_numero_doc: TWideStringField
      FieldName = '_numero_doc'
    end
    object ClientDataSet_Caixa_descricao: TWideStringField
      FieldName = '_descricao'
      Size = 200
    end
    object ClientDataSet_Caixa_valor: TFMTBCDField
      FieldName = '_valor'
      Size = 18
    end
    object ClientDataSet_Caixa_tipo: TWideStringField
      FieldName = '_tipo'
      Size = 1
    end
    object ClientDataSet_Caixa_data_cadastro: TDateField
      FieldName = '_data_cadastro'
    end
  end
  object DataSetProvider_Caixa: TDataSetProvider
    DataSet = Sql_Caixa
    Left = 432
    Top = 392
  end
end
