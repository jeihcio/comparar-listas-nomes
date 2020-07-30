program CompararListas;

uses
  Vcl.Forms,
  CompararLista in 'view\CompararLista.pas' {FrmPrincipal},
  Resultado in 'view\Resultado.pas' {FrmResultado},
  UntCompararListaController in 'controller\UntCompararListaController.pas',
  UntBarraProgresso in 'controller\public\UntBarraProgresso.pas',
  UntOpStrings in 'controller\public\UntOpStrings.pas',
  UntCompararListaResult in 'model\UntCompararListaResult.pas',
  UntOpListas in 'controller\public\UntOpListas.pas',
  UntCompararDuasListaResult in 'model\UntCompararDuasListaResult.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
