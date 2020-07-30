unit UntBarraProgresso;

interface

uses
   Vcl.ComCtrls;

type
   TBarraProgresso = class
   public
      procedure incBarraProgresso(AProgressBar: TProgressBar);
      procedure setTamanhoTotalBarraProgresso(AProgressBar: TProgressBar;
        ATamanhoTotal: Integer);
   end;

implementation

procedure TBarraProgresso.incBarraProgresso(AProgressBar: TProgressBar);
begin
   AProgressBar.Position := AProgressBar.Position + 1;
end;

procedure TBarraProgresso.setTamanhoTotalBarraProgresso
  (AProgressBar: TProgressBar; ATamanhoTotal: Integer);
begin
   AProgressBar.Max := ATamanhoTotal;
end;

end.
