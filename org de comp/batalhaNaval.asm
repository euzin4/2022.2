		.data
matriz_navios:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
tam:		.word	100

matriz_usuario:	.string	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
navios:		.string	"3\n1 5 1 1\n0 5 2 2\n0 1 6 4"
ql:		.string "\n"

		.text
main:
#	la 	a0, navios  			# imprime string com posiçao dos navios
#	li 	a7,4
#	ecall

	#insere imbarcações
	la 	a0, navios  			# a0 recebe o endereço inicial da string navios
	la	a1, matriz_navios 		# a1 recebe o endereço inicial da matriz navios
	jal	insere_embarcacoes		# chama funçao que insere os navios
	
	#imprime matriz
	jal	imprime_matriz			# imprime matriz

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
	
imprime_matriz:
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
