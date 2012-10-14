unit fb;

interface

uses gpio, uart, mailbox, font;

type
TRGB = packed record R, G, B: Byte; end;

//bit = 0..1;

TFlag = packed record
   case integer of
      0: (fullByte : Byte);
      1: (oneBit : bitpacked array[0..7] of boolean); //of bit
end;


(*
	{$ALIGN 16}
	tframebufferinfo = record
		width: longword;
		height: longword;
		vwidth: longword;
		vheight: longword;
		gpupitch: longword;
		bitdepth: longword;
		x: longword;
		y: longword;
		gpupointer: longword;
		gpusize: longword;	
	end;
*)
 
//	tfbi = array of longword;


var 
//	{$ALIGN 16}
//	framebufferinfo: ^tframebufferinfo;
     
//	fbi : tfbi;
        //fbi : ^tfbi;
        mailbuffer : ^tmb;
        framebufferbase: ^longword;
fbb: longword;
	tempfb: ^trgb;
//	mailboxresult: longword;
	teller: longword;
        rmb: longword;
color: trgb;
red,green,blue: byte;
c: longword;
ar: longword;
count: longword;
pitch: longword;
countx, county: longword;
addr: longword;
pixelwidth: longword;
flag: TFlag;
charpos: longword;
row: longword;
bit: longword;
y: longword;

//function InitialiseFrameBuffer(width: word; height: word; bitDepth: word): pointer; softfloat; external 'InitialiseFrameBuffer';

procedure framebufferinit();
procedure framebufferdrawchar(ac: longword; ax: longword; ay: longword);
procedure framebufferdrawpixel(acolor: trgb; ax:longword; ay:longword);
procedure framebufferfillscreen();
procedure fbdebug();

implementation

procedure framebufferinit();
begin

//okledoff();

//data structure
(*
framebufferinfo := pointer($1000);
framebufferinfo^.width := 1024;
framebufferinfo^.height := 768;
framebufferinfo^.vwidth:= 1024;
framebufferinfo^.vheight:= 768;
framebufferinfo^.gpupitch:= 0;
framebufferinfo^.bitdepth:= 16;
framebufferinfo^.x := 0;
framebufferinfo^.y := 0;
framebufferinfo^.gpupointer:= 0;
framebufferinfo^.gpusize:=0;
*)
(*
fbi := pointer($1000);
fbi^[0]:=1024; //width
fbi^[1]:=768; //height
fbi^[2]:=1024; //virtual width
fbi^[3]:=768; //virtual height
fbi^[4]:=0; //pitch
fbi^[5]:=16; //depth
fbi^[6]:=0; //xoffset
fbi^[7]:=0; //yoffset
fbi^[8]:=0; //address
fbi^[9]:=0; //size
fbi^[10]:=0; //something extra
*)
  mailbuffer := pointer($1000);
  
  mailbuffer^[0] := 22*4;
  mailbuffer^[1] := 0;		// Request

  mailbuffer^[2] := $00048003;	// Tag id (set physical size)
  mailbuffer^[3] := 8;		// Value buffer size (bytes)
  mailbuffer^[4] := 8;		// Req. + value length (bytes)
  mailbuffer^[5] := 1024;		// Horizontal resolution
  mailbuffer^[6] := 768;		// Vertical resolution

  mailbuffer^[7] := $00048004;	// Tag id (set virtual size)
  mailbuffer^[8] := 8;		// Value buffer size (bytes)
  mailbuffer^[9] := 8;		// Req. + value length (bytes)
  mailbuffer^[10] := 1024;		// Horizontal resolution
  mailbuffer^[11] := 768;		// Vertical resolution

  mailbuffer^[12] := $00048005;	// Tag id (set depth)
  mailbuffer^[13] := 4;		// Value buffer size (bytes)
  mailbuffer^[14] := 4;		// Req. + value length (bytes)
  mailbuffer^[15] := 24;		// 16 bpp

  mailbuffer^[16] := $00040001;	// Tag id (allocate framebuffer)
  mailbuffer^[17] := 8;		// Value buffer size (bytes)
  mailbuffer^[18] := 4;		// Req. + value length (bytes)
  mailbuffer^[19] := 16;		// Alignment = 16
  mailbuffer^[20] := 0;		// Space for response

  mailbuffer^[21] := 0;		// Terminating tag

  
rmb:=0;
mailboxwrite(8,$1000); //shr 4
//okledoff();
rmb := mailboxread(8);



