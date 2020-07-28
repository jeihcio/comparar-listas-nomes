unit CompararLista;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
   UntCompararListaController;

type
   TFrmPrincipal = class(TForm)
      listaParcial: TMemo;
      lblprimeira: TLabel;
      Label1: TLabel;
      listaCompleta: TMemo;
      btnLimpar: TButton;
      Button1: TButton;
      ProgressBar: TProgressBar;
      procedure btnLimparClick(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      FController: TCompararListaController;
      procedure limparCampos();
      procedure LimparContador();
      procedure ExibirResultado(AListaNomesContemListaCompleta,
        AListaNomesNaoContemListaCompleta: TStringList);
   public
   end;

var
   FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Resultado, UntCompararListaResult;

procedure TFrmPrincipal.btnLimparClick(Sender: TObject);
begin
   limparCampos();
   LimparContador();
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
   Resultado: TCompararListaResult;
begin
   Screen.Cursor := crHourGlass;
   LimparContador();

   Resultado := FController.verficarListas(ProgressBar, listaParcial.Lines,
     listaCompleta.Lines);

   try
      Screen.Cursor := crDefault;
      ShowMessage('Finalizado');

      ExibirResultado(Resultado.ListaNomesContemListaCompleta,
        Resultado.ListaNomesNaoContemListaCompleta);
   finally
      Resultado.Free;
   end;
end;

procedure TFrmPrincipal.ExibirResultado(AListaNomesContemListaCompleta,
  AListaNomesNaoContemListaCompleta: TStringList);
var
   formulario: TFrmResultado;
begin
   formulario := TFrmResultado.Create(nil);
   try
      formulario.listaParcial.Lines := AListaNomesContemListaCompleta;
      formulario.listaCompleta.Lines := AListaNomesNaoContemListaCompleta;

      formulario.ShowModal();
   finally
      formulario.Free;
   end;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FController.Free;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
   FController := TCompararListaController.Create();
end;

procedure TFrmPrincipal.limparCampos;
begin
   listaParcial.Clear;
   listaCompleta.Clear;
end;

procedure TFrmPrincipal.LimparContador;
begin
   ProgressBar.Position := 0;
end;

end.
