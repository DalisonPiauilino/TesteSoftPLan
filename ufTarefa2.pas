unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfTarefa2 = class(TForm)
    ProgressBar1: TProgressBar;
    edIntervalo1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar2: TProgressBar;
    edIntervalo2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TThread1 = class(TThread)
  end;

  TThread2 = class(TThread)
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

procedure TfTarefa2.Button1Click(Sender: TObject);
begin
//  if TThread1.CurrentThread.FreeOnTerminate then
    TThread1.CreateAnonymousThread(
      procedure
      var
        i: integer;
      begin
        for i := 0 to 100 do
        begin
          TThread1.Sleep(StrToInt(fTarefa2.edIntervalo1.Text));
          TThread1.Synchronize(TThread1.CurrentThread,
          procedure
          begin
            fTarefa2.ProgressBar1.Position := i;
          end);
        end;
        TThread1.CurrentThread.FreeOnTerminate := True;
      end
    ).Start;

//  if TThread2.CurrentThread.FreeOnTerminate then
    TThread2.CreateAnonymousThread(
      procedure
      var
        i: integer;
      begin
        for i := 0 to 100 do
        begin
          TThread2.Sleep(StrToInt(fTarefa2.edIntervalo2.Text));
          TThread2.Synchronize(TThread2.CurrentThread,
          procedure
          begin
            fTarefa2.ProgressBar2.Position := i;
          end);
        end;
        TThread2.CurrentThread.FreeOnTerminate := True;
      end
    ).Start;
end;
procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TThread1.CurrentThread.Destroy;
  TThread2.CurrentThread.Destroy;
end;

end.
