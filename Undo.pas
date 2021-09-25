unit Undo;

interface

uses System.Contnrs, System.Classes, Vcl.StdCtrls;

type
  TUndoBase = class
  private
    FPos: integer;
    FMemo: TCustomMemo;
  public
    procedure Execute; virtual; abstract;
    procedure ReDo; virtual; abstract;
  end;

  TUnDelete = class(TUndoBase)
  private
    FStr: string;
    FTop: Boolean;
  public
    procedure Execute; override;
    procedure ReDo; override;
  end;

  TUnPaste = class(TUndoBase)
  private
    FLen: integer;
    FStr: string;
  public
    procedure Execute; override;
    procedure ReDo; override;
  end;

  TUnRETURN = class(TUndoBase)
  public
    procedure Execute; override;
    procedure ReDo; override;
  end;

  TUnDelRet = class(TUndoBase)
  private
    FTop: Boolean;
  public
    procedure Execute; override;
  end;

  TUndoClass = class(TComponent)
  private
    FStack: TObjectStack;
    FReStack: TObjectStack;
    FMemo: TCustomMemo;
    FCnt: integer;
    FBack: integer;
    FDel: integer;
    function GetCanUndo: Boolean;
    procedure Clear;
    procedure DelRedoStack;
    procedure SetMemo(const Value: TCustomMemo);
    function GetCanRedo: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Deleted(const str: string; pos: integer; top: Boolean);
    procedure Inputted(c: Char; pos: integer);
    procedure Returned(pos: integer);
    procedure DelReturn(num: integer; top: Boolean);
    procedure Pasted(const str: string; pos: integer);
    procedure Execute;
    procedure ReDo;
    destructor Destroy; override;
    procedure UpCount;
    procedure UpDelCnt;
    procedure UpBackCnt;
    procedure ResetCnt;
    procedure ResetDel;
    procedure ResetBack;
  published
    property Memo: TCustomMemo read FMemo write SetMemo;
    property CanUndo: Boolean read GetCanUndo;
    property CanRedo: Boolean read GetCanRedo;
  end;

implementation

{ TUndoClass }

procedure TUndoClass.Clear;
var
  i: integer;
begin
  for i := 0 to FStack.Count - 1 do
    FStack.Pop.Free;
  for i := 0 to FReStack.Count - 1 do
    FReStack.Pop.Free;
end;

constructor TUndoClass.Create(AOwner: TComponent);
begin
  inherited;
  FStack := TObjectStack.Create;
  FReStack := TObjectStack.Create;
end;

procedure TUndoClass.Deleted(const str: string; pos: integer; top: Boolean);
var
  obj: TUnDelete;
begin
  if str = '' then
    Exit;
  DelRedoStack;
  if ((FBack > 0) or (FDel > 0)) and (FStack.Peek is TUnDelete) and
    (Length(str) = 1) then
  begin
    obj := FStack.Peek as TUnDelete;
    if top = obj.FTop then
    begin
      if top = true then
      begin
        obj.FStr := obj.FStr + str;
        obj.FPos := obj.FPos;
      end
      else
      begin
        obj.FStr := str + obj.FStr;
        obj.FPos := obj.FPos - 1;
      end;
    end
    else
    begin
      FBack := 0;
      FDel := 0;
      Deleted(str, pos, top);
    end;
  end
  else
  begin
    FBack := 0;
    FDel := 0;
    obj := TUnDelete.Create;
    obj.FStr := str;
    obj.FPos := pos;
    obj.FTop := top;
    obj.FMemo := FMemo;
    FStack.Push(obj);
  end;
end;

procedure TUndoClass.DelRedoStack;
var
  i: integer;
begin
  if FReStack.Count > 0 then
    for i := 1 to FReStack.Count do
      FReStack.Pop.Free;
end;

procedure TUndoClass.DelReturn(num: integer; top: Boolean);
var
  obj: TUnDelRet;
begin
  obj := TUnDelRet.Create;
  obj.FPos := num;
  obj.FTop := top;
  obj.FMemo := FMemo;
  FStack.Push(obj);
end;

destructor TUndoClass.Destroy;
begin
  Clear;
  FStack.Free;
  FReStack.Free;
  inherited;
end;

procedure TUndoClass.Execute;
var
  obj: TUndoBase;
begin
  if FStack.Count > 0 then
  begin
    obj := FStack.Pop as TUndoBase;
    obj.Execute;
    FReStack.Push(obj);
  end;
end;

function TUndoClass.GetCanRedo: Boolean;
begin
  result := FReStack.Count > 0;
end;

function TUndoClass.GetCanUndo: Boolean;
begin
  result := FStack.Count > 0;
end;

procedure TUndoClass.Inputted(c: Char; pos: integer);
var
  data: TUnPaste;
