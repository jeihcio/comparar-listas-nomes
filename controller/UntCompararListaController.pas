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

      procedure incBarraProgresso(AProgressBar: TProgressBar);
      procedure setTamanhoTotalBarraProgresso(AProgressBar: TProgressBar;
        ATamanhoTotal: Integer);
   public
      function verficarListas(AProgressBar: TProgressBar;
        AListaParcial, AListaCompleta: TStrings): TCompararListaResult;

      procedure ExibirResultado(AListaNomesContemListaCompleta,
        AListaNomesNaoContemListaCompleta: TStringList);
   end;

implementation

uses
   System.SysUtils, Resultado;

{ TCompararListaController }

procedure TCompararListaController.ExibirResultado
  (AListaNomesContemListaCompleta, AListaNomesNaoContemListaCompleta
  : TStringList);
var
   formulario: TFrmResultado;
begin
   formulario := TFrmResultado.Create(nil);
   try
      formulario.listaParcial.Lines.AddStrings(AListaNomesContemListaCompleta);
      formulario.listaCompleta.Lines.AddStrings
        (AListaNomesNaoContemListaCompleta);

      formulario.ShowModal();
   finally
      formulario.Free;
   end;
end;

procedure TCompararListaController.incBarraProgresso(AProgressBar
  : TProgressBar);
begin
   AProgressBar.Position := AProgressBar.Position + 1;
end;

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

procedure TCompararListaController.setTamanhoTotalBarraProgresso
  (AProgressBar: TProgressBar; ATamanhoTotal: Integer);
begin
   AProgressBar.Max := ATamanhoTotal;
end;

function TCompararListaController.verficarListas(AProgressBar: TProgressBar;
  AListaParcial, AListaCompleta: TStrings): TCompararListaResult;
var
   indexListaParcial, indexListaCompleta: Integer;
   nomeListaParcial, nomeListaCompleta: String;
   isContemNasDuasListas: Boolean;
begin
   result := TCompararListaResult.Create();
   setTamanhoTotalBarraProgresso(AProgressBar, AListaParcial.Count);

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

      incBarraProgresso(AProgressBar);
   end;
end;

end.
