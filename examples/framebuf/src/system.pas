unit system;
 
interface
 
type
 cardinal = 0..$FFFFFFFF;
 hresult = cardinal;
 dword = cardinal;
 integer = longint;
 
 pchar = ^char;
 longstring = pchar;
 plongint = ^longint;

const
{ Internal functions }
   fpc_in_chr_byte          = 7;

Function chr(b : byte) : Char;      [INTERNPROC: fpc_in_chr_byte];
function strlen(p: pchar): longint;
//Function Length (Const S : LongString) : Longint;

implementation

function strlen(p: pchar): longint;
var i : longint;
begin
  i:= 0; while p[i]<>#0 do inc(i); strlen:= i; exit;
end;

//Function Length (Const S : LongString) : Longint;
//begin
//  Length:=PLongint(S)^;
//end;

end.
