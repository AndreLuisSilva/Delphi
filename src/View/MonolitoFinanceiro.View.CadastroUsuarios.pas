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
    tgl_Status: TToggleSwitch;
    lbl_Nome: TLabel;
    lbl_Login: TLabel;
    lbl_Status: TLabel;
    PopupMenu1: TPopupMenu;
    btn_Limpar_Senha: TMenuItem;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_Limpar_SenhaClick(Sender: TObject);
                                                          private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Pesquisar; override;
  end;

var
  Frm_CadastroUsuarios: TFrm_CadastroUsuarios;

implementation

{$R *.dfm}

 (*Funçaõ botão cadastrar usuários*)
procedure TFrm_CadastroUsuarios.btn_alterarClick(Sender: TObject);
begin
  inherited;

  txt_Nome.Text := DataModule_Usuarios.ClientDataSet_Usuariosnome.AsString;
  txt_Login.Text := DataModule_Usuarios.ClientDataSet_Usuarioslogin.AsString;

  tgl_Status.State := tssOn;

  if DataModule_Usuarios.ClientDataSet_Usuariosstatus.AsString = 'B' then
    tgl_Status.State := tssOff;
end;

procedure TFrm_CadastroUsuarios.btn_Limpar_SenhaClick(Sender: TObject);
begin
  inherited;
    if not DataSource1.DataSet.IsEmpty then
    begin
      DataModule_Usuarios.limparSenha(DataSource1.DataSet.FieldByName('ID').AsInteger);
      Application.MessageBox(PWideChar(Format('Foi definida a senha padrão para o usuário "%s"',
      [DataSource1.DataSet.FieldByName('NOME').AsString])), 'Atenção', MB_OK + MB_ICONWARNING);
    end;
end;

procedure TFrm_CadastroUsuarios.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFrm_CadastroUsuarios.btn_salvarClick(Sender: TObject);
var
  Status : String;
begin

  DataModule_Usuarios.ClientDataSet_Usuarios.Edit;

  if Trim(txt_Nome.Text) = '' then
     begin
       txt_Nome.SetFocus;
       Application.MessageBox('O campo nome não poder vazio!', 'Atenção', MB_OK + MB_ICONWARNING);
       Abort;
     end;

  if Trim(txt_Login.Text) = '' then
     begin
       txt_Login.SetFocus;
       Application.MessageBox('O campo LOGIN não poder vazio!', 'Atenção', MB_OK + MB_ICONWARNING);
       Abort;
     end;

  if DataModule_Usuarios.temLoginCadastrado(Trim(txt_Login.Text), DataModule_Usuarios.ClientDataSet_Usuarios.FieldByName('ID').AsInteger) then
    begin
      txt_Login.SetFocus;
      Application.MessageBox(PWideChar(Format('O login %s já se encontra cadastrado!', [txt_Login.Text])), 'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
    end;

  Status := 'A';

  if tgl_Status.State = tssOff then
    Status := 'B';

  if DataModule_Usuarios.ClientDataSet_Usuarios.State in [dsInsert] then
  begin
    DataModule_Usuarios.ClientDataSet_Usuariosdata.AsDateTime := Now;
    DataModule_Usuarios.ClientDataSet_Usuariossenha.AsString := TBCrypt.GenerateHash(DataModule_Usuarios.SENHA_TEMP);
    DataModule_Usuarios.ClientDataSet_Usuariossenha_temporaria.AsWideString := 'S';
  end;

  DataModule_Usuarios.ClientDataSet_Usuariosnome.AsString := Trim(txt_Nome.Text);
  DataModule_Usuarios.ClientDataSet_Usuarioslogin.AsString := Trim(txt_Login.Text);
  DataModule_Usuarios.ClientDataSet_Usuariosstatus.AsString := Status;

  inherited;
end;

procedure TFrm_CadastroUsuarios.Pesquisar;
var
  filtroPesquisa : String;
begin
    filtroPesquisa := Utilitario.LikeFind(txt_pesquisar.Text, DBGrid1);
    DataModule_Usuarios.ClientDataSet_Usuarios.Close;
    DataModule_Usuarios.ClientDataSet_Usuarios.CommandText := 'SELECT * FROM usuarios ' + filtroPesquisa;
    DataModule_Usuarios.ClientDataSet_Usuarios.Open;
    inherited;
end;

end.
