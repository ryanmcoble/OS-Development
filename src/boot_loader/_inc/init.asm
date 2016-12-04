
init:
	; Set stack position to 0x8000 (away from our code)
	mov bp, 0xffff ; set the stack base (bottom)
	mov sp, bp     ; set the stack top of the base (i.e an empty stack)

	; print credits message
	mov si, MSG_CREDITS
	call print_string
	
	; print real-mode message
	mov si, MSG_REAL_MODE
	call print_string

	; load C kernel from disk - read the next 9 sectors (9 is the max without switching cylinders)
	mov al, 9
	mov bx, KERNEL_ENTRYPOINT
	call read_from_disk

	; print loading kernel message
	mov si, MSG_KERNEL_LOADED
	call print_string

	; Switch into 32 bit (protected) mode
	call switch_to_pm