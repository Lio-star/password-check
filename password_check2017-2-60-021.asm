; password is = 'raunaq123'
.model small
.stack 100h
.data
a db 'Enter your password $'
ok db 'Correct password $'
notok db 'Wrong password $'
pass db 'raunaq123'
pass1 dw 9
.code
main proc
    mov ax,@data  ; declare data segment in code segment
    
    mov ds, ax
    
    mov cx,pass1
    mov bx, offset pass
    
    mov ah,9
    lea dx,a ; load effictive address
    int 21h
    
    l1:  
    mov ah,8 ; hidden input
    int 21h
    
    cmp al, [bx] ; compare password
    
    jne l2
    inc bx ; increment offset address
    loop l1
    
    mov ah,9
    lea dx,ok ; print password is correct
    int 21h
    jmp exit
    
    l2:
    mov ah,9
    lea dx, notok ; password is not correct 
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main