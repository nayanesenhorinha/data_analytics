# Quadrado mágico. Um quadrado mágico é aquele dividido em linhas e colunas, com um número em cada posição e no qual a soma das linhas, colunas e diagonais é a mesma. Por exemplo, veja um quadrado mágico de lado 3, com números de 1 a 9:
# Elabore uma função que identifica e mostra na tela todos os quadrados mágicos com as características acima. Dica: produza todas as combinações possíveis e verifique a soma quando completar cada quadrado. Usar um vetor de 1 a 9 parece ser mais simples que usar uma matriz 3x3.

import random

lista_numeros = [1,2,3,4,5,6,7,8,9]

def somar_linhas(matriz):
    soma = []
    linhas = definir_linhas(matriz)
    for i in range (len(linhas)):
        soma.append(sum(linhas[i])) 
    return soma 

def somar_colunas(matriz):
    soma = []
    linhas = definir_colunas(matriz)
    for i in range (len(linhas)):
        soma.append(sum(linhas[i])) 
    return soma 

def identificar_quadrado_magico(matriz):
    soma_linhas = somar_linhas(matriz)
    soma_colunas = somar_colunas(matriz)

    x,y,z = soma_linhas
    a,b,c = soma_colunas

    if (x == y == z) and (a == b == c):
        print(f"Esse é um quadrado mágico de {x}")
        imprimir_quadrado(matriz)
        return True

def definir_linhas(matriz):
    return [[matriz[0],matriz[1],matriz[2]],[matriz[3],matriz[4],matriz[5]],[matriz[6],matriz[7],matriz[8]]]

def definir_colunas(matriz):
    return [[matriz[0],matriz[3],matriz[6]],[matriz[1],matriz[4],matriz[7]],[matriz[2],matriz[5],matriz[8]]]

def imprimir_quadrado(matriz):
    quadradro_magico = f"\n\n{matriz[0],matriz[1],matriz[2]}\n{matriz[3],matriz[4],matriz[5]}\n{matriz[6],matriz[7],matriz[8]}"
    print(quadradro_magico)

def embaralhar_matriz(matriz):
    random.shuffle(matriz)
    return matriz

def main():
    cont = 0
    while True:
        nova_matriz = embaralhar_matriz(lista_numeros)
        identificar_quadrado_magico(nova_matriz)
        res = identificar_quadrado_magico(nova_matriz)
        cont += 1
        if res and cont <= 10:
            break


main()