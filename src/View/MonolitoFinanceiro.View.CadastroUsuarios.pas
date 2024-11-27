unit MonolitoFinanceiro.View.CadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls,
  MonolitoFinanceiro.View.CadastroPadrao,
  MonolitoFinanceiro.Model.Usuarios,
  MonolitoFinanceiro.Utilitarios,
  BCrypt, Vcl.Menus;

type
  TFrm_CadastroUsuarios = class(TFrm_CadastroPadrao)
    DS_Grid_Usuarios: TDataSource;
    txt_Nome: TEdit;
    txt_Login: TEdit;
    txt_Senha: TEdit;
    tgl_Status: TToggleSwitch;
    lbl_Nome: TLabel;
    lbl_Login: TLabel;
    lbl_Senha: TLabel;
    lbl_Status: TLabel;
    PopupMenu1: TPopupMenu;
    btn_Limpar_Senha: TMenuItem;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure limpar_Campos();
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_Limpar_SenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroUsuarios: TFrm_CadastroUsuarios;

implementation

{$R *.dfm}

 (*Fun�a� bot�o cadastrar usu�rios*)
procedure TFrm_CadastroUsuarios.btn_alterarClick(Sender: TObject);
begin
  inherited;

  txt_Nome.Text := DataModule_Usuarios.ClientDataSet_Usuariosnome.AsString;
  txt_Login.Text := DataModule_Usuarios.ClientDataSet_Usuarioslogin.AsString;
  txt_Senha.Text := DataModule_Usuarios.ClientDataSet_Usuariossenha.AsString;
  tgl_Status.State := tssOn;
  (**)
  if DataModule_Usuarios.ClientDataSet_Usuariosstatus.AsString = 'B' then
    tgl_Status.State := tssOff;

end;

procedure TFrm_CadastroUsuarios.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  DataModule_Usuarios.ClientDataSet_Usuarios.Cancel;
end;

procedure TFrm_CadastroUsuarios.btn_excluirClick(Sender: TObject);
begin
  inherited;
    if Application.MessageBox('Deseja realmente excluir o registro?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) <> mrYes then
      exit;

     try
      DataModule_Usuarios.ClientDataSet_Usuarios.Delete;
      DataModule_Usuarios.ClientDataSet_Usuarios.ApplyUpdates(0);
      Application.MessageBox('Registro exclu�do com sucesso!', 'Aten��o', MB_OK + MB_ICONINFORMATION);
     Except on E : Exception do
      Application.MessageBox(PWideChar(E.Message), 'Erro ao tentar excluir registro!', MB_OK + MB_ICONERROR);
     end;

end;

procedure TFrm_CadastroUsuarios.btn_incluirClick(Sender: TObject);
begin
  inherited;

  limpar_Campos;
  DataModule_Usuarios.ClientDataSet_Usuarios.Insert;

end;

procedure TFrm_CadastroUsuarios.btn_Limpar_SenhaClick(Sender: TObject);
begin
  inherited;
    if not DS_Grid_Usuarios.DataSet.IsEmpty then
    begin
      DataModule_Usuarios.limparSenha(DS_Grid_Usuarios.DataSet.FieldByName('ID').AsInteger);

      Application.MessageBox(PWideChar(Format('Foi definida a senha padr�o para o usu�rio "%s"',
      [DS_Grid_Usuarios.DataSet.FieldByName('NOME').AsString])), 'Aten��o', MB_OK + MB_ICONWARNING);

    end;

end;

procedure TFrm_CadastroUsuarios.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  DataModule_Usuarios.ClientDataSet_Usuarios.Close;
  DataModule_Usuarios.ClientDataSet_Usuarios.CommandText := 'SELECT * FROM usuarios';
  DataModule_Usuarios.ClientDataSet_Usuarios.Open;
  //  DataModule_Usuarios.Sql_Usuarios.SQL.Clear;
  //  DataModule_Usuarios.Sql_Usuarios.SQL.Add('SELECT * FROM usuarios');
  //  DataModule_Usuarios.Sql_Usuarios.Open;
end;

procedure TFrm_CadastroUsuarios.btn_salvarClick(Sender: TObject);
var
  LHash : String;
  Mensagem : String;
  Status : String;    //Variavel para controle do status do usu�rio
begin
  inherited;

  DataModule_Usuarios.ClientDataSet_Usuarios.Edit;   //define dataset em modo de edi��o

  //-------------------Validar campos de texto vazio--------------------
  if Trim(txt_Nome.Text) = '' then
     begin
       txt_Nome.SetFocus;
       Application.MessageBox('O campo nome n�o poder vazio!', 'Aten��o', MB_OK + MB_ICONWARNING);
       Abort;
     end;

  if Trim(txt_Login.Text) = '' then
     begin
       txt_Login.SetFocus;
       Application.MessageBox('O campo LOGIN n�o poder vazio!', 'Aten��o', MB_OK + MB_ICONWARNING);
       Abort;
     end;

  if Trim(txt_Senha.Text) = '' then
     begin
       txt_Senha.SetFocus;
       Application.MessageBox('O campo senha n�o poder vazio!', 'Aten��o', MB_OK + MB_ICONWARNING);
       Abort;
     end;
  //-------------------------------------------------------------------
  if DataModule_Usuarios.temLoginCadastrado(Trim(txt_Login.Text), DataModule_Usuarios.ClientDataSet_Usuarios.FieldByName('ID').AsInteger) then
    begin
      txt_Login.SetFocus;
      Application.MessageBox(PWideChar(Format('O login %s j� se encontra cadastrado!', [txt_Login.Text])), 'Aten��o', MB_OK + MB_ICONWARNING);
      Abort;
    end;
  //---------valida o estado do usu�rio(ativado ou bloqueado)----------
  Status := 'A';

  if tgl_Status.State = tssOff then
    Status := 'B';

  Mensagem := 'Registro alterado com sucesso!';

  if DataModule_Usuarios.ClientDataSet_Usuarios.State in [dsInsert] then
  begin
    Mensagem := 'Registro inclu�do com sucesso!';

    DataModule_Usuarios.ClientDataSet_Usuariosid.AsString := Utilitario.GetID;
    DataModule_Usuarios.ClientDataSet_Usuariosdata.AsDateTime := Now;
  end;

 //---------------------------------------------------------------------

 //--------------Altera valores dos campos de texto com os dados do-----
 //--------------dataset da linha selecionada no grid-------------------

  LHash := TBCrypt.GenerateHash(Trim(txt_Senha.Text));

  DataModule_Usuarios.ClientDataSet_Usuariosnome.AsString := Trim(txt_Nome.Text);
  DataModule_Usuarios.ClientDataSet_Usuarioslogin.AsString := Trim(txt_Login.Text);
  DataModule_Usuarios.ClientDataSet_Usuariossenha.AsString := LHash;
  DataModule_Usuarios.ClientDataSet_Usuariosstatus.AsString := Status;
 //----------------------------------------------------------------------

 //
 DataModule_Usuarios.ClientDataSet_Usuarios.Post;
 DataModule_Usuarios.ClientDataSet_Usuarios.ApplyUpdates(0);
 Application.MessageBox(PWideChar(Mensagem), 'Aten��o', MB_OK + MB_ICONINFORMATION);

 Pnl_Principal.ActiveCard := card_pesquisa;
end;

procedure TFrm_CadastroUsuarios.limpar_Campos;
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

end.
