unit UntCompararListaController;

interface

uses
   System.Classes, Vcl.ComCtrls, UntCompararListaResult,
   UntBarraProgresso, UntOpStrings, UntOpListas, UntCompararDuasListaResult;

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
   listaParcialSemEspacoEMaiusculo, listaCompletaSemEspacoEMaiusculo,
     lista: TStringList;

   comparacaoListaParcialCompleta, comparacaoListaCompletaParcial
     : TCompararDuasListaResult;
begin
   Result := TCompararListaResult.Create();

   listaCompletaSemEspacoEMaiusculo :=
     FListas.getListaComItensSemEspacosEMaiusculo(AListaCompleta);

   listaParcialSemEspacoEMaiusculo :=
     FListas.getListaComItensSemEspacosEMaiusculo(AListaParcial);

   try
      FBarraProgresso.setTamanhoTotalBarraProgresso(AProgressBar,
        AListaParcial.Count);

      comparacaoListaParcialCompleta :=
        FListas.verificarSeItensDeUmaListaContemEmOutra(AProgressBar,
        AListaParcial, listaCompletaSemEspacoEMaiusculo);

      try
         Result.ListaNomesContemListaCompleta.AddStrings
           (comparacaoListaParcialCompleta.ListaNomesContemListaCompleta);

         Result.ListaNomesNaoContemListaCompleta.AddStrings
           (comparacaoListaParcialCompleta.ListaNomesNaoContemListaCompleta);

         FBarraProgresso.limparBarraProgresso(AProgressBar);
         FBarraProgresso.setTamanhoTotalBarraProgresso(AProgressBar,
           AListaCompleta.Count);

         comparacaoListaCompletaParcial :=
           FListas.verificarSeItensDeUmaListaContemEmOutra(AProgressBar,
           AListaCompleta, listaParcialSemEspacoEMaiusculo);

         try
            Result.ListaNomesNaoContemListaParcial.AddStrings
              (comparacaoListaCompletaParcial.ListaNomesNaoContemListaCompleta);
         finally
            comparacaoListaCompletaParcial.Free;
         end;
      finally
         comparacaoListaParcialCompleta.Free;
      end;
   finally
      listaCompletaSemEspacoEMaiusculo.Free;
      listaParcialSemEspacoEMaiusculo.Free;
   end;
end;

end.
