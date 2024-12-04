unit MonolitoFinanceiro.Model.Sistema;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, Vcl.Forms;

type
  TDataModule_Sistema = class(TDataModule)
  private
    { Private declarations }
    function getConfiguracao(Secao, Parametro, ValorPadrao : String) : String;
    procedure setConfiguracao(Secao, Parametro, Valor : String);
    const ARQUIVOCFG = 'ini.cfg';
  public
    { Public declarations }
    function dataUltimoAcesso : String; overload;
    procedure dataUltimoAcesso(aValue : TDatetime); overload;
    function usuarioUltimoAcesso : String; overload;
    procedure usuarioUltimoAcesso(aValue : String) overload;
  end;

var
  DataModule_Sistema: TDataModule_Sistema;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TDataModule_Sistema.dataUltimoAcesso: String;
begin
  Result := getConfiguracao('ACESSO', 'Data', '');
end;

procedure TDataModule_Sistema.dataUltimoAcesso(aValue: TDatetime);
begin
  setConfiguracao('ACESSO', 'Data', DateTimeToStr(aValue));
end;

function TDataModule_Sistema.getConfiguracao(Secao, Parametro, ValorPadrao: String): String;
var
  LArquivoConfig : TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVOCFG);
  try
    Result := LArquivoConfig.ReadString(Secao, Parametro, ValorPadrao);
  finally
    LArquivoConfig.Free;
  end;
end;

procedure TDataModule_Sistema.setConfiguracao(Secao, Parametro, Valor: String);
var
  LArquivoConfig : TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVOCFG);
  try
    LArquivoConfig.WriteString(Secao, Parametro, Valor);
  finally
    LArquivoConfig.Free;
  end;
end;

function TDataModule_Sistema.usuarioUltimoAcesso: String;
begin
  Result := getConfiguracao('ACESSO', 'Usuario', '');
end;

procedure TDataModule_Sistema.usuarioUltimoAcesso(aValue: String);
begin
  setConfiguracao('ACESSO', 'Usuario', aValue);
end;

end.
