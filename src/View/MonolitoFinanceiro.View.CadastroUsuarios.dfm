inherited Frm_CadastroUsuarios: TFrm_CadastroUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 21
  inherited Pnl_Principal: TCardPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited card_cadastros: TCard
      StyleElements = [seFont, seClient, seBorder]
      object lbl_Nome: TLabel [0]
        Left = 16
        Top = 56
        Width = 43
        Height = 21
        Caption = 'Nome'
      end
      object lbl_Login: TLabel [1]
        Left = 16
        Top = 112
        Width = 39
        Height = 21
        Caption = 'Login'
      end
      object lbl_Status: TLabel [2]
        Left = 17
        Top = 174
        Width = 42
        Height = 21
        Caption = 'Status'
      end
      inherited Panel1: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      object txt_Nome: TEdit
        Left = 65
        Top = 53
        Width = 240
        Height = 29
        TabOrder = 1
      end
      object txt_Login: TEdit
        Left = 65
        Top = 112
        Width = 152
        Height = 29
        TabOrder = 2
      end
      object tgl_Status: TToggleSwitch
        Left = 65
        Top = 174
        Width = 130
        Height = 23
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 3
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
          DataSource = DS_Grid_Usuarios
          PopupMenu = PopupMenu1
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Title.Caption = 'ID'
              Width = 132
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 328
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data'
              Title.Caption = ' Data Cadastro'
              Width = 118
              Visible = True
            end>
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    Left = 601
  end
  object DS_Grid_Usuarios: TDataSource
    DataSet = DataModule_Usuarios.ClientDataSet_Usuarios
    Left = 409
    Top = 409
  end
  object PopupMenu1: TPopupMenu
    Left = 506
    Top = 410
    object btn_Limpar_Senha: TMenuItem
      Caption = 'Limpar Senha'
      OnClick = btn_Limpar_SenhaClick
    end
  end
end
