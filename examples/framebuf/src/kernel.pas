{
FreePascal RaspberyPi Bare Metal Kernel
}
 
unit kernel;

interface

uses gpio, uart, mailbox, fb;
 
procedure kmain(); stdcall;
procedure pwait();


implementation
 
var
    flag: integer;
    wait: integer;
    //x, y, z: integer;
    mbtest: ^tmb;
    width, height: longword;

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

//header
  mbtest^[0]:=8*4; //size
  mbtest^[1]:=0; //0 is request
//start record
  mbtest^[2]:=$40003; //display size tag
  mbtest^[3]:=8; //size of the response buffer
  mbtest^[4]:=0; //size of the request
//start of request/response
  mbtest^[5]:=0; //x
  mbtest^[6]:=0; //y
//end record
  mbtest^[7]:=0; //end tag

  mailboxwrite(8, $1000); //kan ik mbtest aan een specifiek adres toewijzen als $1000

  ar := mailboxread(8);
  width:= mbtest^[5];
  height:= mbtest^[6];	

  okledon();

  framebufferinit();
  framebufferfillscreen();


	while flag = 0 do //go into an endless loop
	begin

	  uart_puts( ' read res ' );
	  //uart_puts( makehex(ar) );
  //        uart_puts( pchar(makehex( mbtest^[1] )) );
  //        uart_puts( pchar(makehex( mbtest^[4] )) );

	  uart_puts( makehex( width ) );
	  uart_puts('|');
	  uart_puts( makehex( height ) );

	  uart_puts( ' end read res ' );
	  
	fbdebug();

	end;
end;
 
end.
