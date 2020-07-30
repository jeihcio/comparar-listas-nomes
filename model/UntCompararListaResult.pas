unit UntCompararListaResult;

interface

uses
   System.Classes;

type
   TCompararListaResult = class
   private
      FListaNomesContemListaCompleta: TStringList;
      FListaNomesNaoContemListaCompleta: TStringList;
      FListaNomesNaoContemListaParcial: TStringList;
   public
      constructor Create(); reintroduce;
      destructor Destroy(); override;

      property ListaNomesContemListaCompleta: TStringList
        read FListaNomesContemListaCompleta;

      property ListaNomesNaoContemListaCompleta: TStringList
        read FListaNomesNaoContemListaCompleta;

      property ListaNomesNaoContemListaParcial: TStringList
        read FListaNomesNaoContemListaParcial;
   end;

implementation

{ TCompararListaResult }

constructor TCompararListaResult.Create;
begin
   FListaNomesContemListaCompleta := TStringList.Create();
   FListaNomesNaoContemListaCompleta := TStringList.Create();
   FListaNomesNaoContemListaParcial := TStringList.Create();
end;

destructor TCompararListaResult.Destroy;
begin
   FListaNomesContemListaCompleta.Free;
   FListaNomesNaoContemListaCompleta.Free;
   FListaNomesNaoContemListaParcial.Free;
   inherited;
end;

end.
