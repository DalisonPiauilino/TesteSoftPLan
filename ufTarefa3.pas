unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Datasnap.DBClient;

type
  TfTarefa3 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    edValorTotal: TEdit;
    Label1: TLabel;
    edTotalDivisoes: TEdit;
    Label2: TLabel;
    Button2: TButton;
    clienteDataSet: TClientDataSet;
    dataSource: TDataSource;
    Label3: TLabel;
    clienteDataSetidProjeto: TIntegerField;
    clienteDataSetNomeProjeto: TStringField;
    clienteDataSetValor: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.Button1Click(Sender: TObject);
var
  ValorTotal: Double;
begin
  ValorTotal := 0;
  clienteDataSet.First;

  while not clienteDataSet.Eof do
  begin
    ValorTotal := ValorTotal + clienteDataSet.FieldByName('Valor').AsFloat;
    clienteDataSet.Next;
  end;
  edValorTotal.Text := FloatToStrF(ValorTotal, ffCurrency, 4, 2);
end;

procedure TfTarefa3.Button2Click(Sender: TObject);
var
  ValorTotalDivisoes: Double;
  ValorAnterior, ValorDivisao: Double;
begin
  ValorTotalDivisoes := 0;

  clienteDataSet.First;
  while not clienteDataSet.Eof do
  begin
    if clienteDataSet.RecNo = 1 then
    begin
      ValorAnterior := clienteDataSet.FieldByName('Valor').AsFloat;
      clienteDataSet.Next;
    end;

    ValorDivisao := (clienteDataSet.FieldByName('Valor').AsFloat/ValorAnterior);
    ValorTotalDivisoes := ValorTotalDivisoes + ValorDivisao;

    ValorAnterior := clienteDataSet.FieldByName('Valor').AsFloat;
    clienteDataSet.Next;
  end;

  edTotalDivisoes.Text := FloatToStrF(ValorTotalDivisoes, ffCurrency, 4, 2);
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  clienteDataSet.Close;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
var
  i: Integer;
begin
//  clienteDataSet := TClientDataSet.Create(nil);
  clienteDataSet.CreateDataSet;
  for i := 1 to 10 do
  begin
    clienteDataSet.Append;
    clienteDataSet.FieldByName('IdProjeto').AsInteger := i;
    clienteDataSet.FieldByName('NomeProjeto').AsString := 'Projeto ' + IntToStr(i);
    clienteDataSet.FieldByName('Valor').AsCurrency := i * 10;
    clienteDataSet.Post;
  end;
end;

end.
