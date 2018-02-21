program Cradle;

const TAB = ^I;

var Look: char;

procedure GetChar;
begin
  Read(Look);
end;

procedure Error(s: string);
begin
  writeln;
  writeln(^G, 'Error: ', s, '.');
end;

procedure Abort(s: string);
begin
  Error(s);
  Halt;
end;

procedure Expected(s: string);
begin
  Abort(s + 'Expected');
end;

procedure Match(x: char);
begin
  if Look = x then GetChar
  else Expected('''' + x + '''');
end;

function IsAlpha(c: char): boolean;
begin
  IsAlpha := upcase(c) in ['A'..'Z'];
end;

function IsDigit(c: char): boolean;
begin
  IsDigit := c in ['0'..'9'];
end;

function GetName: char;
begin
  if not IsAlpha(Look) then Expected('Name');
  GetName := upcase(Look);
  GetChar;
end;

function GetNum: char;
begin
  if not IsDigit(Look) then Expected('Integer');
  GetNum := Look;
  GetChar;
end;

procedure Emit(s: string);
begin
  write(TAB, s);
end;

procedure EmitLn(s: string);
begin
  Emit(s);
  writeln;
end;

procedure Init;
begin
  GetChar;
end;

begin
  Init;
end.
