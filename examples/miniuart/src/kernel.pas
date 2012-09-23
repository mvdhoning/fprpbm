{
FreePascal RaspberyPi Bare Metal Kernel
}
 
unit kernel;

interface

uses gpio, uart;
 
procedure kmain(); stdcall;
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

procedure kmain(); [public, alias: 'kmain'];
begin
	flag := 0;

	gpioinit(); //init gpio
	okledenable(); //enable output on ok led

        uartinit(); //init uart



	okledon();
	
	while flag = 0 do //go into an endless loop
	begin

uart_putc('H');
uart_putc ( 'e' );
uart_putc ( 'l' );
uart_putc ( 'l' );
uart_putc ( 'o' );
//uart_putc ( ' ' ); //spatie werkt niet?

		//okledoff();
		//pwait();
	
		//okledon();
		//pwait();
	end;
end;
 
end.
