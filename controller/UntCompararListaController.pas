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

   resultadoComparacaoListas: TCompararDuasListaResult;
begin
   Result := TCompararListaResult.Create();

   listaCompletaSemEspacoEMaiusculo :=
     FListas.getListaComItensSemEspacosEMaiusculo(AListaCompleta);

   listaParcialSemEspacoEMaiusculo :=
     FListas.getListaComItensSemEspacosEMaiusculo(AListaParcial);

   FBarraProgresso.setTamanhoTotalBarraProgresso(AProgressBar,
     AListaParcial.Count);

   try
      resultadoComparacaoListas :=
        FListas.verificarSeItensDeUmaListaContemEmOutra(AProgressBar,
        AListaParcial, listaCompletaSemEspacoEMaiusculo);

      try
         Result.ListaNomesContemListaCompleta.AddStrings
           (resultadoComparacaoListas.ListaNomesContemListaCompleta);

         Result.ListaNomesNaoContemListaCompleta.AddStrings
           (resultadoComparacaoListas.ListaNomesNaoContemListaCompleta);
      finally
         resultadoComparacaoListas.Free;
      end;

      FBarraProgresso.limparBarraProgresso(AProgressBar);
      FBarraProgresso.setTamanhoTotalBarraProgresso(AProgressBar,
        AListaCompleta.Count);

      resultadoComparacaoListas :=
        FListas.verificarSeItensDeUmaListaContemEmOutra(AProgressBar,
        AListaCompleta, listaParcialSemEspacoEMaiusculo);
      try
         Result.ListaNomesNaoContemListaParcial.AddStrings
           (resultadoComparacaoListas.ListaNomesNaoContemListaCompleta);
      finally
         resultadoComparacaoListas.Free;
      end;
   finally
      listaCompletaSemEspacoEMaiusculo.Free;
      listaParcialSemEspacoEMaiusculo.Free;
   end;
end;

end.
