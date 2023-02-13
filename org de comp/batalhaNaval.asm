		.data
matriz_navios:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
tam:		.word	100

matriz_usuario:	.string	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
navios:		.string	"3\n1 5 1 1\n0 5 2 2\n0 1 6 4"
ql:		.string "\n"
txt_menu:	.string	"1)reiniciar jogo\n2)imprimir matriz_navios\n"
txt_erro:	.string	"valor inválido\n\n"

		.text
main:
################## insere imbarcações
	la 	a0, navios  			# a0 recebe o endereço inicial da string navios
	la	a1, matriz_navios 		# a1 recebe o endereço inicial da matriz navios
	jal	insere_embarcacoes		# chama funçao que insere os navios
	
################## menu
menu:
	li a7,4
	la a0,txt_menu
	ecall		#imprime o menu
	li a7,5
	ecall		#le a seleçao do menu
	
	li t1,1
	li t2,2
	blt a0,t1,erro	#entrada<1 entao 'erro'
	bgt a0,t2,erro	#entrada>2 entao 'erro'
	
	#beq a0,t1,reiniciar
	beq a0,t2,imprime_matriz_navios
	
erro:
	li a7,4
	la a0,txt_erro
	ecall
	j menu
	
################## fim do programa
fim:	
	nop
	li   a7, 10
	ecall

####################################### insere_embarcacoes
insere_embarcacoes:
	
		

	ret
	
####################################### imprime_matriz
qbl:
	la a0,ql
	li a7,4
	ecall
	li t3,0		#zera o cont de ql
	li a7,1		#volta o a7 para printar int
	j voltaql
	
imprime_matriz_navios:
	la t0,matriz_navios
	li a7,1
	
	la t1,tam
	lw t1,0(t1)	#t1=100
	li t2,0		#t2=0 contador
	li t3,0		#t3=0 contador quebra de linha
	li t4,10	#t4=10
loop1:
	lw a0,0(t0)
	ecall
	addi t0,t0,4	#+4 endereço
	addi t2,t2,1	#+1 contador
	addi t3,t3,1	#+1 contador quebra de linha
	beq t3,t4,qbl	#se t3 == t4(10)
voltaql:
	blt t2,t1,loop1

	ret
