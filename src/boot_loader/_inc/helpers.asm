;
; Include all the functions
;

; 16 bit
%include 'src/boot_loader/_inc/io/print_string.asm'
%include 'src/boot_loader/_inc/io/print_hex.asm'
%include 'src/boot_loader/_inc/io/read_from_disk.asm'
%include 'src/boot_loader/_inc/misc/switch_to_pm.asm'       ; Switch into protected mode (32-bit) function
;%include 'src/boot_loader/_inc/misc/find_bios_string.asm'
