program CompararListas;

uses
  Vcl.Forms,
  CompararLista in 'view\CompararLista.pas' {FrmPrincipal},
  Resultado in 'view\Resultado.pas' {FrmResultado},
  UntCompararListaController in 'controller\UntCompararListaController.pas',
  UntCompararListaResult in 'controller\UntCompararListaResult.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
