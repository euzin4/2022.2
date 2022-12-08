		.data
tam:		.word		10
campo:		.string		"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

		.text
main: 
	jal imprime_campo

fim:	
	nop
	li   a7, 10
	ecall

imprime_campo:
	la s0,campo
	lw a1,tam
	
loop_imprime:
	lw a0,0(s0)
	li a7,11
	ecall
	
	ret
