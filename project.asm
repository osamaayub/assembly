[org 0x100]
start:
;CAPTURE KEY.
    mov  ah, 0
    int  16h  

;EVALUATE KEY.    
    cmp  al, 27          ; ESC
    je   Exit
    cmp  ax, 0x4800  ; UP.
    je   moveUp
    cmp  ax, 0x4B00     ; LEFT.
    je   moveLeft
    cmp  ax, 0x4D00     ; RIGHT.
    je   moveRight
    cmp  ax, 0x5000     ; DOWN.
    je   moveDown
	cmp al,0xD;Enter key
	Je Enter
	cmp  ax, 0E08h       ; BackSpace.
    je   back_Space
    cmp  al, 32;space 
    jae  any_char
    jmp  start   

;DISPLAY LETTER, DIGIT OR ANY OTHER ACCEPTABLE CHAR.
any_char:
    mov  ah, 9
    mov  bh, 0
    mov  bl,0xF0 ;white backdgound with black foreground color                       
    mov  cx, 1           ; how many times display char.
    int  10h             ; display char in al.
;UPDATE CHAR IN MATRIX.    
    mov  si, curr_line   ; si points to the beginning of the line.
    add  si, curr_char   ; si points to the char in the line.
    mov  [ si ], al      ; the char is in the matrix.   

;!!! EXTREMELY IMPORTANT : PREVIOUS BLOCK DISPLAYS ONE
;CHAR, AND NEXT BLOCK MOVES CURSOR TO THE RIGHT. THAT'S
;THE NORMAL BEHAVIOR FOR ALL EDITORS. DO NOT MOVE THESE
;TWO BLOCKS, THEY MUST BE THIS WAY. IF IT'S NECESSARY
;TO MOVE THEM, ADD A JUMP FROM ONE BLOCK TO THE OTHER.

;RIGHT.
moveRight:
    inc  word[curr_char]       ; update current char.
    mov  dl, [Row]
    mov  dh, [Column]
    inc  dl              ; Row ++
    mov  [Row], dl
    jmp  prntCrs

;LEFT.
moveLeft:
    dec  word[curr_char]       ; update current char.
    mov  dl, [Row]
    mov  dh, [Column]
    dec  dl              ; Row --
    mov  [Row], dl
    jmp  prntCrs

;UP.
moveUp: 
    sub word[curr_line], 80   ; update current line.
    mov  dl, [Row]
    mov  dh, [Column]
    dec  dh              ; column -- 
    mov  [Column], dh
    jmp  prntCrs         ; print cursor

;DOWN.
moveDown:   
    add  word[curr_line], 80   ; update current line.
    mov  dl, [Row]
    mov  dh, [Column]
    inc  dh              ; column ++
    mov  [Column], dh
    jmp  prntCrs        

Enter:
mov si, [curr_line]
    add si, 79
    mov word[si], 0dh
    add word[curr_line],80
    mov word[curr_char], 0
    mov byte[Row], 0
    mov dl, [Row]
    mov dh, [Column]
    inc dh
    mov [Column], dh
    add word[length], 80
    jmp prntCrs
	back_Space:
	dec word[curr_char]
    mov si, [curr_line]   ; si points to the beginning of the line.
    add si, [curr_char]   ; si points to the char in the line.
    mov word[ si ], ' '     ; the char is in the matrix.
    dec word[length]          ; count the number of chars
    dec byte[Row]
    mov dl, [Row]
;Move the cursor
    mov  ah, 2h
    int  10h
;Update the Screen    
    mov  al,' '
    mov  ah, 9
    mov  bh, 0
    mov  bl, 0000
    mov  cx, 1           ; how many times display char.
    int  10h             ; display char in al.
    jmp prntCrs
	
prntCrs:                 ; print cursor
    mov  ah, 2h
    int  10h
    jmp  start

Exit:
    int  20h ;exit when esc key is pressed

Row    db 1         ; dh = Row-> controls row
Column    db 1         ; dl = Column -> controls column
matrix    dw 160*25  ; 25 lines of 80 chars each.
curr_line dw '?'
curr_char dw '?'
length:dw 0



