unit UntCompararListaController;

interface

uses
   System.Classes, Vcl.ComCtrls, UntCompararListaResult;

type
   TCompararListaController = class
   private
      function RemoveEspacoDuplicados(cNome: String): string;
      function removerEspacos(AValue: String): String;
      function isNomesIguais(ANome1, ANome2: String): Boolean;
   public
      function verficarListas(AProgressBar: TProgressBar;
        AListaParcial, AListaCompleta: TStrings): TCompararListaResult;
   end;

implementation

uses
   System.SysUtils;

{ TCompararListaController }

function TCompararListaController.isNomesIguais(ANome1, ANome2: String)
  : Boolean;
begin
   result := (UpperCase(ANome1) = UpperCase(ANome2));
end;

function TCompararListaController.RemoveEspacoDuplicados(cNome: String): string;
Const
   cDouble = '  ';
   cOne = ' ';
Begin
   result := cNome;
   While Pos(cDouble, result) > 0 Do
      result := StringReplace(result, cDouble, cOne, [rfReplaceAll]);
end;

function TCompararListaController.removerEspacos(AValue: String): String;
begin
   result := RemoveEspacoDuplicados(Trim(AValue));
end;

function TCompararListaController.verficarListas(AProgressBar: TProgressBar;
  AListaParcial, AListaCompleta: TStrings): TCompararListaResult;
var
   indexListaParcial, indexListaCompleta: Integer;
   nomeListaParcial, nomeListaCompleta: String;
   isContemNasDuasListas: Boolean;
begin
   result := TCompararListaResult.Create();

   AProgressBar.Max := AListaParcial.Count;
   for indexListaParcial := 0 to AListaParcial.Count - 1 do
   begin
      nomeListaParcial := removerEspacos(AListaParcial[indexListaParcial]);
      isContemNasDuasListas := false;

      for indexListaCompleta := 0 to AListaCompleta.Count - 1 do
      begin
         nomeListaCompleta :=
           removerEspacos(AListaCompleta[indexListaCompleta]);

         if isNomesIguais(nomeListaParcial, nomeListaCompleta) then
         begin
            result.ListaNomesContemListaCompleta.Add(nomeListaParcial);
            isContemNasDuasListas := true;
            break;
         end;
      end;

      if (not isContemNasDuasListas) then
         result.ListaNomesNaoContemListaCompleta.Add(nomeListaParcial);

      AProgressBar.Position := AProgressBar.Position + 1;
   end;

   AProgressBar.Position := AProgressBar.Max;
end;

end.
