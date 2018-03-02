global _start

section .data
    string1: db "abcdef10p", 0
    char1: db "A"
    unint1: db "1239807"

section .text

exit:
    mov rax, 60
    syscall

string_length:
    xor rax, rax

    .loop:
    cmp byte [rdi+rax], 0
    je .end
    inc rax
    jmp .loop

    .end:
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_string:
    xor rax, rax
    push rdi
    call string_length
    pop rsi
    mov rdx, rax
    mov rdi, 1
    mov rax, 1
    syscall
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_char:
    push rdi
    mov rdi, rsp
    call print_string
    pop rdi
    ret

print_uint:
    mov rbp, rsp
    mov rax, rdi
    mov rdi, rsp
    push 0
    sub rsp, 16

    dec rdi
    mov r8, 10

.loop:
    xor rdx, rdx
    div r8
    or  dl, 0x30
    dec rdi
    mov [rdi], dl
    test rax, rax
    jnz .loop

    call print_string

    add rsp, 24
    ret

_start:
    nop
    nop
    mov rdi, 1239807
    call print_uint
    mov rdi, rax
    call exit
