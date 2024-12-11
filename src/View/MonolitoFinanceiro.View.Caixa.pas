unit MonolitoFinanceiro.View.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.WinXPanels,
  MonolitoFinanceiro.View.CadastroPadrao,
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
    rad_tipo: TRadioGroup;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);

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

procedure TFrm_Caixa.btn_alterarClick(Sender: TObject);
begin
  inherited;
  txt_num_doc.Text := DataModule_Caixa.ClientDataSet_Caixanumero_doc.AsString;
  txt_descricao.Text := DataModule_Caixa.ClientDataSet_Caixadescricao.AsString;
  txt_valor.Text := DataModule_Caixa.ClientDataSet_Caixavalor.AsString;

  if DataModule_Caixa.ClientDataSet_Caixatipo.AsString = 'R' then
    rad_tipo.ItemIndex := 0
  else
    rad_tipo.ItemIndex := 1;
end;

procedure TFrm_Caixa.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFrm_Caixa.btn_salvarClick(Sender: TObject);
var
  LTipo : String;
begin

  DataModule_Caixa.ClientDataSet_Caixa.Edit;

  if Trim(txt_num_doc.Text) = '' then
     begin
       txt_num_doc.SetFocus;
       Application.MessageBox('O campo N� n�o poder vazio!', 'Aten��o', MB_OK + MB_ICONWARNING);
       Abort;
     end;

  if Trim(txt_valor.Text) = '' then
     begin
       txt_valor.SetFocus;
       Application.MessageBox('O campo valor n�o poder vazio!', 'Aten��o', MB_OK + MB_ICONWARNING);
       Abort;
     end;

  if rad_tipo.ItemIndex = -1 then
  begin
    rad_tipo.SetFocus;
    Application.MessageBox('Selecione um tipo!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  LTipo := 'D';
  if rad_tipo.ItemIndex = 0 then
  LTipo:= 'R';

  if DataSource1.State in [dsInsert] then
    begin
      DataModule_Caixa.ClientDataSet_Caixadata_cadastro.AsDateTime := Now;
    end;

  DataModule_Caixa.ClientDataSet_Caixanumero_doc.AsWideString := Trim(txt_num_doc.Text);
  DataModule_Caixa.ClientDataSet_Caixadescricao.AsWideString := Trim(txt_descricao.Text);
  DataModule_Caixa.ClientDataSet_Caixavalor.AsCurrency := StrToFloat(txt_valor.Text);
  DataModule_Caixa.ClientDataSet_Caixatipo.AsString := LTipo;

  inherited;

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
