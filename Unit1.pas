unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ImgList, JSON, Vcl.Menus, Vcl.StdActns, System.Actions, Vcl.ActnList;

type
  TIndxChar = (chMul, chPlus, chMin, chEqu);

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
    TabControl1: TTabControl;
    Memo3: TMemo;
    Memo4: TMemo;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    FileExit1: TFileExit;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    X1: TMenuItem;
    C2: TMenuItem;
    T2: TMenuItem;
    P2: TMenuItem;
    A2: TMenuItem;
    U2: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    Memo5: TMemo;
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { Private 宣言 }
    id: TIndxChar;
    procedure loop(item: TTreeNode; JSON: TJSONObject);
    procedure arrloop(item: TTreeNode; arr: TJSONArray);
    function returnChar(c: TIndxChar): Char;
  public
    { Public 宣言 }
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
  for i := 0 to arr.count - 1 do
  begin
    val := arr.Items[i];
    if val is TJSONObject then
      loop(item, val as TJSONObject)
    else if val is TJSONArray then
      arrloop(item, val as TJSONArray)
    else
    begin
      s := '_' + arr.Items[i].ToString;
      TreeView1.Items.AddChild(item, s);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TabControl1Change(nil);
end;

procedure TForm1.loop(item: TTreeNode; JSON: TJSONObject);
var
  i: integer;
  pair: TJSONPair;
  s: string;
  val: TJSONValue;
  c: Char;
begin
  c := returnChar(id);
  if id = High(id) then
    id := Low(id)
  else
    id := Succ(id);
  for i := 0 to JSON.count - 1 do
  begin
    pair := JSON.Pairs[i];
    if pair = nil then
    begin
      TreeView1.Items.AddChild(item, 'error');
      Showmessage('内部エラーにより中断しました');
      TabControl1.TabIndex := 2;
      TabControl1Change(nil);
      TabControl1.Show;
      Exit;
    end
    else
      val := pair.JsonValue;
    if val is TJSONObject then
    begin
      s := c + pair.JsonString.ToString + ':';
      JSON := pair.JsonValue as TJSONObject;
      loop(TreeView1.Items.AddChild(item, s), JSON);
    end
    else if val is TJSONArray then
    begin
      s := c + pair.JsonString.ToString + ':';
      arrloop(TreeView1.Items.AddChild(item, s), pair.JsonValue as TJSONArray);
    end
    else
    begin
      s := c + pair.JsonString.ToString + ':' + pair.JsonValue.ToString;
      TreeView1.Items.AddChild(item, s);
    end;
  end;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  if Memo1.Text = '' then
  begin
    TreeView1.Items.Clear;
    TreeView1.Items.Add(nil, 'JSON items');
  end;
end;

function TForm1.returnChar(c: TIndxChar): Char;
begin
  result := ' ';
  case c of
    chMul:
      result := '*';
    chPlus:
      result := '+';
    chMin:
      result := '-';
    chEqu:
      result := '=';
  end;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  case TabControl1.TabIndex of
    0:
      Memo2.Text := Memo3.Text;
    1:
      Memo2.Text := Memo4.Text;
    2:
      Memo2.Text := Memo5.Text;
  end;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
var
  i: integer;
  j: TJSONObject;
begin
  id := Low(id);
  TreeView1.Items.Clear;
  if Memo1.Text = '' then
    Memo1.Text := Clipboard.AsText;
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
  TabControl1.Visible := not TabControl1.Visible;
end;

end.
