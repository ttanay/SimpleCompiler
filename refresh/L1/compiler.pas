program Cradle; { Program Name  }

const TAB = ^I; { Constant Declarations }

var
  Look: char;  { Lookahead Character }

{ Read new character from i/p stream  }
procedure GetChar;
begin
  Read(Look);
end;

{ Report Error }
procedure Error(s: string)
begin
  WriteLn;
  WriteLn(^G, 'Error: ', s, '.');
end;

{ Report error and halt  }
procedure Abort(s: string)
begin
  Error(s);
  Halt;
end;

{ Report Expected }
procedure Expected(s: string)
begin
  Abort(s: string);
end;

{ Match input }
procedure Match(x: char)
begin
  if Look = x then GetChar
  else Expected('''' + x + '''');
end;
