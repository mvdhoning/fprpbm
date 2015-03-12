# Introduction #

To debug what is happening on the Raspberry Pi we need a way to get contents of variables and hints of where the program is to be logged. The easiest way to do this is getting some kind of serial communication working.

# Details #

Via gpio the Raspberry Pi provides an mini uart via gpio pin 14 (tx) and gpio pin 15 (rx). Note: make sure you use 3.5v ftdi cable. Normal usb -> serial use a to high voltage (5v) for the Raspberry Pi.

The startup of this example has changed to use 'new' kernel style so it now actualy loads and start at $8000.

For now we are only interested in sending data and no recieving data so we ignore pin 15 (rx) for now.

For the uart to function we need to enable it first:
  * write 1 to bit 0 of AUXENABLES

You can control the uart with interupts if needed but for now we dont do that so:
  * write 0 to AUX\_IER\_REG

For now we disable auto flow control:
  * write 0 to AUX\_CNTL\_REG

We want 8bit mode communication so:
  * write 3 to AUX\_MU\_LCR\_REG (now according to the manual we should write 1 to bit 0 but its wrong, have a look at the errata)

We dont want to use RTS so:
  * write 0 to AUX\_MU\_MCR\_REG

Again as we dont use inerrupts we:
  * write 0 to AUX\_MU\_IER\_REG (see page 12 of manual)

Next we want to enable FIFO and clear the FIFO:
  * enabling the FIFO goes with bits 6 and 7
  * clearing the FIFO goes with bits 1 and 2
  * so we write 11000110 ($C6) to AUX\_MU\_IIR\_REG
  * (see page 13 of manual)

To get a baud rate of 115200 we need to do some math:
  * ((system\_clock\_freq/ baudrate) / 8) - 1 =baudrate\_reg
  * ((250 000 000 / 115200) / 8) -1 = 270
  * write the outcome to AUX\_MU\_BAUD\_REG

Now, like with the led example we also need to enable gpio pins. In this case gpio pin 14 (tx). But this time we cannot just enable output as we need to select an alternate function (alt5 for uart1).

To be sure we also disable the pull up down on pin 14.
  * write 0 to GPPUD
  * wait 150 ticks
  * write pin 14 to GPPUDCLK0
  * wait 150 tick
  * write 0 to GPPUDCLK0

Now we can enable auto flow:
  * write 1 to bit 2 of AUX\_MU\_CNTL\_REG

So with the uart1 enabled we are ready to go send some data out.

Sending data goes like this:
  * check if the transmit fifo can accept at least one byte
  * we do this by checking if bit 5 of AUX\_MU\_LSR\_REG is set (remember other bits may also bet set but we are only interested in bit 5)
  * so in fpc we can do a check like this: if boolean(AUX\_MU\_LSR\_REG^ and $20)=true then
  * When the fifo is ready we can write the ascii value of the character we want to send to AUX\_MU\_IO\_REG as an longword

this is implemented in uart.pas

uartinit() prepares the raspberry pi for serial communication on uart1

uart\_putc( c: char ) writes an character to the uart


The code is based on the uart01 example from dwelch67 wo did a great job on making an working uart example inspite of the errors in the manual : https://github.com/dwelch67/raspberrypi/tree/master/uart01