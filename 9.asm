.model small
.stack 100h
.data
	msg1 db "Counting from 1 to 100: ", "$"
	newline db 10,13,"$"
	pno dw 0
	cno dw 0
	ten dw 10
.code
  main proc
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	call coutstr
	
	mov cx,100
	counting:
		inc pno
		call shownum
		mov dx,offset newline
		call coutstr
		loop counting

	mov ah,04ch
	int 21h
  main endp
  include io.lib
end