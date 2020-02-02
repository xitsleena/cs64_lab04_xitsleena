# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter the number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

	# TODO: Write your initializations here
    enter: .asciiz "Enter a number:\n"
    factorial: .asciiz "Factorial of "
    is: .asciiz " is:\n"
    endl: .asciiz "\n"
    
#Text Area (i.e. instructions)
.text
main:

	# TODO: Write your code here
    # t1 = n, t2 = fn 
    
    #print out enter number
    li $v0, 4
    la $a0, enter
    syscall

    # get input
    li $v0, 5
    syscall

    move $t1, $v0

    # set x = 2 for initial value
    
    addi $t1, $t1, 1

    li $t4, 2
    li $t2, 1
loop: 
    #t0 is comparison

    slt $t0, $t4, $t1
    beq $t0, $zero, result

    # multiply 
    mult $t2, $t4
    mflo $t2

    # increment x 
    addi $t4, $t4, 1

    #loop
    j loop

result:
    #print out factorial 
    li $v0, 4
    la $a0, factorial
    syscall 

    addi $t1, $t1, -1
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, is
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall 

    li $v0, 4
    la $a0, endl
    syscall

exit:
	li $v0, 10
    syscall
    # TODO: Write code to properly exit a SPIM simulation
