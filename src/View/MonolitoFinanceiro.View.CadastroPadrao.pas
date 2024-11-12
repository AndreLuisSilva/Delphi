unit MonolitoFinanceiro.View.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXPanels, System.ImageList, Vcl.ImgList;

type
  TFrm_CadastroPadrao = class(TForm)
    Pnl_Principal: TCardPanel;
    card_cadastros: TCard;
    card_pesquisa: TCard;
    pnl_pesquisar: TPanel;
    pnl_botoes: TPanel;
    pnl_grid: TPanel;
    txt_pesquisar: TEdit;
    lbl_pesquisar: TLabel;
    btn_pesquisar: TButton;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    btn_fechar: TButton;
    btn_imprimir: TButton;
    btn_incluir: TButton;
    btn_alterar: TButton;
    btn_excluir: TButton;
    Panel1: TPanel;
    btn_cancelar: TButton;
    btn_salvar: TButton;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroPadrao: TFrm_CadastroPadrao;

implementation

{$R *.dfm}

procedure TFrm_CadastroPadrao.btn_alterarClick(Sender: TObject);
begin
  Pnl_Principal.ActiveCard := card_cadastros;
end;

procedure TFrm_CadastroPadrao.btn_cancelarClick(Sender: TObject);
begin
  Pnl_Principal.ActiveCard := card_pesquisa;
end;

procedure TFrm_CadastroPadrao.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_CadastroPadrao.btn_incluirClick(Sender: TObject);
begin
   Pnl_Principal.ActiveCard := card_cadastros;
end;

procedure TFrm_CadastroPadrao.FormShow(Sender: TObject);
begin
  Pnl_Principal.ActiveCard := card_pesquisa;
end;

end.