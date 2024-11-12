unit MonolitoFinanceiro.Utilitarios;

interface
type
   Utilitario = class

   class function GetID : string;
   end;
implementation

uses
  System.SysUtils;

{ Utilitario }

class function Utilitario.Getid: string;
begin
  Result := TGUID.NewGuid.ToString;
  Result := StringReplace(Result, '{', '',[rfReplaceAll]);
  Result := StringReplace(Result, '}', '',[rfReplaceAll]);
end;

end.
