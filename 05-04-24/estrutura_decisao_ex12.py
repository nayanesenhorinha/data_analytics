def calcular_salario_bruto(valor_hora, horas_trabalhadas):
    return valor_hora * horas_trabalhadas

def calcular_desconto_ir(salario_bruto):
    if salario_bruto <= 900:
        return 0
    elif salario_bruto <= 1500:
        return salario_bruto * 0.05
    elif salario_bruto <= 2500:
        return salario_bruto * 0.10
    else:
        return salario_bruto * 0.20

def main():
    valor_hora = float(input("Digite o valor da sua hora de trabalho: "))
    horas_trabalhadas = float(input("Digite a quantidade de horas trabalhadas no mês: "))

    salario_bruto = calcular_salario_bruto(valor_hora, horas_trabalhadas)
    desconto_ir = calcular_desconto_ir(salario_bruto)
    desconto_sindicato = salario_bruto * 0.03
    fgts = salario_bruto * 0.11
    salario_liquido = salario_bruto - desconto_ir - desconto_sindicato

    print("Folha de Pagamento:")
    print(f"Salário Bruto: R${salario_bruto:.2f}")
    print(f"(-) IR: R${desconto_ir:.2f}")
    print(f"(-) Sindicato: R${desconto_sindicato:.2f}")
    print(f"FGTS: R${fgts:.2f}")
    print(f"Total de descontos: R${desconto_ir + desconto_sindicato:.2f}")
    print(f"Salário Líquido: R${salario_liquido:.2f}")

if __name__ == "__main__":
    main()
