.model small
.stack 100h
.data
	msg1 db "Enter your numbers: ", "$"
	msg2 db "Largest Number in array is: ", "$"
	newline db 10,13,"$"
	pno dw 0
	cno dw 0
	ten dw 10
	intArr dw 5 dup(0)
	large dw 0
.code
  main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset msg1
	call coutstr

	mov si,offset intArr
	call getnum
	mov ax,pno
	mov [si],ax
	add si,2
	mov large,ax

	mov cx,4
	inputArr:
		call getnum
		mov ax,pno
		mov [si],ax
		add si,2
		cmp large,ax
		jg skip
		mov large,ax
		skip: 
			loop inputArr

	mov dx,offset msg2
	call coutstr

	mov ax,large
	mov pno,ax
	call shownum

	

	mov ah,04ch
	int 21h
  main endp
  include io.lib
end