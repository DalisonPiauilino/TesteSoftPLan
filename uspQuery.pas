unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.DApt;

type
  TspQuery = class(TFDQuery)
  private
    FspColunas: TStringList;
    FspTabelas: TStringList;
    FspCondicoes: TStringList;
  private
    function GetspColunas: TStringList;
    function GetspCondicoes: TStringList;
    function GetspTabelas: TStringList;
    procedure SetspColunas(const Value: TStringList);
    procedure SetspCondicoes(const Value: TStringList);
    procedure SetspTabelas(const Value: TStringList);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    property spCondicoes: TStringList read GetspCondicoes write SetspCondicoes;
    property spColunas: TStringList read GetspColunas write SetspColunas;
    property spTabelas: TStringList read GetspTabelas write SetspTabelas;
    function GeraSQL: TStringList;
  published
    { Published declarations }
  end;

implementation

{ TspQuery }

function TspQuery.GeraSQL: TStringList;
var
  spSQL: TStringList;
  i: Integer;
begin
  spSQL := TStringList.Create;

  spSQL.add('select ');

  if spColunas.Count = 0 then
    spSQL.add('*')
  else if (Pos(',', spColunas.Text) > 0) then
    spSQL.add(spColunas.Text)
  else
  begin
    for i := 0 to spColunas.Count - 1 do
    begin
      if i = 0 then
        spSQL.add(spColunas[i])
      else if i > 0 then
        spSQL.add(', ' + spColunas[i]);
    end;
  end;

  spSQL.add(' from ' + spTabelas[0]);

  spSQL.Add(' where ');
  if spCondicoes.Count = 1 then
    spSQL.add(spCondicoes.Text)
  else if (Pos('and', spCondicoes.Text) > 0) then
    spSQL.add(spCondicoes.Text)
  else
    for i := 0 to spCondicoes.Count - 1 do
    begin
      if i = 0 then
        spSQL.add(spCondicoes[i])
      else if i > 0 then
        spSQL.add(' and ' + spCondicoes[i]);
    end;

  Result := spSQL;
end;

function TspQuery.GetspColunas: TStringList;
begin
    Result := FspColunas;
end;

function TspQuery.GetspCondicoes: TStringList;
begin
  Result := FspCondicoes;
end;

function TspQuery.GetspTabelas: TStringList;
begin
  Result := FspTabelas;
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
  FspColunas := Value;
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
  FspCondicoes := Value;
end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
  if (Value.Count > 1) or (Pos(',', Value.Text) > 0) then
    raise Exception.Create('Não é permitido informar mais de uma tabela para a geração do SQL');

  FspTabelas := Value;
end;

end.