begin
  DelRedoStack;
  if (FCnt > 0) and (FStack.Count > 0) and (FStack.Peek is TUnPaste) then
  begin
    data := FStack.Peek as TUnPaste;
    data.FLen := data.FLen + 1;
    data.FStr := data.FStr + c;
  end
  else
  begin
    data := TUnPaste.Create;
    data.FPos := pos;
    data.FLen := 1;
    data.FStr := c;
    data.FMemo := FMemo;
    FStack.Push(data);
  end;
end;

procedure TUndoClass.Pasted(const str: string; pos: integer);
var
  obj: TUnPaste;
begin
  DelRedoStack;
  obj := TUnPaste.Create;
  obj.FPos := pos;
  obj.FLen := Length(str);
  obj.FStr := str;
  obj.FMemo := FMemo;
  FStack.Push(obj);
end;

procedure TUndoClass.ReDo;
var
  obj: TUndoBase;
begin
  if FReStack.Count > 0 then
  begin
    obj := FReStack.Pop as TUndoBase;
    obj.ReDo;
    FStack.Push(obj);
  end;
end;

procedure TUndoClass.ResetBack;
begin
  FBack := 0;
end;

procedure TUndoClass.ResetCnt;
begin
  FCnt := 0;
end;

procedure TUndoClass.ResetDel;
begin
  FDel := 0;
end;

procedure TUndoClass.Returned(pos: integer);
var
  obj: TUnRETURN;
begin
  DelRedoStack;
  obj := TUnRETURN.Create;
  obj.FPos := pos;
  obj.FMemo := FMemo;
  FStack.Push(obj);
end;

procedure TUndoClass.SetMemo(const Value: TCustomMemo);
var
  obj: TUndoBase;
  i: integer;
  List: TList;
begin
  FMemo := Value;
  List := TList.Create;
  for i := 1 to FStack.Count do
  begin
    obj := FStack.Pop as TUndoBase;
    obj.FMemo := Value;
    List.Add(obj);
  end;
  for i := List.Count - 1 downto 0 do
    FStack.Push(List[i]);
  List.Free;
end;

procedure TUndoClass.UpBackCnt;
begin
  inc(FBack);
  if FBack > 5 then
    FBack := 0;
end;

procedure TUndoClass.UpCount;
begin
  inc(FCnt);
  if FCnt > 5 then
    FCnt := 0;
end;

procedure TUndoClass.UpDelCnt;
begin
  inc(FDel);
  if FDel > 5 then
    FDel := 0;
end;

{ TUnDelete }

procedure TUnDelete.Execute;
begin
  FMemo.SelStart := FPos;
  FMemo.SelText := FStr;
  FMemo.SelStart := FPos;
  if Length(FStr) > 1 then
    FMemo.SelLength := Length(FStr);
  if FTop = true then
  begin
    FMemo.SelLength := Length(FStr);
    FMemo.SelStart := FPos;
  end
  else
  begin
    FMemo.SelLength := Length(FStr);
    FMemo.SelStart := FPos + Length(FStr);
  end;
end;

procedure TUnDelete.ReDo;
begin
  if FMemo <> nil then
  begin
    FMemo.SelStart := FPos;
    FMemo.SelLength := Length(FStr);
    FMemo.SelText := '';
  end;
end;

{ TUnPaste }

procedure TUnPaste.Execute;
begin
  if FMemo <> nil then
  begin
    FMemo.SelStart := FPos;
    FMemo.SelLength := FLen;
    FMemo.SelText := '';
  end;
end;

procedure TUnPaste.ReDo;
begin
  if FMemo <> nil then
  begin
    FMemo.SelStart := FPos;
    FMemo.SelText := FStr;
    FMemo.SelLength := FLen;
    FMemo.SelStart := FPos + FLen;
  end;
end;

{ TUnRETURN }

procedure TUnRETURN.Execute;
var
  i: integer;
begin
  if FMemo <> nil then
  begin
    FMemo.SelStart := FPos;
    i := FMemo.CaretPos.Y;
    FMemo.Lines[i] := FMemo.Lines[i] + FMemo.Lines[i + 1];
    FMemo.Lines.Delete(i + 1);
    FMemo.SelStart := FPos;
  end;
end;

procedure TUnRETURN.ReDo;
begin
  if FMemo <> nil then
  begin
    FMemo.SelStart := FPos;
    FMemo.SelText := #13#10;
  end;
end;

{ TUnDelRet }

procedure TUnDelRet.Execute;
begin
  if FMemo <> nil then
  begin
    FMemo.SelStart := FPos;
    FMemo.SelText := #13#10;
    if FTop = false then
      FMemo.SelStart:=FMemo.SelStart+1;
  end;
end;

end.
