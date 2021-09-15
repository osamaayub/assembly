[org 0x100]
jmp start
start:
mov ax, 0xb800;video memory base address
Mov es, ax;point es to the video Memory
mov bh,0x05;attribute byte
mov bl,026; ascii value of 26(Decimal Value)
mov di,0; last character of first row the screen
mov cx,[size];this will print all the ascii values between 
L3:
Mov word[es:di],bx ;print ascii value on the screen
inc bx;increment bx to print the next number's ascii value
Add di,2;move to the next screen location(screen location=2 bytes)
loop L3;continue until all the ascii values are printed till 92
exit:
mov ax,0x4c00
int 21h
size:dw 66