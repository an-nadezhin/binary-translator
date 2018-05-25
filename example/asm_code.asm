push_ax
push_bx
push_cx
call 0$
out
halt

0:
push 0
push 1
pop_deep 2
push 1
push_deep 5
div
pop_deep 1
1:
push_deep 4
push 0
jbe 2$
push_deep 2
push_deep 3
push_deep 3
mul
add
pop_deep 2
push_deep 4
push 1
sub
pop_deep 4
jmp 1$
2:
push_deep 2
out
push_deep 2
drop 4
ret
