unit Resultado;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
   TFrmResultado = class(TForm)
    listaParcialContemListaCompleta: TMemo;
      lblprimeira: TLabel;
      Label1: TLabel;
    listaParcialNaoContemListaCompleta: TMemo;
    Label2: TLabel;
    listaCompletaNaoContemListaParcial: TMemo;
   private
   public
   end;

var
   FrmResultado: TFrmResultado;

implementation

{$R *.dfm}

end.
