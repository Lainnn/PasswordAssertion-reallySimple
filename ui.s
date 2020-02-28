.section .data
hello: .string "Salutations!\n"
prompt1: .string "Please type in your username:\n"
prompt2: .string "Please type in your password:\n"
username: .string "Allison\n"
password: .string "Basecase\n"
feedback: .string "THIS IS AMAZING OMG\n"
usernameHolder: .string "1234567\0"
passwordHolder: .string "12345678\0"

.section .text
.globl _start

_start:

	movl	$hello, %edi
	call	printStr
	movl	$prompt1, %edi
	call	printStr
	movl	$usernameHolder, %edi
	call	readStr
	movl	$prompt2, %edi
	call	printStr
	movl	$passwordHolder, %edi
	call	readStr
	movl	$username, %edx
	movl	$usernameHolder, %edi
	call	check
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
	
check:
	movl	$1,%esi
	call	keepCompare
	movl	$passwordHolder, %edi
	movl	$password,%edx
	call	checkPwd
	ret

checkPwd:
	movl	$1,%esi
	call	keepCompare
	call	congrat
	ret

congrat:
	mov	$feedback, %edi
	call	printStr
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80

keepCompare:
	mov	(%edx,%esi,1),%cl
	mov	(%edi,%esi,1),%al
	cmp	%al, %cl
	jne	tooBad
	addl	$1, %esi
	mov	$0, %bl
	cmp	%al,%bl
	jne	keepCompare
	ret


tooBad:
	movl	$1,%eax
	movl	$0,%ebx
	int	$0x80
