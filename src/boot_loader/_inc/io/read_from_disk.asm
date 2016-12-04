;
; Read from disk
;
read_from_disk:
    pusha

    mov ah, 0x02 ; BIOS read sectors from drive function
  
    mov al, 1    ; Number of sectors to read
    mov ch, 0    ; Select first cylinder/track
    mov dh, 0    ; Select first read/write head
    mov cl, 2    ; Select second sector

    push bx
    mov bx, 0
    mov es, bx   ; es -> 0
    pop bx
    ;mov bx, 0x7c00 + 512 ; Immediately after my boot sector
    int 0x13

    jc print_read_error ; Jump to error message if carry flag is set (by BIOS)
    popa
    ret

    ; Print the disk read error
    print_read_error:
        mov si, MSG_DISK_READ_ERROR
        call print_string
        jmp $