unit Resultado;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
   TFrmResultado = class(TForm)
      listaParcial: TMemo;
      lblprimeira: TLabel;
      Label1: TLabel;
      listaCompleta: TMemo;
   private
   public
   end;

var
   FrmResultado: TFrmResultado;

implementation

{$R *.dfm}

end.
