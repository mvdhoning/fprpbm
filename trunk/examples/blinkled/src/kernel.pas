{
FreePascal RaspberyPi Bare Metal Kernel
}
 
unit kernel;

interface

uses gpio;
 
procedure kmain(); stdcall;
procedure rpiwait(); stdcall; external 'rpiwait';
procedure pwait();

implementation
 
var
    flag: integer;
    wait: integer;

procedure pwait();
//var wait: integer; //TODO with wait as var here things get unstable?
begin
	wait := $3F000;
	repeat
	begin
		wait := wait -1;
	end;
	until wait = 0;
end;

procedure kmain(); stdcall; [public, alias: 'kmain'];
begin
	flag := 0;

	gpioinit; //init memory for gpio
	okledenable(); //enable output on ok led

	while flag = 0 do //go into an endless loop
	begin
		okledon();
		pwait();
	
		okledoff();
		pwait();
	end;
end;
 
end.
