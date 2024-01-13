.model small
.stack 100h
.data
	msg1 db "Enter your number: ", "$"
	msg2 db "Smallest digit in given number is: ", "$"
	newline db 10,13,"$"
	pno dw 0
	cno dw 0
	ten dw 10
	small dw 0
.code
  main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset msg1
	call coutstr

	call getnum
	
	mov ax,pno
	mov dx,0
	div ten
	mov small,dx
	cmp ax,0
	je showDigit

	GetDigit:
		mov dx,0
		div ten
		cmp dx,small
		jg skip
		mov small,dx
		skip:
		cmp ax,0
		jne GetDigit


	showDigit:
		mov ax,small
		mov pno,ax
		mov dx,offset msg2
		call coutstr
		call shownum	
		
	mov ah,04ch
	int 21h
  main endp
  include io.lib
end