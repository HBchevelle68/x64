global _start

section .data
    string1: db "abcdef10p", 0
    char1: db "A"

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

_start:
    nop
    nop
    mov rdi, char1
    call print_char
    mov rdi, rax
    call exit
