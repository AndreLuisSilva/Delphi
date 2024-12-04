unit MonolitoFinanceiro.Utilitarios;

interface

uses
Vcl.DBGrids;
type
   Utilitario = class

   class function GetID : string;
   class function LikeFind(Pesquisa : String; Grid : TDBGrid) : String;
   class function IsNumeric(S : String) : Boolean;
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

class function Utilitario.IsNumeric(S: String): Boolean;
begin
  Result := True;
  Try
    StrToInt(S);
  Except
    Result := False;
end;
end;

class function Utilitario.LikeFind(Pesquisa: String; Grid: TDBGrid): String;
var
  contador, cod : Integer;
  id : String;
begin
  Result := '';

  if Pesquisa.Trim.IsEmpty then
  exit;

  if Grid.Columns.Items[0].FieldName = 'id' then
      if Utilitario.IsNumeric(Pesquisa) then
        Result := ' id = ' + Pesquisa + ' OR ';

  for contador := 1 to Pred(Grid.Columns.Count) - 2 do
  begin

    Result := Result +  Grid.Columns.Items[contador].FieldName + ' LIKE ' +  QuotedStr('%' + Trim(Pesquisa) + '%') + ' OR ';
  end;

  Result := ' WHERE ' + Copy(Result, 1, Length(Result) - 4);

end;

end.
