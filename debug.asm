global _start

section .data
    string1: db "abcdef10p", 0

section .text

exit:
    mov rax, 60
    syscall

string_length:
    xor rax, rax
.loop:
    cmp BYTE [rdi+rax*1], 0x0
    je .end
    inc rax
    jmp .loop
.end:
    ret


print_string:
    xor rax, rax
.loop:
    cmp BYTE [rdi+rax*1], 0x0
    je .end
    lea rsi, [rdi+rax*1]
    push rdi
    push rax
    call print_char
    pop rax
    pop rdi
    inc rax
    jmp .loop
.end:
    ret

print_char:
    mov QWORD rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall
    ret

_start:
    nop
    nop
    mov rdi, string1
    ;call string_length
    ;mov rdi, rax
    call print_string
    call exit
