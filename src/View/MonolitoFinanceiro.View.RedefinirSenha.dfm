object Frm_RedefinirSenha: TFrm_RedefinirSenha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Redefinir Senha'
  ClientHeight = 318
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object pnl_principal: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 318
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnl_top: TPanel
      Left = 0
      Top = 0
      Width = 451
      Height = 83
      Align = alTop
      BevelOuter = bvNone
      Color = clOrange
      ParentBackground = False
      TabOrder = 0
      object lbl_usuario: TLabel
        Left = 0
        Top = 0
        Width = 451
        Height = 40
        Align = alTop
        Alignment = taCenter
        Caption = 'USU'#193'RIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -29
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitTop = 9
        ExplicitWidth = 123
      end
      object lbl_texto: TLabel
        Left = 0
        Top = 40
        Width = 451
        Height = 21
        Align = alTop
        Alignment = taCenter
        Caption = 'Informe a sua nova senha.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitTop = 45
        ExplicitWidth = 188
      end
    end
    object pnl_center: TPanel
      Left = 0
      Top = 83
      Width = 451
      Height = 145
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lbl_senha: TLabel
        Left = 72
        Top = 14
        Width = 52
        Height = 25
        Caption = 'Senha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_confirmar_senha: TLabel
        Left = 72
        Top = 79
        Width = 142
        Height = 25
        Caption = 'Confirmar senha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txt_senha: TEdit
        Left = 72
        Top = 45
        Width = 306
        Height = 23
        PasswordChar = '*'
        TabOrder = 0
      end
      object txt_confirmar_senha: TEdit
        Left = 72
        Top = 104
        Width = 306
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
      end
    end
    object pnl_bottom: TPanel
      Left = 0
      Top = 228
      Width = 451
      Height = 103
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object btn_confirmar: TButton
        Left = 72
        Top = 24
        Width = 130
        Height = 46
        Caption = 'Confirmar'
        TabOrder = 0
        OnClick = btn_confirmarClick
      end
      object btn_cancelar: TButton
        Left = 248
        Top = 24
        Width = 130
        Height = 46
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btn_cancelarClick
      end
    end
  end
end
