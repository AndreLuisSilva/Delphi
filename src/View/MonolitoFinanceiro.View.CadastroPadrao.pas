unit MonolitoFinanceiro.View.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXPanels, System.ImageList, Vcl.ImgList, DBClient, Vcl.WinXCtrls,
  MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Utilitarios;

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
    DataSource1: TDataSource;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure habilitarBotoes;
    procedure limpar_Campos();
  public
    { Public declarations }
  protected
    { Metodo para ser usado p/ pesquisar e sobrescrever de onde for chamado no projeto}
    procedure Pesquisar; virtual;
  end;

var
  Frm_CadastroPadrao: TFrm_CadastroPadrao;

implementation

{$R *.dfm}

procedure TFrm_CadastroPadrao.btn_alterarClick(Sender: TObject);
begin
  TClientDataSet(DataSource1.DataSet).Edit;
  Pnl_Principal.ActiveCard := card_cadastros;
end;

procedure TFrm_CadastroPadrao.btn_cancelarClick(Sender: TObject);
begin
  TClientDataSet(DataSource1.DataSet).Cancel;
  Pnl_Principal.ActiveCard := card_pesquisa;
end;

procedure TFrm_CadastroPadrao.btn_excluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    TClientDataSet(DataSource1.DataSet).Delete;
    TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
    Application.MessageBox('Registro exclu�do com sucesso!', 'Aten��o', MB_OK + MB_ICONINFORMATION);

    Except on E : Exception do
    Application.MessageBox(PWideChar(E.Message), 'Erro ao tentar excluir registro!', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFrm_CadastroPadrao.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_CadastroPadrao.btn_incluirClick(Sender: TObject);
begin
   Pnl_Principal.ActiveCard := card_cadastros;
   TClientDataSet(DataSource1.DataSet).Insert;
   limpar_Campos;
end;

procedure TFrm_CadastroPadrao.btn_salvarClick(Sender: TObject);
var
  Mensagem : String;
begin
  Mensagem := 'Registro alterado com sucesso!';
  if DataSource1.State in [dsInsert] then
    Mensagem := 'Registro inclu�do com sucesso!';

  TClientDataSet(DataSource1.DataSet).Post;
  TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
  Application.MessageBox(PWideChar(Mensagem), 'Aten��o', MB_OK + MB_ICONINFORMATION);
  Pesquisar;
  Pnl_Principal.ActiveCard := card_pesquisa;
end;

procedure TFrm_CadastroPadrao.FormShow(Sender: TObject);
begin
  Pnl_Principal.ActiveCard := card_pesquisa;
  Pesquisar;
  Utilitario.DimensionarGrid(DBGrid1);
end;

procedure TFrm_CadastroPadrao.habilitarBotoes;
begin
  btn_excluir.Enabled := not DataSource1.DataSet.IsEmpty;
  btn_alterar.Enabled := not DataSource1.DataSet.IsEmpty;
end;

procedure TFrm_CadastroPadrao.limpar_Campos;
var contador : Integer;
begin
  for contador := 0 to Pred(ComponentCount) do
  begin
    if Components[contador] is TCustomEdit then
      TCustomEdit(Components[contador]).Clear
    else if Components[contador] is TToggleSwitch then
      TToggleSwitch(Components[contador]).State := tssOn;
  end;
end;

procedure TFrm_CadastroPadrao.Pesquisar;
begin
  habilitarBotoes;
end;

end.
