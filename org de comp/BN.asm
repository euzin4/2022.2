		.data
navios:		.string	"3\n1 5 1 1\n0 5 2 2\n0 1 6 4"
matriz_navios:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
matriz_usuario:	.string	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

		.text
main:
	la 	a0, navios  			# imprime string com posiçao dos navios
	li 	a7,4
	ecall

	#insere imbarcações
	la 	a0, navios  			# a0 recebe o endereço inicial da string navios
	la	a1, matriz_navios 		# a1 recebe o endereço inicial da matriz navios
	jal	insere_embarcacoes		# chama funçao que insere os navios
	
	#imprime matriz
	la 	a0, matriz_usuario  		# a0 recebe o endereço inicial da 'matriz_usuario'
	jal	imprime_matriz			# imprime matriz depois de posicionar os navios

fim:	
	nop
	li   a7, 10
	ecall

####################################### insere_embarcacoes
insere_embarcacoes:

		

	ret
	
####################################### imprime_matriz
imprime_matriz:



	ret
