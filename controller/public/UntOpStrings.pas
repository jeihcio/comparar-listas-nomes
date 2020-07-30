unit UntOpStrings;

interface

type
   TOpStrings = class
   public
      function RemoveEspacoDuplicados(cNome: String): string;
      function removerEspacos(AValue: String): String;
   end;

implementation

uses
   System.SysUtils, System.Classes;

{ TCompararListaStrings }

function TOpStrings.RemoveEspacoDuplicados(cNome: String): string;
Const
   cDouble = '  ';
   cOne = ' ';
Begin
   Result := cNome;
   While Pos(cDouble, Result) > 0 Do
      Result := StringReplace(Result, cDouble, cOne, [rfReplaceAll]);
end;

function TOpStrings.removerEspacos(AValue: String): String;
begin
   Result := RemoveEspacoDuplicados(Trim(AValue));
end;

end.
