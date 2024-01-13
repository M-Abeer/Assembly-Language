.model small
.stack 100h
.data
	msg1 db "Enter number: ", "$"
	msg2 db "Given number is even: ", "$"
	msg3 db "Given number is odd: ", "$"
	pno dw 0
	cno dw 0
	ten dw 10
	two dw 2
	
.code
  main proc
	mov ax,@data
	mov ds,ax

	mov ah,09h
	mov dx,offset msg1
	int 21h

	call getnum
	
	mov ax,pno
	mov dx,0
	div two
	cmp dx,0
	je evenNum

	mov ah,09h
	mov dx,offset msg3
	int 21h
	call shownum
	jmp EndShow

	evenNum:
		mov ah,09h
		mov dx,offset msg2
		int 21h
		call shownum
	
	EndShow:
		mov ah,04ch
		int 21h
  main endp
  include io.lib
end