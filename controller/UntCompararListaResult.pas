unit UntCompararListaResult;

interface

uses
   System.Classes;

type
   TCompararListaResult = class
   private
      FListaNomesContemListaCompleta, FListaNomesNaoContemListaCompleta
        : TStringList;
   public
      constructor Create(); reintroduce;
      destructor Destroy(); override;

      property ListaNomesContemListaCompleta: TStringList
        read FListaNomesContemListaCompleta;

      property ListaNomesNaoContemListaCompleta: TStringList
        read FListaNomesNaoContemListaCompleta;
   end;

implementation

{ TCompararListaResult }

constructor TCompararListaResult.Create;
begin
   FListaNomesContemListaCompleta := TStringList.Create();
   FListaNomesNaoContemListaCompleta := TStringList.Create();
end;

destructor TCompararListaResult.Destroy;
begin
   FListaNomesContemListaCompleta.Free;
   FListaNomesNaoContemListaCompleta.Free;
   inherited;
end;

end.
