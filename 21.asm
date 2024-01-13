.model small
.stack 100h
.data
	msg1 db "Enter number: ", "$"
	msg2 db "Reverse of given number is: ", "$"
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

	call getnum

	mov ah,09h
	mov dx,offset msg2
	int 21h

	mov ax,pno

	dispReverse:
		mov dx,0
		div ten
		mov pno,dx
		call shownum
		cmp ax,0
		jne dispReverse

	mov ah,04ch
	int 21h
  main endp
  include io.lib
end