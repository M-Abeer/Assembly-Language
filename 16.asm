.model small
.stack 100h
.data
	msg1 db "Enter your number: ", "$"
	msg2 db "Sum of digits is: ", "$"
	newline db 10,13,"$"
	pno dw 0
	cno dw 0
	ten dw 10
	sum dw 0
.code
  main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset msg1
	call coutstr

	call getnum
	
	mov ax,pno
	GetDigit:
		mov dx,0
		div ten
		add sum,dx
		cmp ax,0
		jne GetDigit

	mov ax,sum
	mov pno,ax
	mov dx,offset msg2
	call coutstr
	call shownum	
		
	mov ah,04ch
	int 21h
  main endp
  include io.lib
end