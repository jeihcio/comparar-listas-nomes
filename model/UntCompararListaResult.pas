unit UntCompararListaResult;

interface

uses
   System.Classes, UntCompararDuasListaResult;

type
   TCompararListaResult = class(TCompararDuasListaResult)
   private
      FListaNomesNaoContemListaParcial: TStringList;
   public
      constructor Create(); reintroduce;
      destructor Destroy(); override;

      property ListaNomesNaoContemListaParcial: TStringList
        read FListaNomesNaoContemListaParcial;
   end;

implementation

{ TCompararListaResult }

constructor TCompararListaResult.Create;
begin
   inherited Create();
   FListaNomesNaoContemListaParcial := TStringList.Create();
end;

destructor TCompararListaResult.Destroy;
begin
   FListaNomesNaoContemListaParcial.Free;
   inherited;
end;

end.
