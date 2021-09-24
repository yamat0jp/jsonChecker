unit Undo;

interface

uses System.Contnrs, System.Classes, Vcl.StdCtrls;

type
  TUndoMethod = procedure(const str: string; pos: integer) of Object;

  TUndoItem = class
  public
    str: string;
    pos: integer;
    top: Boolean;
    meth: TUndoMethod;
  end;

  TUndoClass = class(TComponent)
  private
    FStack: TObjectStack;
    FMemo: TCustomMemo;
    procedure UnDelete(const str: string; pos: integer);
    procedure UnInput(const str: string; pos: integer);
    procedure UnPaste(const str: string; pos: integer);
    function GetCanUndo: Boolean;
  protected
    FTop: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Deleted(const str: string; pos: integer; top: Boolean);
    procedure Inputted(const str: string; pos: integer);
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
  obj: TUndoItem;
begin
  obj := TUndoItem.Create;
  obj.str := str;
  obj.pos := pos;
  obj.top := top;
  obj.meth := UnDelete;
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
  obj: TUndoItem;
begin
  if FStack.Count > 0 then
  begin
    obj := FStack.Pop as TUndoItem;
    FTop := obj.top;
    obj.meth(obj.str, obj.pos);
  end;
end;

function TUndoClass.GetCanUndo: Boolean;
begin
  result := FStack.Count > 0;
end;

procedure TUndoClass.Inputted(const str: string; pos: integer);
var
  obj: TUndoItem;
begin
  obj := TUndoItem.Create;
  obj.str := str;
  obj.pos := pos;
  obj.meth := UnInput;
  FStack.Push(obj);
end;

procedure TUndoClass.Pasted(const str: string; pos: integer);
var
  obj: TUndoItem;
begin
  obj := TUndoItem.Create;
  obj.str := str;
  obj.pos := pos;
  obj.meth := UnPaste;
  FStack.Push(obj);
end;

procedure TUndoClass.UnDelete(const str: string; pos: integer);
begin
  Memo.SelStart := pos;
  Memo.SelText := str;
  Memo.SelStart := pos;
  if Length(str) > 1 then
    Memo.SelLength := Length(str);
  if FTop = true then
  begin
    Memo.SelStart := pos;
    Memo.SelLength := Length(str);
  end;
end;

procedure TUndoClass.UnInput(const str: string; pos: integer);
begin
  Memo.SelStart := pos;
  Memo.SelLength := 1;
  Memo.SelText := '';
end;

procedure TUndoClass.UnPaste(const str: string; pos: integer);
begin
  Memo.SelStart := pos;
  Memo.SelLength := Length(str);
  Memo.SelText := '';
end;

end.
