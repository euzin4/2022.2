		.data
matriz:		.word	4,2,6,7,1,9,3,5,8
tam:		.word 	3
txt_menu:	.string	"1-ler os valores da matriz\n2-imprimir matriz\n3-maior valor da matriz\n4-ordenar a matriz\n5-determinante da matriz\n"
txt_erro:	.string	"valor inválido\n\n"
queb:		.string "\n"
esp:		.string " "
det:		.string "O determinante da matriz é: "
impsv:		.string "Impossivel calcular o determinante!"
		
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
	
#--------------------------------------IMPRIMIR MATRIZ
imp_mat:
	la t1, matriz
	mv s1, zero
	lw s0, tam
	li s2, 0
imprimir:
	lw a0, 0(t1)
	li a7, 1
	ecall
	la a0, esp
	li a7, 4
	ecall
	addi t1, t1, 4
	addi s1, s1, 1
	beq s0, s1, loop_print
	j imprimir
loop_print:
	la a0, queb
	li a7, 4
	ecall
	mv s1, zero
	addi s2, s2, 1
	beq s2, s0, menu
	j imprimir
	
maior_val:
	#encontra o maior valor da matriz e imprime o valor a linha e a coluna em que ele esta
	
#--------------------------------------ORDENAR MATRIZ
ordenar:
	la t1, matriz
inicializa_bubble_sort:
	mv s1, zero #reseta o reg s1 para o bubble sort
	lw s0, tam #Tamanho da linha ou coluna da matriz (matriz quadrada sempre)
	mul t5, s0, s0 #Guarda o total de numeros existentes na matriz, matriz 3x3 = 9 numeros, para o loop do bubble sort
	j ordenar_mat
	
ordenar_mat:
	#Algoritmo utilizado: Bubble Sort
	addi s1, s1, 1 #loop
	bge s1, t5, loop_ord #Verifica se chegou ao final de cada iteracao do loop
	lw t2, 0(t1) #Carrega os valores a serem verificados
	lw t3, 4(t1)
	bgt t2, t3, swap #Se o anterior for maior, troca
	addi t1, t1, 4 #Passa para o proximo valor
	j ordenar_mat
swap:
	sw t3, 0(t1) #Troca os valores
	sw t2, 4(t1)
	addi t1, t1, 4 #Passa para o proximo valor
	j ordenar_mat #Retorna ao loop
	
loop_ord:
	mv s1, zero #Reseta o reg s1 para reiniciar o loop
	addi t5, t5, -1 #A cada iteracao do loop um elemento da matriz ao final estara ordenado, entao o proximo loop deve ficar menor 1 posicao
	la t1, matriz #Ao final de cada iteracao, recarrega o endereco do primeiro elemento da matriz em t1
	beq t5, zero, menu #Se t5 for igual a zero, isso significa que a ordenacao foi finalizada.
	j ordenar_mat #Se t5 nao for igual a zero, a ordenacao continua
	
#--------------------------------------CALCULA DETERMINANTE
determ:
	la t1, matriz #recarrega o endereço da mat
	lw a1, tam
	
	li t2, 2 #para verificar o tamanho da mat
	li t3, 3 #para verificar o tamanho da mat
	mv s1, zero #reseta o reg s1
	beq a1, t3, det_3x3 #Pula para o rotulo que calcula o det da mat se for 3x3
	bne a1, t2, imp_calc #Se a mat nao for 2x2 e nem 3x3, nao calcula
	
	#Cacula o det da mat 2x2
	lw t4, 0(t1)
	lw t5, 12(t1)
	mul s1, t4, t5
	lw t4, 4(t1)
	lw t5, 8(t1)
	mul t4, t4, t5
	sub s1, s1, t4
	
	#Imprime o resultado
	la a0, det
	li a7, 4
	ecall
	mv a0, s1
	li a7, 1
	ecall
	la a0, queb
	li a7, 4
	ecall
	j menu
	
det_3x3:
	# + (x[0][0] * x[1][1] * x[2][2])
	lw t4, 0(t1)
	lw t5, 16(t1)
	mul t4, t4, t5
	lw t5, 32(t1)
	mul t4, t4, t5
	add s1, s1, t4
	
	# + (x[0][1] * x[1][2] * x[0][2])
	lw t4, 4(t1)
	lw t5, 20(t1)
	mul t4, t4, t5
	lw t5, 24(t1)
	mul t4, t4, t5
	add s1, s1, t4
	
	# + (x[0][2] * x[0][1] * x[2][1])
	lw t4, 8(t1)
	lw t5, 12(t1)
	mul t4, t4, t5
	lw t5, 28(t1)
	mul t4, t4, t5
	add s1, s1, t4
	
	# - (x[0][2] * x[1][1] * x[2][0])
	lw t4, 8(t1)
	lw t5, 16(t1)
	mul t4, t4, t5
	lw t5, 24(t1)
	mul t4, t4, t5
	sub s1, s1, t4
	
	# - (x[0][0] * x[0][2] * x[2][1])
	lw t4, 0(t1)
	lw t5, 20(t1)
	mul t4, t4, t5
	lw t5, 28(t1)
	mul t4, t4, t5
	sub s1, s1, t4
	
	# - (x[0][1] * x[1][0] * x[2][2])
	lw t4, 4(t1)
	lw t5, 12(t1)
	mul t4, t4, t5
	lw t5, 32(t1)
	mul t4, t4, t5
	sub s1, s1, t4
	
	#Imprime o resultado
	la a0, det
	li a7, 4
	ecall
	mv a0, s1
	li a7, 1
	ecall
	la a0, queb
	li a7, 4
	ecall
	j menu

imp_calc:
	#Printa a msg de impossivel calcular
	la a0, impsv
	li a7, 4
	ecall
	la a0, queb
	ecall
	j menu
