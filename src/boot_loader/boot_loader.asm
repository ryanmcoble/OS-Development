[bits 16]

; Load the code at the address where boot sectors are known to be loaded
[org 0x7C00]


;
; Initialize boot loader
;
call init


; Infinite Loop
jmp $


;
; Include helper functions
;
%include 'src/boot_loader/_inc/constants.asm'    ; All constants, strings, etc.
%include 'src/boot_loader/_inc/helpers.asm'      ; All the standard helper functions
%include 'src/boot_loader/_inc/helpers_32.asm'   ; All the standard 32 bit helper functions
%include 'src/boot_loader/_inc/init.asm'         ; Initialization function

[bits 32]

; Here is where the CPU jumps after our function switches us into 32-bit protected mode.
BEGIN_PROTECTED_MODE:
	mov esi, MSG_PROTECTED_MODE
	call print_string_pm

	; jmp to where the kernel was loaded
	jmp KERNEL_ENTRYPOINT

	; infinite loop
	jmp $

[bits 16]


;
; Sector padding
;
times 510-($-$$) db 0 ; fill with zeros up to 512 bytes
dw 0x55AA ; sign bootloader to let bios know it is bootable


;
; Entrypoint for the C kernel
;
KERNEL_ENTRYPOINT:
	; kernel code will be loaded here
	