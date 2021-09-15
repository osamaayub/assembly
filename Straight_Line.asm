[org 0x100]
jmp start

start:
mov ax,0xb800
mov es,ax
mov di, 0

mov cx,12
mov ah,0x06
mov al,'*'
l1:
mov word[es:di],ax
add di,160
loop l1


mov cx,12
mov ax,0xb800
mov es,ax
mov di, 80
mov ah,0x05
mov al,'*'
l2:
mov word[es:di],ax
add di,160
loop l2

end:
mov ax,0x4c00
int 21h
