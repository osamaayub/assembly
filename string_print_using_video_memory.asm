 
[org 0x100]
jmp start

str1 db 'Osama',0 
str2 db 'Ayub',0
start: 
mov ax, 0xb800; 
Mov es, ax; 	 	;segment address from where video memory starts. 
mov di,1000
mov cx,6 	 
mov si, str1; 
mov ah,10111011b	 	; string length, 11 characters.  
 label: 	 	; Attribute byte for the characters to be displayed.  
Mov al,[si]; 	 	 	;reading the characters in al. 
Inc si 	 	 	 	; pointing to next character in string 
Mov [es:di],ax;  	 	; printing message on the screen, whole register of size word is written at 
Add di,2; 	 
cmp cx,6
jne skip
change_blinking:
mov ah,00001001b
skip: 
loop label

mov bp,str2
label2:
mov al,[bp]
inc bp
mov word[es:di],ax
add di,2
cmp cx,6
jne skip1

skip1:
loop label2
change_blinking:
mov ah,00001001b
end: 
mov ax,0x4c00
int 21h