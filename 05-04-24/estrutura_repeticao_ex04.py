def calcular_anos(populacao_A, taxa_crescimento_A, populacao_B, taxa_crescimento_B):
    anos = 0
    while populacao_A < populacao_B:
        populacao_A *= (1 + taxa_crescimento_A / 100)
        populacao_B *= (1 + taxa_crescimento_B / 100)
        anos += 1
    return anos

def main():
    populacao_A = 80000
    taxa_crescimento_A = 3
    populacao_B = 200000
    taxa_crescimento_B = 1.5

    anos = calcular_anos(populacao_A, taxa_crescimento_A, populacao_B, taxa_crescimento_B)

    print(f"Serão necessários {anos} anos para que a população do país A ultrapasse ou iguale a população do país B.")

main()
