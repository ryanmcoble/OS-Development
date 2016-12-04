[bits 16] ; Instruct nasm to output 16-bit opcodes


; Include our prepared global descriptor table structure
%include "src/boot_loader/_inc/gdt.asm"


; Switching to protected mode
switch_to_pm:

	cli					    ; We much switch off interupts until we have setup the protected mode interupt vector, 
							; otherwise interupts will run amuck.

	lgdt [gdt_descriptor]   ; Load out global descriptor table, which defines the protected mode segments (e.g. for code and data).

	mov eax, cr0            ; To make the switch into protected mode, we set the first bit to CR0, a special CPU control register.
	or eax, 0x1
	mov cr0, eax

	jmp CODE_SEG:init_pm    ; Make a far jump (i.e. to a new segment) to our 32-bit code. This also forces the CPU to flush its cache of pre-fetched
						    ; and real-mode decoded instructions, which can cause problems for certain processors.


[bits 32] ; Instruct nasm to output 32-bit opcodes

; Initialize registers and the stack once in PM.
init_pm:
	
	mov ax, DATA_SEG      	; Now in PM, our old code segments are meaningless,
	mov ds, ax				; so we point our segment registers to the data sector we defined in our GDT.
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000		; Update our stack position so it is right at the top of the free space.
	mov esp, ebp

	call BEGIN_PROTECTED_MODE ; Finally, call some well-known label where general 32-bit code may take over to boot the 32-bit OS.


[bits 16] ; Instruct nasm to output 16-bit opcodes