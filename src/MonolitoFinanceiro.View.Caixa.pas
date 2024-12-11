unit MonolitoFinanceiro.View.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  MonolitoFinanceiro.View.CadastroPadrao, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPanels,
  MonolitoFinanceiro.Model.Caixa,
  MonolitoFinanceiro.Utilitarios;

type
  TFrm_Caixa = class(TFrm_CadastroPadrao)
    lbl_num_doc: TLabel;
    txt_num_doc: TEdit;
    lbl_descricao: TLabel;
    txt_descricao: TEdit;
    lbl_valor: TLabel;
    txt_valor: TEdit;
    tad_tipo: TRadioGroup;
    procedure btn_pesquisarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Pesquisar; override;
  end;

var
  Frm_Caixa: TFrm_Caixa;

implementation

{$R *.dfm}


{ TFrm_Caixa }

procedure TFrm_Caixa.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFrm_Caixa.Pesquisar;
var
  filtroPesquisa : String;
begin
    filtroPesquisa := Utilitario.LikeFind(txt_pesquisar.Text, DBGrid1);
    DataModule_Caixa.ClientDataSet_Caixa.Close;
    DataModule_Caixa.ClientDataSet_Caixa.CommandText := 'SELECT * FROM caixa ' + filtroPesquisa;
    DataModule_Caixa.ClientDataSet_Caixa.Open;
    inherited;
end;

end.