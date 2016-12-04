;
; Search memory for BIOS string
;
find_bios_string:
    mov bx, 0  ; bx -> 0
    mov es, bx ; es -> bx
    _search_loop:
        mov al, [es:bx]
        cmp al, 'B'
        jne _continue_search_loop

        mov al, [es:bx + 1]
        cmp al, 'I'
        jne _continue_search_loop

        mov al, [es:bx + 2]
        cmp al, 'O'
        jne _continue_search_loop

        mov al, [es:bx + 3]
        cmp al, 'S'
        jne _continue_search_loop

        mov dx, es
        call print_hex
        mov dx, bx
        call print_hex
        jmp _end_search_loop

        _continue_search_loop:
            inc bx
            cmp bx, 0
            je _inc_segment
            jmp _search_loop

        _inc_segment:
            mov cx, es
            add cx, 0x1000
            mov es, cx
            jmp _search_loop

    _end_search_loop:
    ret