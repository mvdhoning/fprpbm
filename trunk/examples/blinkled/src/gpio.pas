unit gpio;

interface

var
    GPFSEL1: ^LongWord;
    GPSET0: ^LongWord;
    GPCLR0: ^LongWord;

procedure gpioinit;
procedure okledenable();
procedure okledon();
procedure okledoff();

implementation

procedure gpioinit();
begin
	GPFSEL1 := pointer($20200000+4);
	GPCLR0 := pointer($20200000+40);
	GPSET0 := pointer($20200000+28);
end;

procedure okledenable();
begin
	GPFSEL1^ := 1 shl 18;
end;

procedure okledon();
begin
	GPCLR0^ := 1 shl 16;
end;

procedure okledoff();
begin
	GPSET0^ := 1 shl 16;
end;

end.
