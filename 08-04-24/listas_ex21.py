carros = ["Carro 1","Carro 2","Carro 3"]
consumo = [23,12,13]
valor_gasolina = 2.25

def exibir_lista_carros():
    for i in range (len(carros)):
        print(f"Veículo {i}")
        print(carros[i])
        print(consumo[i])

def calcular_consumo(consumo):
    return  1000 / int(consumo)

def calcular_gasolina(consumo):
    valor_gasolina_litro = consumo * valor_gasolina
    return valor_gasolina_litro

def exibir_relatorio_final():
    print("\nRelatório Final")
    for i in range (len(carros)):
        consumo_km = calcular_consumo(consumo[i])
        custo_conbustivel = calcular_gasolina(consumo_km)
        print(f"{1} - {carros[i]} - {consumo[i]} - {consumo_km:.1f} - {custo_conbustivel:.2f}")

def menor_consumo():
    menor = min(consumo)
    for i in range (len(consumo)):
        if menor == consumo[i]:
            print(f'O carro com menor consumo é o {carros[i]}')

def main():
    exibir_lista_carros()
    exibir_relatorio_final()
    menor_consumo()

main()