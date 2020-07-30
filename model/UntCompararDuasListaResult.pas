unit UntCompararDuasListaResult;

interface

uses
   System.Classes;

type
   TCompararDuasListaResult = class
   private
      FListaNomesContemListaCompleta: TStringList;
      FListaNomesNaoContemListaCompleta: TStringList;
   public
      constructor Create(); reintroduce;
      destructor Destroy(); override;

      property ListaNomesContemListaCompleta: TStringList
        read FListaNomesContemListaCompleta;

      property ListaNomesNaoContemListaCompleta: TStringList
        read FListaNomesNaoContemListaCompleta;
   end;

implementation

{ TCompararDuasListaResult }

constructor TCompararDuasListaResult.Create;
begin
   FListaNomesContemListaCompleta := TStringList.Create();
   FListaNomesNaoContemListaCompleta := TStringList.Create();
end;

destructor TCompararDuasListaResult.Destroy;
begin
   FListaNomesContemListaCompleta.Free;
   FListaNomesNaoContemListaCompleta.Free;
   inherited;
end;

end.
