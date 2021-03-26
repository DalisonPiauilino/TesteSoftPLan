unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uspQuery;

type
  TfTarefa1 = class(TForm)
    memoColunas: TMemo;
    memoTabelas: TMemo;
    memoCondicoes: TMemo;
    memoSQLgerado: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.Button1Click(Sender: TObject);
var
  query: TspQuery;
  colunas, tabelas, condicoes: TStringList;
begin
  colunas := TStringList.Create;
  tabelas := TStringList.Create;
  condicoes := TStringList.Create;

  colunas.AddStrings(memoColunas.Lines);
  tabelas.AddStrings(memoTabelas.Lines);
  condicoes.AddStrings(memoCondicoes.Lines);

  query := TspQuery.Create(nil);
  try
    query.spColunas := colunas;
    query.spTabelas := tabelas;
    query.spCondicoes := condicoes;

    memoSQLgerado.Lines := query.GeraSQL;
  finally
    query.Destroy;
  end;

end;

end.
