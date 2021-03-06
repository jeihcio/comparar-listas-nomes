unit UntCompararListaController;

interface

uses
   System.Classes, Vcl.ComCtrls, UntCompararListaResult, Vcl.Controls,
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
   System.SysUtils, Resultado, Vcl.Forms;

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
      Screen.Cursor := crHourGlass;
      formulario.listaParcialContemListaCompleta.Lines.AddStrings
        (AListaNomesContemListaCompleta);

      formulario.listaParcialNaoContemListaCompleta.Lines.AddStrings
        (AListaNomesNaoContemListaCompleta);

      formulario.listaCompletaNaoContemListaParcial.Lines.AddStrings
        (AListaNomesNaoContemListaParcial);

      Screen.Cursor := crDefault;
      formulario.ShowModal();
   finally
      formulario.Free;
   end;
end;

function TCompararListaController.verficarListas(AProgressBar: TProgressBar;
  AListaParcial, AListaCompleta: TStrings): TCompararListaResult;
var
   comparacaoListaParcialComCompleta, comparacaoListaCompletaComParcial
     : TCompararDuasListaResult;
begin
   Result := TCompararListaResult.Create();
   FBarraProgresso.setTamanhoTotalBarraProgresso(AProgressBar,
     [AListaParcial.Count, AListaCompleta.Count]);

   comparacaoListaParcialComCompleta :=
     FListas.verificarSeItensDeUmaListaContemEmOutra(AProgressBar,
     AListaParcial, AListaCompleta);

   comparacaoListaCompletaComParcial :=
     FListas.verificarSeItensDeUmaListaContemEmOutra(AProgressBar,
     AListaCompleta, AListaParcial);

   try
      Result.ListaNomesContemListaCompleta.AddStrings
        (comparacaoListaParcialComCompleta.ListaNomesContemListaCompleta);

      Result.ListaNomesNaoContemListaCompleta.AddStrings
        (comparacaoListaParcialComCompleta.ListaNomesNaoContemListaCompleta);

      Result.ListaNomesNaoContemListaParcial.AddStrings
        (comparacaoListaCompletaComParcial.ListaNomesNaoContemListaCompleta);
   finally
      comparacaoListaCompletaComParcial.Free;
      comparacaoListaParcialComCompleta.Free;
   end;
end;

end.
