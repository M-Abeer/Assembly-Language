.model small
.stack 100h
.data
	msg1 db "Enter first number: ", "$"
	msg2 db "Enter second number: ", "$"
	msg3 db "Difference of given number is: ", "$"
	newline db 10,13,"$"
	pno dw 0
	cno dw 0
	ten dw 10
	num1 dw 0
	num2 dw 0
	sum dw 0
.code
  main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset msg1
	call coutstr

	call getnum
	mov ax,pno
	mov num1,ax

	mov dx,offset msg2
	call coutstr

	call getnum
	mov ax,pno
	mov num2,ax

	mov ax,num1
	sub ax,num2
	mov pno,ax
	
	mov dx,offset msg3
	call coutstr
	call shownum
		
	mov ah,04ch
	int 21h
  main endp
  include io.lib
end