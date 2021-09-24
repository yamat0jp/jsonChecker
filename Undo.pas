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
  end;

  TUnInput = class(TUndoBase)
  private
    FData: Char;
  public
    procedure Execute; override;
  end;

  TUnDelete = class(TUndoBase)
  private
    FStr: string;
    FTop: Boolean;
  public
    procedure Execute; override;
  end;

  TUnPaste = class(TUndoBase)
  private
    FLen: integer;
  public
    procedure Execute; override;
  end;

  TUndoClass = class(TComponent)
  private
    FStack: TObjectStack;
    FMemo: TCustomMemo;
    function GetCanUndo: Boolean;
    procedure Press;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Deleted(const str: string ; pos: integer; top: Boolean);
    procedure Inputted(c: Char; pos: integer);
    procedure Pasted(const str: string; pos: integer);
    procedure Execute;
    destructor Destroy; override;
  published
    property Memo: TCustomMemo read FMemo write FMemo;
    property CanUndo: Boolean read GetCanUndo;
  end;

implementation

{ TUndoClass }

constructor TUndoClass.Create(AOwner: TComponent);
begin
  inherited;
  FStack := TObjectStack.Create;
end;

procedure TUndoClass.Deleted(const str: string; pos: integer; top: Boolean);
var
  obj: TUnDelete;
begin
  obj := TUnDelete.Create;
  obj.FStr := str;
  obj.FPos := pos;
  obj.FTop := top;
  obj.FMemo := FMemo;
  FStack.Push(obj);
end;

destructor TUndoClass.Destroy;
var
  i: integer;
begin
  for i := 0 to FStack.Count - 1 do
    FStack.Pop;
  FStack.Free;
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
  end;
end;

function TUndoClass.GetCanUndo: Boolean;
begin
  result := FStack.Count > 0;
end;

procedure TUndoClass.Inputted(c: Char; pos: integer);
var
  obj: TUnInput;
begin
  obj := TUnInput.Create;
  obj.FData := c;
  obj.FPos := pos;
  obj.FMemo := FMemo;
  FStack.Push(obj);
end;

procedure TUndoClass.Pasted(const str: string; pos: integer);
var
  obj: TUnPaste;
begin
  obj := TUnPaste.Create;
  obj.FPos := pos;
  obj.FLen := Length(str);
  obj.FMemo := FMemo;
  FStack.Push(obj);
end;

procedure TUndoClass.Press;
begin

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
    FMemo.SelStart := FPos;
    FMemo.SelLength := Length(FStr);
  end;
end;

{ TUnPaste }

procedure TUnPaste.Execute;
begin
  FMemo.SelStart := FPos;
  FMemo.SelLength := FLen;
  FMemo.SelText := '';
end;

{ TUnInput }

procedure TUnInput.Execute;
begin
  FMemo.SelStart:=FPos;
  FMemo.SelLength := 1;
  FMemo.SelText:='';
end;

end.
