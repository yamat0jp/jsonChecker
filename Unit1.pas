unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ImgList, JSON, Vcl.Menus, Vcl.StdActns, System.Actions, Vcl.ActnList;

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
    ActionList1: TActionList;
    PopupMenu1: TPopupMenu;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    C1: TMenuItem;
    T1: TMenuItem;
    P1: TMenuItem;
    A1: TMenuItem;
    U1: TMenuItem;
    MainMenu1: TMainMenu;
    Action1: TAction;
    Action2: TAction;
    Action11: TMenuItem;
    H1: TMenuItem;
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private êÈåæ }
    procedure loop(item: TTreeNode; JSON: TJSONObject);
    procedure arrloop(item: TTreeNode; arr: TJSONArray);
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Clipbrd;

procedure TForm1.arrloop(item: TTreeNode; arr: TJSONArray);
var
  s: string;
  val: TJSONValue;
  i: integer;
begin
  item := TreeView1.Items.AddChild(item, s);
  for i := 0 to arr.count - 1 do
  begin
    s := '_' + arr.Items[i].ToString;
    val := arr.Items[i];
    if val is TJSONObject then
      loop(item, val as TJSONObject)
    else if val is TJSONArray then
      arrloop(item, val as TJSONArray)
    else
      TreeView1.Items.AddChild(item, s);
  end;
end;

procedure TForm1.loop(item: TTreeNode; JSON: TJSONObject);
var
  i, j: integer;
  pair: TJSONPair;
  s: string;
  val: TJSONValue;
begin
  for i := 0 to JSON.count - 1 do
  begin
    pair := JSON.Pairs[i];
    val := pair.JsonValue;
    if val is TJSONObject then
    begin
      s := pair.JsonString.ToString + ':';
      JSON := pair.JsonValue as TJSONObject;
      loop(TreeView1.Items.AddChild(item, s), JSON);
    end
    else if val is TJSONArray then
    begin
      s := pair.JsonString.ToString;
      arrloop(TreeView1.Items.AddChild(item, s), pair.JsonValue as TJSONArray);
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
  i: integer;
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
