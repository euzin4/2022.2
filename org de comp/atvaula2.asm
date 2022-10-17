	.data
vet:	.word	3,8,2,1,6,9,5,4,7,13,22,11
tx1:	.string	"O menor valor esta na posição: "
tam:	.word	12

	.text
main:
	li a7,4
	la a0,tx1
	ecall		#"O menor valor esta na posição: "
	
	jal menorValor
	
	li a7,1
	mv a0,s1
	ecall
	
	li a7,10
	ecall		#fim do programa
	
menorValor:
	la a0,vet	#salva o endereço de vet em a0
	lw s0,0(a0)	#salva o primeiro valor do vet em s0
	la t0,tam
	lw a1,0(t0)	#salva o tam do vet em a1
	
	li a3,0		#contador
loop:
	beq a3,a1,rtn
	addi a0,a0,4
	lw a4,0(a0)	#salva o valor para teste em a4
	addi a3,a3,1	#somador
	blt a4,s0,menor
volta:		
	j loop	

rtn:
	ret
	
menor:
	mv s0,a4	#salva o valor menor em s0
	mv s1,a3	#salva o indice(contador) em s1
	j volta
