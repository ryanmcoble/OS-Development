; Read sector from disk
read_from_disk:
  mov ah, 0x02 ; Read sectors from drive
  
  mov al, 1    ; Number of sectors to read
  mov ch, 0    ; Select first cylinder/track
  mov dh, 0    ; Select first read/write head
  mov cl, 2    ; Select second sector

  mov bx, 0
  mov es, bx   ; es -> 0
  mov bx, 0x7c00 + 512 ; Immediately after my boot sector

  int 0x13

  jc print_read_error ; Jump to error message if carry glaf is set (by BIOS)

  ret


; Print the disk read error
print_read_error:
  mov si, DISK_READ_ERROR
  call print_string
  jmp $


DISK_READ_ERROR: 
  db 'Error reading from disk!', 0