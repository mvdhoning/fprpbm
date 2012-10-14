unit mailbox;

interface

uses gpio, uart;

type
 tmb= array[0..22] of longword;
 //tmb= array of longword;

var
    MAILBOX_READ: ^LongWord;
    MAILBOX_STATUS: ^LongWord;
    MAILBOX_WRITE: ^LongWord;
    MAILBOX_FULL: LongWord;
    MAILBOX_EMPTY: LongWord;
    data: LongWord;

procedure mailboxinit();
procedure MailboxWrite(channel: longword; data: longword);
function MailboxRead(channel: longword): longword;

implementation

procedure mailboxinit();
begin
	MAILBOX_READ := pointer($2000b880);
	MAILBOX_STATUS := pointer($2000b898);
	MAILBOX_WRITE := pointer($2000b8a0);
	MAILBOX_FULL := $80000000;
	MAILBOX_EMPTY := $40000000;
end;

procedure mailboxwrite(channel: longword; data: longword);
begin
	while (boolean(MAILBOX_STATUS^ and MAILBOX_FULL)=true) do
	begin
		//do something;
		dummy(0);
	end;
	MAILBOX_WRITE^ := (data and $fffffff0) or channel;
end;

function mailboxread(channel: longword): longword;
begin
        data:=0;
        repeat	
	begin
	  while (boolean(MAILBOX_STATUS^ and MAILBOX_EMPTY)=true) do
	  begin
		//do something
		dummy(0);
	  end;
	  data := MAILBOX_READ^;
	end;
	until ((data and 15) = channel); //15 is ongelijk aan $F
	mailboxread := data;//(data and $FFFFFFF0) shr 4;
end;

end.
