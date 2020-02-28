.section .text

.globl printStr, readStr

getLen:
	mov	(%ecx,%esi,1),%al
	mov	$0, %dl
	addl	$1,%esi
	cmp	%al,%dl
	jne	getLen
	ret

printStr:
	movl	%edi, %ecx
	movl	$1,%esi
	call	getLen
	movl	$4, %eax
	movl	$1, %ebx
	movl	%esi, %edx
	int	$0x80
	ret

readStr:
	movl	%edi,%ecx
	movl	$1,%esi
	call	getLen
	movl	$3, %eax
	movl	$1, %ebx
	movl	%esi, %edx
	int	$0x80
	ret
