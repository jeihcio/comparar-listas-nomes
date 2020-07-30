unit UntOpListas;

interface

uses
   System.Classes;

type
   TOpLista = class
   public
      function getListaComItensSemEspacosEMaiusculo(ALista: TStrings)
        : TStringList;

      function localizarItemLista(AListaComItensSemEspacoEMaiusculos
        : TStringList; AValue: String): Boolean;
   end;

implementation

uses
   System.SysUtils;

function TOpLista.getListaComItensSemEspacosEMaiusculo(ALista: TStrings)
  : TStringList;
var
   index: Integer;
   item: String;
begin
   Result := TStringList.Create();
   for index := 0 to ALista.Count - 1 do
   begin
      item := UpperCase(Trim(ALista[index]));
      Result.Add(item);
   end;
end;

function TOpLista.localizarItemLista(AListaComItensSemEspacoEMaiusculos
  : TStringList; AValue: String): Boolean;
begin
   Result := (AListaComItensSemEspacoEMaiusculos.IndexOf
     (UpperCase(AValue)) > -1);
end;

end.
