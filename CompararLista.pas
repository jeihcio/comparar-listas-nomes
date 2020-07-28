unit CompararLista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

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
  private
    procedure verficarListas();
    procedure limpar();
    procedure LimparContador();
    procedure ExibirResultado(AListaNomesContemListaCompleta,
      AListaNomesNaoContemListaCompleta: TStringList);
    Function RemoveEspacoDuplicados(cNome: String): string;
  public
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Resultado;

procedure TFrmPrincipal.btnLimparClick(Sender: TObject);
begin
   limpar();
   LimparContador();
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   LimparContador();
   verficarListas();
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

procedure TFrmPrincipal.limpar;
begin
   listaParcial.Clear;
   listaCompleta.Clear;
end;

procedure TFrmPrincipal.LimparContador;
begin
   ProgressBar.Position := 0;
end;

function TFrmPrincipal.RemoveEspacoDuplicados(cNome: String): string;
Const
   cDouble = '  ';
   cOne = ' ';
Begin
   Result := cNome;
   While Pos(cDouble,result) > 0 Do
      Result := StringReplace(Result,cDouble,cOne,[rfReplaceAll]);
end;

procedure TFrmPrincipal.verficarListas;
var
  indexListaParcial,
  indexListaCompleta: Integer;

  nomeListaParcial,
  nomeListaCompleta: String;

  isContemNasDuasListas: Boolean;

  listaNomesContemListaCompleta,
  listaNomesNaoContemListaCompleta: TStringList;
begin
   listaNomesContemListaCompleta := TStringList.Create();
   listaNomesNaoContemListaCompleta := TStringList.Create();

   try
      ProgressBar.Max := listaParcial.Lines.Count;

      for indexListaParcial := 0 to listaParcial.Lines.Count - 1 do
         begin
            nomeListaParcial := RemoveEspacoDuplicados(Trim(listaParcial.Lines[indexListaParcial]));
            isContemNasDuasListas := false;

            for indexListaCompleta := 0 to listaCompleta.Lines.Count - 1 do
               begin
                  nomeListaCompleta := UpperCase(RemoveEspacoDuplicados(Trim(listaCompleta.Lines[indexListaCompleta])));

                  if (UpperCase(nomeListaParcial) = nomeListaCompleta) then
                     begin
                        listaNomesContemListaCompleta.Add(nomeListaParcial);
                        isContemNasDuasListas := true;
                        break;
                     end;
               end;

            if (not isContemNasDuasListas) then
               listaNomesNaoContemListaCompleta.Add(nomeListaParcial);

            ProgressBar.Position := ProgressBar.Position + 1;
         end;

      ProgressBar.Position := ProgressBar.Max;

      Screen.Cursor := crDefault;
      ShowMessage('Finalizado');
      ExibirResultado(listaNomesContemListaCompleta, listaNomesNaoContemListaCompleta);
   finally
      listaNomesContemListaCompleta.Free;
      listaNomesNaoContemListaCompleta.Free;
   end;
end;

end.
