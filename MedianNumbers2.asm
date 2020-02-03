# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

	enter: .asciiz "Enter the next number:\n"

	median: .asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:

    # enter first number
    li $v0, 4
    la $a0, enter
    syscall

    # get input
    li $v0, 5
    syscall

    move $t0, $v0

    # enter second number
    li $v0, 4
    la $a0, enter
    syscall

    # get input
    li $v0, 5
    syscall

    move $t1, $v0

    # enter third number
    li $v0, 4
    la $a0, enter
    syscall

    # get input
    li $v0, 5
    syscall

    move $t2, $v0

    # print median:
    li $v0, 4
    la $a0, median
    syscall


	blt $t0, $t1, firstCompare
	blt $t2, $t0, secondCompare

	li $v0, 1
	move $a0, $t0
	syscall
	b exit

firstCompare:
	blt $t0, $t2, secondCompare

	# $t0 is median
	li $v0, 1
	move $a0, $t0
	syscall
	b exit

secondCompare:
	blt $t1, $t2, middle

	# $t2 is median
	li $v0, 1
	move $a0, $t2
	syscall
	b exit

thirdCompare:
	blt $t2, $t1, middle

	li $v0, 1
	move $a0, $t2
	syscall
	b exit

middle:
	# $t1 is median
	li $v0, 1
	move $a0, $t1
	syscall
	b exit



exit:
    li $v0, 10
    syscall
