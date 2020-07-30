unit UntOpListas;

interface

uses
   System.Classes, UntCompararDuasListaResult, Vcl.ComCtrls, UntBarraProgresso,
   UntOpStrings;

type
   TOpLista = class
   private
      FBarraProgresso: TBarraProgresso;
      FStrings: TOpStrings;
   public
      constructor Create(); reintroduce;
      destructor Destroy(); override;

      function getListaComItensSemEspacosEMaiusculo(ALista: TStrings)
        : TStringList;

      function localizarItemLista(AListaComItensSemEspacoEMaiusculos
        : TStrings; AValue: String): Boolean;

      function verificarSeItensDeUmaListaContemEmOutra
        (AProgressBar: TProgressBar;
        AListaParcial, AListaCompletaSemEspacoEMaiusculo: TStrings)
        : TCompararDuasListaResult;
   end;

implementation

uses
   System.SysUtils;

constructor TOpLista.Create;
begin
   FBarraProgresso := TBarraProgresso.Create();
   FStrings := TOpStrings.Create();
end;

destructor TOpLista.Destroy;
begin
   FBarraProgresso.Free;
   FStrings.Free;
   inherited;
end;

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
  : TStrings; AValue: String): Boolean;
begin
   Result := (AListaComItensSemEspacoEMaiusculos.IndexOf
     (UpperCase(AValue)) > -1);
end;

function TOpLista.verificarSeItensDeUmaListaContemEmOutra
  (AProgressBar: TProgressBar; AListaParcial, AListaCompletaSemEspacoEMaiusculo
  : TStrings): TCompararDuasListaResult;
var
   indexListaParcial: Integer;
   nomeListaParcial: String;
begin
   Result := TCompararDuasListaResult.Create();

   for indexListaParcial := 0 to AListaParcial.Count - 1 do
   begin
      nomeListaParcial := FStrings.removerEspacos
        (AListaParcial[indexListaParcial]);

      if localizarItemLista(AListaCompletaSemEspacoEMaiusculo, nomeListaParcial)
      then
         Result.ListaNomesContemListaCompleta.Add(nomeListaParcial)
      else
         Result.ListaNomesNaoContemListaCompleta.Add(nomeListaParcial);

      FBarraProgresso.incBarraProgresso(AProgressBar);
   end;
end;

end.
