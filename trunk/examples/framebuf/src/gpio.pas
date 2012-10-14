unit gpio;

interface

var
    LGPFSEL1: ^LongWord;
    LGPSET0: ^LongWord;
    LGPCLR0: ^LongWord;
    ar: longword;

procedure gpioinit;
procedure okledenable();
procedure okledon();
procedure okledoff();
procedure dummy ( value: longword ); external 'dummy';

implementation

procedure gpioinit();
begin
	LGPFSEL1 := pointer($20200000+4);
	LGPCLR0 := pointer($20200000+40); //0x28
	LGPSET0 := pointer($20200000+28); //0x1C
end;

procedure okledenable();
begin	
ar := LGPFSEL1^;
ar := ar and not (7 shl 18);
ar := ar or (1 shl 18);
LGPFSEL1^:=ar;
end;

procedure okledon();
begin
	LGPCLR0^ := 1 shl 16;
end;

procedure okledoff();
begin
	LGPSET0^ := 1 shl 16;
end;

end.
