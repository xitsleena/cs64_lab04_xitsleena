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

    #t0-2 contain the numbers
    #t3 contains median
    # a , b , c
firstoversecond:
    blt $t0, $t1, secondoverfirst 
    blt $t2, $t1, msecond
    blt $t2, $t0, mthird
    j mfirst

secondoverfirst:
    blt $t2, $t0, mfirst
    blt $t2, $t1, mthird
    j msecond

mfirst:
    li $v0, 1
    move $a0, $t0
    syscall

    j exit

msecond:
    li $v0, 1
    move $a0, $t1
    syscall

    j exit

mthird:
    li $v0, 1
    move $a0, $t2
    syscall

    j exit 
exit:
    li $v0, 10
    syscall
