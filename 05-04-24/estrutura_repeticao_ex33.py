def main():
    temperaturas = []
    while True:
        temperatura = input("Digite a temperatura (ou 'fim' para encerrar): ")
        if temperatura.lower() == 'fim':
            break
        try:
            temperatura = float(temperatura)
            temperaturas.append(temperatura)
        except ValueError:
            print("Por favor, digite um número válido.")

    if len(temperaturas) == 0:
        print("Nenhuma temperatura foi inserida.")
    else:
        menor_temperatura = min(temperaturas)
        maior_temperatura = max(temperaturas)
        media_temperaturas = sum(temperaturas) / len(temperaturas)

        print(f"Menor temperatura: {menor_temperatura}")
        print(f"Maior temperatura: {maior_temperatura}")
        print(f"Média das temperaturas: {media_temperaturas}"

main()
