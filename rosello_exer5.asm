;ROSELLO, MA. JAZMINE P.
;2021-09665

global  _start
global  check

section .data
    SYS_EXIT equ 60
    input dq 0
    cnt db 0

section .text
_start:
    mov rdi, qword[input] ;mov the input to the first argument register
    mov rsi, 0; set rsi as 0

    call check ;call the function

    mov byte[cnt], sil;move the value of byte size ng rsi sa cnt
     
exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall


check:
    mov rdx, 0 ;every division set rdx as 0
    mov r10, 10 ;set r10 as 10
    mov rax, rdi ;mov value of rdi to rax
    div r10 ;divide rax by r10
    cmp rax, 0 ;check if rax is 10 kapag hindi pa punta kay return
    jne return
    inc rsi ;else increment lagn si rsi then ret na
    ret 

return:
    mov rdi, rax ;mov rax to rdi since kapag bumalik sa check momove rin si rdi kay rax
    inc rsi;increment rsi tapos jump to check na
    jmp check 
