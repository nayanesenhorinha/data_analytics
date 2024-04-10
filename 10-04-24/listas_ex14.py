import random

matriz = [8,3,4,1,5,9,6,7,2]
copias = []
linhas = [[matriz[0],matriz[1],matriz[2]],[matriz[3],matriz[4],matriz[5]],[matriz[6],matriz[7],matriz[8]]]
colunas = [[matriz[0],matriz[3],matriz[6]],[matriz[1],matriz[4],matriz[7]],[matriz[2],matriz[5],matriz[8]]]

somar_linhas = []
somar_colunas = []

def imprimir_quadrado(matriz):
    quadradro_magico = f"\n\n{matriz[0],matriz[1],matriz[2]}\n{matriz[3],matriz[4],matriz[5]}\n{matriz[6],matriz[7],matriz[8]}"
    print(quadradro_magico)

def embaralhar_matriz(matriz):
    random.shuffle(matriz)
    if matriz not in copias:
        copias.append(matriz)

def soma_das_linhas():
    somar_linhas = []
    soma1 = 0
    for i in range(len(linhas)):
        for j in range(len(linhas[i])):
            soma1 = sum(linhas[j])
            somar_linhas.append(soma1)
    return somar_linhas

def soma_das_colunas():
    somar_colunas = []
    soma2 = 0
    for i in range(len(colunas)):
        for j in range(len(colunas[i])):
            soma2 = sum(colunas[j])
            somar_colunas.append(soma2)
    return somar_colunas
         
def identificar_quadrado_magico(matriz):
    
    embaralhar_matriz(matriz)
    imprimir_quadrado(matriz)
    x = soma_das_colunas()
    y = soma_das_linhas()
    imprimir_quadrado(matriz)

    print(x)
    print(y)
    


def main():
    for _ in range(2):

        identificar_quadrado_magico(matriz)

main()