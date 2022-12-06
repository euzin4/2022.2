texto = open("entradaLog.txt")	#abre o arquivo para leitura 'r'
arq = texto.readlines()			#arq vira um vetor com uma linha em cada posição
'''for linha in arq:			#for percorre todas as posições do vetor
	#linha=linha.rstrip('\n')	#retira o caractere '\n' da variavel que será printada
	print(linha)			#printa a linha percorrida atual
print("----\n"+arq[0])			#printa através da posição do vetor'''

import psycopg2
conn = psycopg2.connect (	#cria conexao com o BD
	dbname = "teste",
	user = "postgres",
	password = "postgres",
	host = "localhost",
	port = "5432")
cur = conn.cursor()			#conecta ao BD

cur.execute('SELECT * FROM tredo')
data = cur.fetchall()
for linha in data:		#lê os dados da tabela no BD
	print('id:', linha[0],end=" ")		#o end substitui o ultimo caracter '/n' pelo que for colocado entre as aspas, aqui serve para imprimir tudo na mesma linha
	print('A:', linha[1],end=" ")
	print('B:', linha[2])
	print('-----------------------')
