unit UntBarraProgresso;

interface

uses
   Vcl.ComCtrls;

type
   TBarraProgresso = class
   public
      procedure limparBarraProgresso(AProgressBar: TProgressBar);
      procedure incBarraProgresso(AProgressBar: TProgressBar);

      procedure setTamanhoTotalBarraProgresso(AProgressBar: TProgressBar;
        ATamanhoTotal: Integer); overload;

      procedure setTamanhoTotalBarraProgresso(AProgressBar: TProgressBar;
        AListaTamanhosTotais: TArray<Integer>); overload;
   end;

implementation

procedure TBarraProgresso.incBarraProgresso(AProgressBar: TProgressBar);
begin
   AProgressBar.Position := AProgressBar.Position + 1;
end;

procedure TBarraProgresso.limparBarraProgresso(AProgressBar: TProgressBar);
begin
   AProgressBar.Position := 0;
end;

procedure TBarraProgresso.setTamanhoTotalBarraProgresso
  (AProgressBar: TProgressBar; AListaTamanhosTotais: TArray<Integer>);
var
   index, total: Integer;
begin
   total := 0;
   for index := 0 to Length(AListaTamanhosTotais) - 1 do
      total := total + AListaTamanhosTotais[index];

   setTamanhoTotalBarraProgresso(AProgressBar, total);
end;

procedure TBarraProgresso.setTamanhoTotalBarraProgresso
  (AProgressBar: TProgressBar; ATamanhoTotal: Integer);
begin
   AProgressBar.Max := ATamanhoTotal;
end;

end.
