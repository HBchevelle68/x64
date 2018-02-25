section .text

exit:
    mov rax, 60
    syscall

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_char:
    mov QWORD rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall
    ret

print_newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, 0xa
    mov rdx, 1
    syscall
    ret


print_uint:
    xor rax, rax
    ret


print_int:
    xor rax, rax
    ret

string_equals:
    xor rax, rax
    ret


read_char:
    xor rax, rax
    ret

read_word:
    ret

; rdi points to a string
; returns rax: number, rdx : length
parse_uint:
    xor rax, rax
    ret

; rdi points to a string
; returns rax: number, rdx : length
parse_int:
    xor rax, rax
    ret


string_copy:
    push rdi
    push rsi
    push rdx
    call string_length
    pop rdx
    pop rsi
    pop rdi

    cmp rax, rdx
    jae .excess

    push rsi ;save address
    xor rax, rax

    .loop:
    mov dl, BYTE [rdi+rax*1]
    mov BYTE [rsi+rax*1], dl
    inc rax
    test dl, dl
    jnz .loop

    pop rax
    ret

    .excess:
    xor rax, rax
    ret
