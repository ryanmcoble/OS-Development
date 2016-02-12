; GDT: global descriptor table, which defines protected mode memory segments
;---------------------------------------------------------------------------


; See the following for reference
;  http://wiki.osdev.org/Global_Descriptor_Table
;  http://wiki.osdev.org/GDT_Turorial (using C)
;  http://download.intel.com/products/processor/manual/325462.pdf


gdt_start:

gdt_null:	; the mandatory null descriptor
	dd 0x0	; 'dd' means define double words (i.e. 4 bytes)
	dd 0x0

gdt_code:	; the code segment descriptor
	; base = 0x0, limit = 0xfffff
	;  first flags: 1 (present), 00 (priviledge), 1 (descriptor type)       		-> 1001b
	;   type flags: 1 (code), 0 (conforming), 1 (readable), 0 (accessed)			-> 1010b
	; second flags: 1 (granularity), 1 (32-bit default), 0 (64-bit seg), 0 (AVL)	-> 1100b
	dw 0xffff 		; Limit (bits 0-15)
	dw 0x0			; Base (bits 0-15)
	db 0x0			; Base (bits 16-23)
	db 10011010b	; 1st flags, type flags
	db 11001111b	; 2nd flags, limit (bits 16-19)
	db 0x0			; Base (bits 24-31)


gdt_data: ; the data segment descriptor
	; Same as code segment except for the type of flags
	; type falgs: 0 (code), 0 (expand down), 1 (writable), 0 (accessed) -> 0010b
	dw 0xffff 		; Limit (bits 0-15)
	dw 0x0			; Base (bits 0-15)
	db 0x0			; Base (bits 16-23)
	db 10010010b	; 1st flags, type flags
	db 11001111b	; 2nd flags, limit (bits 16-19)
	db 0x0			; Base (bits 24-31)


gdt_end:	; The reason for putting label at end of the GDT is so we can have assembler calculate the size of the GDT for the GDT descriptor (below)



; GDT Descriptor: points to the our descriptor table and is passed to the CPU on the switch to protected mode, so it can find our GDT.
;-------------------------------------------------------------------------------------------------------------------------------------

gdt_descriptor:
	dw gdt_end - gdt_start - 1	; Size of our GDT, always one less than the true size
	dd gdt_start				; Start address of GDT


; Define some handy constants for the GDT segment descriptor offsets, which are what segments registers must container when in protected mode.
; For example, when we set DS = 0x10 in PM, the CPU knows that we mean it to use the segment described at offset 0x10 (i.e. 16 bytes) in our GDT.
; Which in our case is the DATA segment (0x0 -> NULL; 0x08 -> CODE; 0x10 -> DATA)
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start