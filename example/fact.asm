push_ax
push_bx
push_cx
call 1$
out

halt

0:
push_deep 1
push 0
jbe 2$
push_deep 1
push_deep 2
push 1
sub
call 0$
mul
drop 1
ret
2:
push 1
drop 1
ret

1:
push_deep 3
call 0$
drop 3
ret
