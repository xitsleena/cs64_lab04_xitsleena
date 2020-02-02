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

    #t0-2 contain the numbers
    #t3 contains median
firstvssecond:
    blt $t0, $t1, secondvsthird
    
    j firstvsthird

secondvsthird:
    blt $t1, $t2, msecond
    blt $t2, $t0, mfirst
    # 1 < 3 < 2
    li $v0, 1
    move $a0, $t2
    syscall


    j mthird

firstvsthird:
    blt $t0, $t2, mfirst
    blt $t2, $t1, msecond 
    # 2 < 3 < 1
    li $v0, 1
    move $a0, $t2
    syscall


    j mthird

mfirst:
    # print median
    li $v0, 4
    la $a0, median
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    j exit

msecond:
    # print median
    li $v0, 4
    la $a0, median
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    j exit

mthird:
    # print median
    li $v0, 4
    la $a0, median
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

exit:
    li $v0, 10
    syscall
