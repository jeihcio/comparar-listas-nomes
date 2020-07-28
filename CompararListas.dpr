program CompararListas;

uses
  Vcl.Forms,
  CompararLista in 'CompararLista.pas' {FrmPrincipal},
  Resultado in 'Resultado.pas' {FrmResultado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
