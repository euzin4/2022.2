			.data
matriz_navios:		.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
tam:			.word	100

matriz_usuario:		.string	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
navios:			.string	"3\n1 5 1 1\n0 5 2 2\n0 1 6 4"
ql:			.string "\n"
txt_menu:		.string	"1)reiniciar jogo\n2)imprimir matriz_navios\n"
txt_erro:		.string	"valor inválido\n\n"
indice_imprime:		.string "  0 1 2 3 4 5 6 7 8 9\n"
espaco:			.string " "

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
	
	addi t5,t5,1	#soma 1 no contador do indice de linha
	mv a0,t5
	li a7,1
	ecall
	la a0,espaco
	li a7,4
	ecall
	
	j voltaql
	
imprime_matriz_navios:
	la a0,indice_imprime
	li a7,4
	ecall		#imprime os indices de coluna
	
	la t0,matriz_navios
	li a7,1
	
	la t1,tam
	lw t1,0(t1)	#t1=100 tamanho da matriz
	li t2,0		#t2=0 contador
	li t3,0		#t3=0 contador quebra de linha
	li t4,10	#t4=10 limite para quebra de linha, limite indice de linha
	li t5,0		#t5=0 contador indice de linha
	
	mv a0,t5
	li a7,1
	ecall
	la a0,espaco
	li a7,4
	ecall
loop1:
	lw a0,0(t0)
	li a7,1
	ecall
	la a0,espaco
	li a7,4
	ecall
	addi t0,t0,4	#+4 endereço
	addi t2,t2,1	#+1 contador
	addi t3,t3,1	#+1 contador quebra de linha
	beq t3,t4,qbl	#se t3 == t4(10)
voltaql:
	blt t2,t1,loop1	#se contador<100

	ret
