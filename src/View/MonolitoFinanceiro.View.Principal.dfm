object Frm_Principal: TFrm_Principal
  Left = 0
  Top = 0
  Caption = 'Monolito Financeiro'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 21
  object MainMenu: TMainMenu
    Left = 576
    Top = 384
    object main_cadastros: TMenuItem
      Caption = 'Cadastros'
      object menu_usuarios: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = menu_usuariosClick
      end
    end
    object main_relatorios: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object main_ajuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
end