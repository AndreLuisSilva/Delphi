unit MonolitoFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrm_Splash = class(TForm)
    pnl_splash: TPanel;
    img_logo: TImage;
    ProgressBar1: TProgressBar;
    lbl_logo: TLabel;
    lbl_status: TLabel;
    Timer1: TTimer;
    img_dll: TImage;
    img_bancoDeDados: TImage;
    img_configuracoes: TImage;
    img_iniciando: TImage;
    procedure Timer1Timer(Sender: TObject);

  private
    procedure AtualizarStatusIcones(Mensagem : String; imagem : TImage);

  public
    { Public declarations }
  end;

var
  Frm_Splash: TFrm_Splash;

implementation

{$R *.dfm}

procedure TFrm_Splash.AtualizarStatusIcones(Mensagem: String; Imagem: TImage);
begin
  lbl_status.Caption := Mensagem;
  Imagem.Visible := True;
end;

procedure TFrm_Splash.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position <= 100  then
  begin
    ProgressBar1.StepIt;
    case ProgressBar1.Position of
      10 : AtualizarStatusIcones('Carregando dependências...', img_dll);
      25 : AtualizarStatusIcones('Conectando ao banco de dados...', img_bancoDeDados);
      45 : AtualizarStatusIcones('Carregando as configurações...', img_configuracoes);
      75 : AtualizarStatusIcones('Iniciando o sistema...', img_iniciando);
    end;
  end;
  if ProgressBar1.Position = 100 then
    Close;
end;

end.
