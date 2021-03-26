unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TPrincipal = class(TForm)
    Tarefas: TMainMenu;
    Tarefa1: TMenuItem;
    Tarefa2: TMenuItem;
    Tarefa3: TMenuItem;
    procedure Tarefa1Click(Sender: TObject);
    procedure Tarefa2Click(Sender: TObject);
    procedure Tarefa3Click(Sender: TObject);
  private
    { Private declarations }
    function IsChildFormExist(InstanceClass: TFormClass): Boolean;
    procedure ShowChild(MainForm : TForm; InstanceClass: TFormClass; var Reference);
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses
  ufTarefa1, ufTarefa2, ufTarefa3;

{$R *.dfm}

function TPrincipal.IsChildFormExist(InstanceClass: TFormClass): Boolean;
var
  I: Integer;
begin
  with (Application.MainForm) do
    for I := 0 to MDIChildCount - 1 do
      if (MDIChildren[i] is InstanceClass) then
      begin
        Result := True;
        Exit;
      end;
  Result:= False;
end;

procedure TPrincipal.ShowChild(MainForm: TForm; InstanceClass: TFormClass;
  var Reference);
var
  Instance: TForm;
begin
  Screen.Cursor:= crHourglass;
  LockWindowUpdate(MainForm.Handle);
  if not IsChildFormExist(InstanceClass) then
    try
      Instance:= TForm(InstanceClass.NewInstance);
      TForm(Reference):= Instance;
      try
        Instance.Create(MainForm);
        if (Instance as TForm).FormStyle = fsNormal then
        begin
          (Instance as TForm).FormStyle := fsMdiChild;
          (Instance as TForm).Visible := True;
        end;
      except
        TForm(Reference):= nil;
        Instance.Free;
        raise;
      end;
    finally
      Screen.Cursor:= crDefault;
    end
  else
    with TForm(Reference) do
    begin
      if WindowState = wsMinimized then WindowState:= wsNormal;
      BringToFront;
      Screen.Cursor:= crDefault;
      SetFocus;
    end;

  LockWindowUpdate(0);
end;

procedure TPrincipal.Tarefa1Click(Sender: TObject);
begin
  ShowChild(Self, TfTarefa1, fTarefa1);
end;

procedure TPrincipal.Tarefa2Click(Sender: TObject);
begin
  ShowChild(Self, TfTarefa2, fTarefa2);
end;

procedure TPrincipal.Tarefa3Click(Sender: TObject);
begin
  ShowChild(Self, TfTarefa3, fTarefa3);
end;

end.
