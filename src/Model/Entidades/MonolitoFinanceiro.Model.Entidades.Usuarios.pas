unit MonolitoFinanceiro.Model.Entidades.Usuarios;

interface
type
  TModelEntidadeUsuario = class
private
    FnomeUsuarioLogado: String;
    FloginUsuarioLogado: String;
    FidUsuarioLogado: String;
    FsenhaUsuarioLogado: String;
    FsenhaTemporaria: Boolean;
    procedure SetnomeUsuarioLogado(const Value: String);
    procedure SetidUsuarioLogado(const Value: String);
    procedure SetloginUsuarioLogado(const Value: String);
    procedure SetsenhaUsuarioLogado(const Value: String);
    procedure SetsenhaTemporaria(const Value: Boolean);
public
   property nomeUsuarioLogado : String read FnomeUsuarioLogado write SetnomeUsuarioLogado;
   property loginUsuarioLogado : String read FloginUsuarioLogado write SetloginUsuarioLogado;
   property idUsuarioLogado : String read FidUsuarioLogado write SetidUsuarioLogado;
   property senhaUsuarioLogado : String read FsenhaUsuarioLogado write SetsenhaUsuarioLogado;
   property senhaTemporaria : Boolean read FsenhaTemporaria write SetsenhaTemporaria;
end;
implementation

{ TModelEntidadeUsuario }

procedure TModelEntidadeUsuario.SetidUsuarioLogado(const Value: String);
begin
  FidUsuarioLogado := Value;
end;

procedure TModelEntidadeUsuario.SetloginUsuarioLogado(const Value: String);
begin
  FloginUsuarioLogado := Value;
end;

procedure TModelEntidadeUsuario.SetnomeUsuarioLogado(const Value: String);
begin
  FnomeUsuarioLogado := Value;
end;

procedure TModelEntidadeUsuario.SetsenhaTemporaria(const Value: Boolean);
begin
  FsenhaTemporaria := Value;
end;

procedure TModelEntidadeUsuario.SetsenhaUsuarioLogado(const Value: String);
begin
  FsenhaUsuarioLogado := Value;
end;

end.
