;
; Print value in dx as hex
;
print_hex:
  	push bx
  	push si

  	mov bx, dx
  	shr bx, 12
  	and bx, 0xf
  	add bx, HEXABET
  	mov bl, [bx]
  	mov [HEX_TEMPLATE + 2], bl

  	mov bx, dx
  	shr bx, 8
  	and bx, 0xf
  	add bx, HEXABET
  	mov bl, [bx]
  	mov [HEX_TEMPLATE + 3], bl

  	mov bx, dx
  	shr bx, 4
  	and bx, 0xf
  	add bx, HEXABET
  	mov bl, [bx]
  	mov [HEX_TEMPLATE + 4], bl

  	mov bx, dx
  	and bx, 0xf
  	add bx, HEXABET
  	mov bl, [bx]
  	mov [HEX_TEMPLATE + 5], bl
  
  	mov si, HEX_TEMPLATE
  	call print_string

  	pop si
  	pop bx
  	ret