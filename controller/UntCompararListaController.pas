unit UntCompararListaController;

interface

uses
   System.Classes, Vcl.ComCtrls, UntCompararListaResult,
   UntBarraProgresso, UntOpStrings, UntOpListas;

type
   TCompararListaController = class
   private
      FBarraProgresso: TBarraProgresso;
      FStrings: TOpStrings;
      FListas: TOpLista;
   public
      constructor Create(); reintroduce;
      destructor Destroy(); override;

      function verficarListas(AProgressBar: TProgressBar;
        AListaParcial, AListaCompleta: TStrings): TCompararListaResult;

      procedure ExibirResultado(AListaNomesContemListaCompleta,
        AListaNomesNaoContemListaCompleta, AListaNomesNaoContemListaParcial
        : TStringList);
   end;

implementation

uses
   System.SysUtils, Resultado;

{ TCompararListaController }

constructor TCompararListaController.Create;
begin
   FBarraProgresso := TBarraProgresso.Create();
   FStrings := TOpStrings.Create();
   FListas := TOpLista.Create();
end;

destructor TCompararListaController.Destroy;
begin
   FBarraProgresso.Free;
   FStrings.Free;
   FListas.Free;
   inherited;
end;

procedure TCompararListaController.ExibirResultado
  (AListaNomesContemListaCompleta, AListaNomesNaoContemListaCompleta,
  AListaNomesNaoContemListaParcial: TStringList);
var
   formulario: TFrmResultado;
begin
   formulario := TFrmResultado.Create(nil);
   try
      formulario.listaParcialContemListaCompleta.Lines.AddStrings
        (AListaNomesContemListaCompleta);

      formulario.listaParcialNaoContemListaCompleta.Lines.AddStrings
        (AListaNomesNaoContemListaCompleta);

      formulario.listaCompletaNaoContemListaParcial.Lines.AddStrings
        (AListaNomesNaoContemListaParcial);

      formulario.ShowModal();
   finally
      formulario.Free;
   end;
end;

function TCompararListaController.verficarListas(AProgressBar: TProgressBar;
  AListaParcial, AListaCompleta: TStrings): TCompararListaResult;
var
   indexListaParcial: Integer;
   nomeListaParcial: String;

   listaParcialSemEspacoEMaiusculo, listaCompletaSemEspacoEMaiusculo,
     lista: TStringList;
begin
   Result := TCompararListaResult.Create();
   FBarraProgresso.setTamanhoTotalBarraProgresso(AProgressBar,
     AListaParcial.Count);

   listaCompletaSemEspacoEMaiusculo :=
     FListas.getListaComItensSemEspacosEMaiusculo(AListaCompleta);

   listaParcialSemEspacoEMaiusculo :=
     FListas.getListaComItensSemEspacosEMaiusculo(AListaParcial);

   try
      for indexListaParcial := 0 to AListaParcial.Count - 1 do
      begin
         nomeListaParcial := FStrings.removerEspacos
           (AListaParcial[indexListaParcial]);

         if FListas.localizarItemLista(listaCompletaSemEspacoEMaiusculo,
           nomeListaParcial) then
            Result.ListaNomesContemListaCompleta.Add(nomeListaParcial)
         else
            Result.ListaNomesNaoContemListaCompleta.Add(nomeListaParcial);

         FBarraProgresso.incBarraProgresso(AProgressBar);
      end;
   finally
      listaCompletaSemEspacoEMaiusculo.Free;
      listaParcialSemEspacoEMaiusculo.Free;
   end;
end;

end.
