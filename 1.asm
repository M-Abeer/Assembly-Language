; Input Number and DIsplay
.model small
.stack 100h
.data
	msg1 db "Enter number: ", "$"
	msg2 db "Given number: ", "$"
	pno dw 0
	cno dw 0
	ten dw 10
	
.code
  main proc
	mov ax,@data
	mov ds,ax

	mov ah,09h
	mov dx,offset msg1
	int 21h

	Again:
		mov ah,01h
		int 21h
		cmp al,13
		je EndInput
		sub al,48
		mov ah,0h
		mov cno,ax
		mov ax,pno
		mul ten
		add ax,cno
		mov pno,ax
		jmp Again

	EndInput:
		mov ah,09h
		mov dx,offset msg2
		int 21h

	mov cx,0
	mov ax,pno

	DivAgain:
		mov dx,0
		div ten
		push dx
		inc cx
		cmp ax,0
		jne DivAgain

	ShowNum:
		mov ah,02h
		pop dx
		add dx,48
		int 21H
		loop ShowNum

	mov ah,04ch
	int 21h
  main endp
end