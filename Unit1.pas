unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ImgList, JSON;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    TreeView1: TTreeView;
    ToolButton3: TToolButton;
    StatusBar1: TStatusBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Memo2: TMemo;
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private êÈåæ }
    procedure loop(item: TTreeNode; JSON: TJSONObject);
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Clipbrd;

procedure TForm1.loop(item: TTreeNode; JSON: TJSONObject);
var
  i: Integer;
  pair: TJSONPair;
  s: string;
begin
  for i := 0 to JSON.count - 1 do
  begin
    pair := JSON.Pairs[i];
    if pair.JsonValue is TJSONObject then
    begin
      s := pair.JsonString.ToString + ':';
      loop(TreeView1.Items.AddChild(item, s), pair.JsonValue as TJSONObject);
    end
    else
    begin
      s := pair.JsonString.ToString + ':' + pair.JsonValue.ToString;
      TreeView1.Items.AddChild(item, s);
    end;
  end;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
var
  i: Integer;
  j: TJSONObject;
begin
  TreeView1.Items.Clear;
  j := TJSONObject.ParseJSONValue(Memo1.Text) as TJSONObject;
  if j <> nil then
    loop(nil, j);
  for i := 0 to TreeView1.Items.count - 1 do
    TreeView1.Items[i].Expanded := true;
  if TreeView1.Items.count = 0 then
    StatusBar1.Panels[0].Text := 'error'
  else
  begin
    Clipboard.AsText := j.ToString;
    StatusBar1.Panels[0].Text := '';
  end;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  Memo2.Visible := not Memo2.Visible;
end;

end.
