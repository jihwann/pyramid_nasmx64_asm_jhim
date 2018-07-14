; Made by jhim
; If you want to print '*' then input (*argv) when you start this program. For example ./pyramid 5. but you cann't input even number. It allows only odd number.

section .data
        star db "*"
        empty db 0x0a ; 0x0a means changing line


section .text
        global _start
_start:
        mov rax, 1 
        mov rdi, 1 
        mov rdx, 1 
        mov r10, 0 ; index
        mov r9, [rsp+16] 
		mov r11, [r9]
		and r11, 1
; if you input '7' at the begining of the pragram as parameter (*argv) then your stack seems like (7 -> ret -> rsp) , so there is 7 in rsp+16

        cmp r11, 0 
        je _done 

        mov cl, [r9] 
        movzx r9, cl
        sub r9, 0x30

        mov r8, r9
        mov r9, 0
        syscall

_small:
        cmp r10, r9
        je _up
        mov rsi, star 
        syscall 
        mov rax, 1 
        inc r10
        jmp _small

_up:
        cmp r9, r8 
        je _done 
        mov rsi, empty 
        syscall 
        mov rax, 1 
        mov r10, 0
        add r9, 1
        jmp _small 

_done:
        mov rax, 60
        mov rdi, 0
        syscall

