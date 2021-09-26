unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ImgList, JSON, Vcl.Menus, Vcl.StdActns, System.Actions, Vcl.ActnList;

type
  TIndxChar = (chMul, chPlus, chYen, chDollar, chSharp, chAnd, chPercent);

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
    EditSelectAll1: TEditSelectAll;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    C1: TMenuItem;
    T1: TMenuItem;
    P1: TMenuItem;
    A1: TMenuItem;
    U1: TMenuItem;
    MainMenu1: TMainMenu;
    Execute1: TAction;
    Hint1: TAction;
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
    Undo1: TAction;
    Past1: TAction;
    Redo1: TAction;
    R1: TMenuItem;
    R2: TMenuItem;
    ToolButton11: TToolButton;
    procedure ToolButton5Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure Undo1Execute(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Past1Execute(Sender: TObject);
    procedure Redo1Execute(Sender: TObject);
    procedure Execute1Execute(Sender: TObject);
  private
    { Private êÈåæ }
    function checkplane: Boolean;
    procedure loop(item: TTreeNode; JSON: TJSONObject);
    procedure arrloop(item: TTreeNode; arr: TJSONArray);
    function returnChar(c: TIndxChar): Char;
    procedure inputsub(Key: Char);
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Clipbrd, Undo;

var
  id: TIndxChar;
  delstr: string;
  delpos: integer;
  charmodi: Boolean;
  Undo: TUndoClass;

procedure TForm1.Undo1Execute(Sender: TObject);
begin
  Undo.Execute;
  ToolButton8.Enabled := Undo.CanUndo;
  ToolButton11.Enabled := Undo.CanRedo;
end;

procedure TForm1.Past1Execute(Sender: TObject);
var
  s: string;
begin
  s := Clipboard.AsText;
  Memo1.SelText := s;
  Memo1.SelStart := Memo1.SelStart - Length(s);
  Memo1.SelLength := Length(s);
  Undo.Pasted(Memo1.SelText, Memo1.SelStart);
  ToolButton8.Enabled := Undo.CanUndo;
end;

procedure TForm1.Redo1Execute(Sender: TObject);
begin
  Undo.ReDo;
  ToolButton8.Enabled := Undo.CanUndo;
  ToolButton11.Enabled := Undo.CanRedo;
end;

procedure TForm1.arrloop(item: TTreeNode; arr: TJSONArray);
var
  s: string;
  val: TJSONValue;
  i: integer;
  c: Char;
begin
  c := returnChar(id);
  if id = High(id) then
    id := Low(id)
  else
    id := Succ(id);
  for i := 0 to arr.count - 1 do
  begin
    val := arr.Items[i];
    if val is TJSONObject then
      loop(item, val as TJSONObject)
    else if val is TJSONArray then
      arrloop(item, val as TJSONArray)
    else
    begin
      s := c + '_' + arr.Items[i].ToString;
      TreeView1.Items.AddChild(item, s);
    end;
  end;
end;

function TForm1.checkplane: Boolean;
var
  i: integer;
  s: string;
  j: integer;
begin
  result := true;
  if Memo1.Text <> '' then
    for i := 0 to Memo1.Lines.count - 1 do
    begin
      s := Memo1.Lines[i];
      for j := 1 to Length(s) do
        case s[j] of
          Char(VK_SPACE), Char(VK_TAB), 'Å@':
            continue;
        else
          result := false;
          break;
        end;
    end;
end;

procedure TForm1.Execute1Execute(Sender: TObject);
var
  i: integer;
  j: TJSONObject;
begin
  id := Low(id);
  TreeView1.Items.Clear;
  if checkplane = true then
  begin
    Memo1.Text := '';
    Past1Execute(nil);
    Memo1.SelLength := 0;
  end;
  j := TJSONObject.ParseJSONValue(Memo1.Text) as TJSONObject;
  if j <> nil then
  begin
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
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TabControl1Change(nil);
  Undo := TUndoClass.Create(Self);
  Undo.Memo := Memo1;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Undo.Free;
end;

procedure TForm1.inputsub(Key: Char);
begin
  delstr := Memo1.SelText;
  delpos := Memo1.SelStart;
  charmodi := false;
  if delstr <> '' then
    Undo.Deleted(delstr, Memo1.SelStart, false);
  if Key = Char(VK_RETURN) then
    Undo.Returned(delpos)
  else
    Undo.Inputted(Key, delpos);
  Undo.UpCount;
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
      Showmessage('ì‡ïîÉGÉâÅ[Ç…ÇÊÇËíÜífÇµÇ‹ÇµÇΩ');
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
  ToolButton8.Enabled := Undo.CanUndo;
  if Memo1.Text = '' then
  begin
    TreeView1.Items.Clear;
    TreeView1.Items.Add(nil, 'JSON items');
  end;
end;

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Memo1.Text <> '' then
    case Key of
      VK_DELETE:
        begin
          if Memo1.CaretPos.X = Length(Memo1.Lines[Memo1.CaretPos.Y]) then
          begin
            Undo.DelReturn(Memo1.SelStart, true);
            Undo.ResetDel;
            Undo.ResetBack;
            charmodi := true;
            Exit;
          end
          else if Memo1.SelLength = 0 then
            delstr := Memo1.Text[Memo1.SelStart + 1]
          else
            delstr := Memo1.SelText;
          Undo.ResetBack;
          Undo.Deleted(delstr, Memo1.SelStart, true);
          Undo.UpDelCnt;
        end;
    end;
  charmodi := true;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
var
  i: integer;
begin
  if Ord(Key) = VK_BACK then
  begin
    if Memo1.SelStart > 0 then
    begin
      if Memo1.CaretPos.X = 0 then
      begin
        Undo.DelReturn(Memo1.SelStart, false);
        Undo.ResetDel;
        Undo.ResetBack;
        charmodi := true;
        Exit;
      end
      else if Memo1.SelLength = 0 then
      begin
        delstr := Memo1.Text[Memo1.SelStart];
        i := Memo1.SelStart - 1;
      end
      else
      begin
        delstr := Memo1.SelText;
        i := Memo1.SelStart;
      end;
      Undo.ResetDel;
      Undo.Deleted(delstr, i, false);
      Undo.UpBackCnt;
    end;
  end
  else
  begin
    Undo.ResetDel;
    Undo.ResetBack;
    inputsub(Key);
  end;
end;

procedure TForm1.Memo1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if charmodi = true then
    Undo.ResetCnt;
end;

function TForm1.returnChar(c: TIndxChar): Char;
begin
  result := ' ';
  case c of
    chMul:
      result := '*';
    chPlus:
      result := '+';
    chYen:
      result := '\';
    chDollar:
      result := '$';
    chSharp:
      result := '#';
    chAnd:
      result := '&';
    chPercent:
      result := '%';
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

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  TabControl1.Visible := not TabControl1.Visible;
end;

end.
