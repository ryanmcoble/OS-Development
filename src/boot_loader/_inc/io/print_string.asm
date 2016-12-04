;
; Print string value to screen
;
print_string:
    ; Note lodsb modifies ax register, to preserve original value on the stack.
    push ax
    push si
    _print_loop:
        lodsb
        cmp al, 0
        je _print_end
        mov ah, 0x0e ; BIOS scrolling teletype function
        int 0x10
        jmp _print_loop
    _print_end:
        pop si
        pop ax
        ret