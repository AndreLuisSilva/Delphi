object DataModule_Usuarios: TDataModule_Usuarios
  Height = 480
  Width = 640
  object Sql_Usuarios: TFDQuery
    Connection = DataModule_PgConexao.TFDConnection_PgConexao
    Left = 552
    Top = 392
  end
  object ClientDataSet_Usuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider_Usuarios'
    Left = 288
    Top = 392
    object ClientDataSet_Usuariosid: TWideStringField
      FieldName = 'id'
      Size = 36
    end
    object ClientDataSet_Usuariosnome: TWideStringField
      FieldName = 'nome'
      Size = 50
    end
    object ClientDataSet_Usuarioslogin: TWideStringField
      FieldName = 'login'
    end
    object ClientDataSet_Usuariossenha: TWideStringField
      FieldName = 'senha'
    end
    object ClientDataSet_Usuariosstatus: TWideStringField
      FieldName = 'status'
      Size = 1
    end
    object ClientDataSet_Usuariosdata: TDateField
      FieldName = 'data'
    end
  end
  object DataSetProvider_Usuarios: TDataSetProvider
    DataSet = Sql_Usuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 440
    Top = 392
  end
end