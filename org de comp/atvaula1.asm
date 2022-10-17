	.data
str:	.string	"digite 5 valores: "
strmen:	.string	"menor valor: "
strmai:	.string	"maior valor: "
n:	.string	"\n"

	.text
main:
	la a0,str	
	li a7,4
	ecall		#"digite 5 valores: "
	
	li a1,0		#contador
	li a2,4		#condicional de fim de laco (quantidade de valores -1)
	
	li a7,5
	ecall		#le o primeiro valor
	add a3,zero,a0		#menor
	add a4,zero,a0		#maior
laco:
	beq a1,a2,sai
	li a7,5
	ecall
	
	blt a0,a3,menor
	bge a0,a4,maior
	
incrementa:
	addi a1,a1,1
	j laco
	
sai:	
	j fim
	
menor:
	mv a3,a0
	j incrementa
maior:
	mv a4,a0
	j incrementa
	
fim:	
	li a7,4
	la a0,strmen
	ecall		#"menor valor: "
	mv a0,a3
	li a7,1
	ecall		#o menor valor encontrado
	
	li a7,4
	la a0,n
	ecall		#\n
	
	li a7,4
	la a0,strmai
	ecall		#"maior valor: "
	mv a0,a4
	li a7,1
	ecall		#o maior valor encontrado
	
