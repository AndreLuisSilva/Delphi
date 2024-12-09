unit MonolitoFinanceiro.Utilitarios;

interface

uses
  System.SysUtils,
  Vcl.DBGrids,
  System.Generics.Collections;

type
  Utilitario = class
    class function GetID: string;
    class function LikeFind(Pesquisa: String; Grid: TDBGrid): String;
    class function IsNumeric(S: String): Boolean;
    class procedure DimensionarGrid(dbg: TDBGrid);

  end;

implementation

{ Utilitario }

class procedure Utilitario.DimensionarGrid(dbg: TDBGrid);
type
  TArray = Array of Integer;
  procedure AjustarColumns(Swidth, TSize: Integer; Asize: TArray);
  var
    idx: Integer;
  begin
    if TSize = 0 then
    begin
      TSize := dbg.Columns.count;
      for idx := 0 to dbg.Columns.count - 1 do
        dbg.Columns[idx].Width := (dbg.Width - dbg.Canvas.TextWidth('AAAAAA')
          ) div TSize
    end
    else
      for idx := 0 to dbg.Columns.count - 1 do
        dbg.Columns[idx].Width := dbg.Columns[idx].Width +
          (Swidth * Asize[idx] div TSize);
  end;

var
  idx, Twidth, TSize, Swidth: Integer;
  AWidth: TArray;
  Asize: TArray;
  NomeColuna: String;
begin
  SetLength(AWidth, dbg.Columns.count);
  SetLength(Asize, dbg.Columns.count);
  Twidth := 0;
  TSize := 0;
  for idx := 0 to dbg.Columns.count - 1 do
  begin
    NomeColuna := dbg.Columns[idx].Title.Caption;
    dbg.Columns[idx].Width := dbg.Canvas.TextWidth
      (dbg.Columns[idx].Title.Caption + 'A');
    AWidth[idx] := dbg.Columns[idx].Width;
    Twidth := Twidth + AWidth[idx];

    if Assigned(dbg.Columns[idx].Field) then
      Asize[idx] := dbg.Columns[idx].Field.Size
    else
      Asize[idx] := 1;

    TSize := TSize + Asize[idx];
  end;
  if TDBGridOption.dgColLines in dbg.Options then
    Twidth := Twidth + dbg.Columns.count;

  // adiciona a largura da coluna indicada do cursor
  if TDBGridOption.dgIndicator in dbg.Options then
    Twidth := Twidth + IndicatorWidth;

  Swidth := dbg.ClientWidth - Twidth;
  AjustarColumns(Swidth, TSize, Asize);
end;

class function Utilitario.GetID: string;
begin
  Result := TGUID.NewGuid.ToString;
  Result := StringReplace(Result, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
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
  contador, cod: Integer;
  id: String;
begin
  Result := '';

  if Pesquisa.Trim.IsEmpty then
    exit;

  if Grid.Columns.Items[0].FieldName = 'id' then
    if Utilitario.IsNumeric(Pesquisa) then
      Result := ' id = ' + Pesquisa + ' OR ';

  for contador := 1 to Pred(Grid.Columns.count) - 2 do
  begin

    Result := Result + Grid.Columns.Items[contador].FieldName + ' LIKE ' +
      QuotedStr('%' + Trim(Pesquisa) + '%') + ' OR ';
  end;

  Result := ' WHERE ' + Copy(Result, 1, Length(Result) - 4);

end;

end.
