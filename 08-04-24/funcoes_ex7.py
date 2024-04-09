prestacoes = []

def relatorio_dia():
    print("Relatório:")
    soma = sum(prestacoes)
    total = len(prestacoes)
    print(f"Prestações pagas: {total} - Valor total pago: {soma:.2f}")

def valor_pagamento(valor_prestacao,dias_atraso):
    if dias_atraso == 0:
        return valor_prestacao
    else:
        valor_pagamento = valor_prestacao + (valor_prestacao * 0.03) + ((valor_prestacao * 0.001) * dias_atraso)
        return valor_pagamento

def exibir_valor(valor):
    print(f"O valor a ser pago é R${valor:.2f}")

def solicitar_valor():
    while True:
        valor_prestacao = int(input("Digite o valor da prestação: "))
        if valor_prestacao == 0:
            return False
        else:
            dias_atraso = int(input("Dias de atraso: "))
            valor = valor_pagamento(valor_prestacao,dias_atraso)
            exibir_valor(valor)
            prestacoes.append(valor)

def main():
    solicitar_valor()
    relatorio_dia()

main()