		.data
matriz:		.word	4,5,6,7,8,9,3,2,1
txt_menu:	.string	"1-ler os valores da matriz\n2-imprimir matriz\n3-maior valor da matriz\n4-ordenar a matriz\n5-determinante da matriz\n"
txt_erro:		.string	"valor inválido\n\n"
		.text
main:
menu:
	li a7,4
	la a0,txt_menu
	ecall		#imprime o menu
	li a7,5
	ecall		#le a seleçao do menu
	
	li t1,1
	li t2,2
	li t3,3
	li t4,4
	li,t5,5
	li t6,6
	blt a0,t1,erro	#entrada<1 entao 'erro'
	bgt a0,t6,erro	#entrada>=6 entao 'erro'
	
	beq a0,t1,ler_val
	beq a0,t2,imp_mat
	beq a0,t3,maior_val
	beq a0,t4,ordenar
	beq a0,t5,determ
	
erro:
	li a7,4
	la a0,txt_erro
	ecall
	j menu
	
ler_val:
	#insere valores na matriz
imp_mat:
	#printa a matriz
maior_val:
	#encontra o maior valor da matriz e imprime o valor a linha e a coluna em que ele esta
ordenar:
	#ordena a matriz do menor ao maior valor
determ:
	#encontra o determinante da matriz
