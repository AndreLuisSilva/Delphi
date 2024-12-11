inherited Frm_Caixa: TFrm_Caixa
  Caption = 'Caixa'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 21
  inherited Pnl_Principal: TCardPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited card_cadastros: TCard
      StyleElements = [seFont, seClient, seBorder]
      object lbl_num_doc: TLabel [0]
        Left = 16
        Top = 24
        Width = 126
        Height = 21
        Caption = 'N'#186' do Documento'
      end
      object lbl_descricao: TLabel [1]
        Left = 16
        Top = 72
        Width = 67
        Height = 21
        Caption = 'Descri'#231#227'o'
      end
      object lbl_valor: TLabel [2]
        Left = 16
        Top = 120
        Width = 36
        Height = 21
        Caption = 'Valor'
      end
      inherited Panel1: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      object txt_num_doc: TEdit
        Left = 160
        Top = 21
        Width = 281
        Height = 29
        TabOrder = 1
      end
      object txt_descricao: TEdit
        Left = 160
        Top = 69
        Width = 281
        Height = 29
        TabOrder = 2
      end
      object txt_valor: TEdit
        Left = 160
        Top = 117
        Width = 281
        Height = 29
        TabOrder = 3
      end
      object tad_tipo: TRadioGroup
        Left = 16
        Top = 168
        Width = 425
        Height = 105
        Caption = 'Tipo'
        Columns = 2
        Items.Strings = (
          'Receita'
          'Despesa')
        TabOrder = 4
      end
    end
    inherited card_pesquisa: TCard
      StyleElements = [seFont, seClient, seBorder]
      inherited pnl_pesquisar: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited lbl_pesquisar: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited txt_pesquisar: TEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited btn_pesquisar: TButton
          OnClick = btn_pesquisarClick
        end
      end
      inherited pnl_botoes: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited pnl_grid: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited DBGrid1: TDBGrid
          DataSource = DataSource1
          Columns = <
            item
              Expanded = False
              FieldName = '_numero_doc'
              Title.Caption = 'N'#186' Documento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = '_descricao'
              Title.Caption = 'Descri'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = '_valor'
              Title.Caption = 'Valor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = '_tipo'
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = '_data_cadastro'
              Title.Caption = 'Data Cadastro'
              Visible = True
            end>
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = DataModule_Caixa.ClientDataSet_Caixa
  end
end