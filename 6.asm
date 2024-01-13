.model small
.stack 100h
.data
	msg1 db "Enter number: ", "$"
	msg2 db "Factorial of given number is: ", "$"
	pno dw 0
	cno dw 0
	ten dw 10
	fact1 dw 1
	
.code
  main proc
	mov ax,@data
	mov ds,ax

	mov ah,09h
	mov dx,offset msg1
	int 21h

	call getnum

	mov cx,pno
	Fact:
		cmp cx,1
		jl DisplayFact
		mov ax,fact1
		mul cx
		mov fact1,ax
		loop Fact
	
	DisplayFact:
		mov ah,09h
		mov dx,offset msg2
		int 21h
		
		mov ax,fact1
		mov pno,ax
		call shownum
	

	mov ah,04ch
	int 21h
  main endp
  include io.lib
end