count:=2;

while(count<>c) do
begin
	ar := mailbuffer^[count];
	if(ar = $40001) then break;

		(* Skip to next tag
		 * Advance count by 1 (tag) + 2 (buffer size/value size)
		 *                          + specified buffer size
		*)
		count := count + 3+(mailbuffer^[count+1] shr 2);

		//if(count>c)
		//	fb_fail(FBFAIL_INVALID_TAGS);
end;

//okledon();


//okledoff();

//okledoff();
//if rmb <> 1 then
//begin
// okledon();
//end;

//okledoff();
//if fbi^[8] = 0 then
//begin
// okledon();
//end;

//fbir := pointer(rmb);

//if fbi[9] > 0 then
//begin
// okledon();
//end;

//framebufferbase := pointer(framebufferinfo^.gpupointer);
//framebufferbase := pointer(fbi^[8]);
fbb := mailbuffer^[count+3];
framebufferbase := pointer(mailbuffer^[count+3]);

mailbuffer^[0] := 7 * 4;		// Total size
mailbuffer^[1] := 0;		// Request
mailbuffer^[2] := $40008;		// Display size
mailbuffer^[3] := 4;		// Buffer size
mailbuffer^[4] := 0;		// Request size
mailbuffer^[5] := 0;		// Space for pitch
mailbuffer^[6] := 0;		// End tag

rmb:=0;
mailboxwrite(8,$1000); //shr 4
//okledoff();
rmb := mailboxread(8);

pitch := mailbuffer^[5];

//framebufferbase := InitialiseFrameBuffer(1024,768,16);

//if framebufferbase = nil then
//begin
// okledon();
//end;

//now we have the framebuffer address in gpupointer;



end;

procedure fbdebug();
begin
uart_puts( ' fddebug ' );
//uart_puts( pchar(makehex( mailbuffer^[1] )) );
//uart_puts(' | ');
//uart_puts( pchar(makehex( mailbuffer^[count+0] )) );
//uart_puts( pchar(makehex( mailbuffer^[count+1] )) );
//uart_puts( pchar(makehex( mailbuffer^[count+2] )) );
//uart_puts( pchar(makehex( mailbuffer^[count+3] )) );
//uart_puts( pchar(makehex( mailbuffer^[count+4] )) );
uart_puts( pchar(makehex( mailbuffer^[5] )) );
//uart_puts( pchar(makehex( mailbuffer^[count+6] )) );
(*
if ($1000 and 15) <> 0 then
begin
	uart_puts('not 16 byte algined');
end;
*)
uart_puts( ' end fddebug ' );

flag.fullbyte := $1;
flag.onebit[0] := true;

end;

procedure framebufferdrawchar(ac: longword; ax: longword; ay: longword);
begin
pos := ac * 16;
row := 0;
y:=ay;
for row:=0 to 15 do
begin
  bit:=0;
  for bit:=0 to 7 do
  begin
     if (tflag(defaultfont[pos+row]).onebit[bit]=true) then
     begin
     	framebufferdrawpixel(color,ax+bit,y);
     end;
	//framebufferdrawpixel(color,ax+bit,y);
  end;
  y:=y+1;
end;

end;

procedure framebufferdrawpixel(acolor: trgb; ax:longword; ay:longword);
begin
	addr:=(ax + (ay * 1024)) * 3; // 1024=width 3=pixelwidth in bytes (24bit)
	tempfb := pointer(fbb + addr);
	tempfb^ := acolor;
end;

procedure framebufferfillscreen();
begin
//red:=$FF;
//green:=$00;
//blue:=$00;
//color := (blue shr 8) shl 8 + (green shr 8) shl 8 + (red shr 8) shl 8;
color.r := $00;
color.g := $FF;
color.b := $00;

pixelwidth:=$1;
addr:=0;
//tempfb := framebufferbase;
county:=0; 
for county := 0 to (768)-1 do
	begin
		countx:=0;
		for countx := 0 to (1024)-1 do
      		begin					
			//tempfb := pointer(fbb + addr);
			//tempfb^ := color;
			//addr:=addr+3;
			framebufferdrawpixel(color,countx,county);

		end;
		
	end;

color.r := $FF;
color.g := $00;
color.b := $00;
//framebufferdrawchar(longword(char('a')), 0, 0); 
framebufferdrawchar(97, 16, 16); 

end;



end.
