{
FreePascal RaspberyPi Bare Metal Kernel
}
 
unit kernel;

interface

uses gpio, uart, mailbox;
 
procedure kmain(); stdcall;
procedure pwait();


implementation
 
var
    flag: integer;
    wait: integer;
    x, y, z: integer;
    mbtest: ^tmb;

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
	
  mailboxinit();
	
  mbtest := pointer($1000);

  mbtest^[0]:=8*4; //size
  mbtest^[1]:=0; //0 is request
  mbtest^[2]:=$40003; //display size tag
  mbtest^[3]:=8; //buffer size
  mbtest^[4]:=0; //request size
  mbtest^[5]:=0; //x
  mbtest^[6]:=0; //y
  mbtest^[7]:=0; //end tag

  mailboxwrite(8, $1000); //kan ik mbtest aan een specifiek adres toewijzen als $1000
  okledon();
  ar := mailboxread(8);
	
	while flag = 0 do //go into an endless loop
	begin

	  uart_puts( 'Hello World' );
	  uart_puts( makehex(30) );

	  uart_puts( makehex(mbtest^[5]) );
	  uart_puts('|');
	  uart_puts( makehex(mbtest^[6]) );

	end;
end;
 
end.
