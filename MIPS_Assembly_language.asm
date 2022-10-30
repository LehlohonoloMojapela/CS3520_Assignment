.data
.text
.globl main
main:
	CheckPrime:
		if:
		# a0 == num
		beqz $a0,return
		beq $a0, 1,return
		
                div $t1,$a0,2   # divide num by two and store in $t1
		for: 
                li $t2, 2
                bgt $t2, $t1,return1

                div $t4, $a0, $t2  #divide by i
		if1:
                beqz $t4,return
		

		
return:
li $t0,0
li $v0,1 
syscall

return1:
li $t0, 1

	#SQUARE
	li $t2, 13
	li $t3, 0
	mul $t1, $t2, $t2 # square
	mflo $t4
	
# display the product
li $v0,1
add $t5, $t4, $t3
syscall


	jal reverse

	#End of program
	li $v0, 10
	syscall
reverse:
	li $s0, 12345	# $s0 = 12345
	li $t0, 0	# $t0 = 0
	li $t1, 10	# $t1 = 10
while:
	beqz $s0, exit	# if $s0 = 0, end loop
	div $s0, $t1	# divide $t1 by $s0
	mfhi $t2	# $t2 = remainder

	mul $t0, $t0, $t1	# $t0 = $t0 * 10
	add $t0, $t0, $t2	# $t0 = ($t0 * 10) + remainder
	
	div $s0, $s0, $t1	# $s0 = $s0/$t1

j while
jr $ra

exit: