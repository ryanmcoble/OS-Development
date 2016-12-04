[org 0x7c00] ; This the memory address where boot_sectors are stored

; setup the stack out of the away of our code.
mov bp, 0xffff ; set the stack base (bottom)
mov sp, bp     ; set the stack top of the base (i.e an empty stack)


;
; Entrypoint
;

mov si, MSG_INTRO ; Print intro message
call print_string

mov si, MSG_REAL_MODE
call print_string

; Loading kernel
mov si, MSG_LOADING_KERNEL
call print_string

; Read the next 9 sectors (9 is the max without switching cylinders)
mov al, 9
mov bx, kernel_entry ; (aka 0x8112)
call read_from_disk


; Switch into protected mode
call switch_to_pm


jmp $ ; Hang




[bits 32]

; Here is where the CPU jumps after our function switches us into 32-bit protected mode.
BEGIN_PM:

  mov esi, MSG_PROT_MODE
  call print_string_pm

  mov esi, MSG_INTRO
  call print_string_pm

  ; jmp to loaded kernel code.
  jmp kernel_entry

  jmp $ ; Hang


[bits 16] ; Instruct nasm to output 16-bit opcodes

;
; Includes
;
%include "src/boot_loader/_inc/helpers.asm"
%include "src/boot_loader/_inc/helpers_32.asm"
%include "src/boot_loader/_inc/switch_to_pm.asm"

;
; Messages
;
MSG_INTRO          db "Welcome to RCOS", 0
MSG_REAL_MODE      db "Started in 16-bit Real Mode", 0
MSG_LOADING_KERNEL db "Loading kernel from disk to address 0x7e00", 0
MSG_PROT_MODE      db "Successfully switched into 32-bit Protected Mode", 0


; Pad out bootsector to 512 bytes with last 2 bytes as magic 'bootable' number.
times 510-($-$$) db 0
dw 0xaa55


kernel_entry:
  ; Kernel code will be loaded here.