; Here are some useful functions for running in 32-bit protected mode since in this mode we can no longer rely on BIOS functions, for printing, etc.
[bits 32]


; Define some constants in nasm (nasm simply substitutes these with the values)
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; Prints a null-terminated string pointed to by ESI
print_string_pm:
    pusha
	mov edx, VIDEO_MEMORY ; Set edx to the start of the video memory

	print_string_pm_loop:
		mov al, [esi]			; Store the char at EBX in AL
		mov ah, WHITE_ON_BLACK	; Store the attributes in AH

		cmp al, 0		; if (al == 0), at end of string, so jump to done
		je print_string_pm_done

		mov [edx], ax	; Store char an attributes at current character cell

		add esi, 1	; Increment EBX to the next char in string.
		add edx, 2	; Move the next character cell in video memory

		jmp print_string_pm_loop ; Loop around to print the next char.

	print_string_pm_done:
		popa
		ret	; Return from the function


[bits 16]