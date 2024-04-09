def calcular_media(nota1, nota2):
    return (nota1 + nota2) / 2

def atribuir_conceito(media):
    if 9.0 <= media <= 10.0:
        return 'A'
    elif 7.5 <= media < 9.0:
        return 'B'
    elif 6.0 <= media < 7.5:
        return 'C'
    elif 4.0 <= media < 6.0:
        return 'D'
    else:
        return 'E'

def main():
    nota1 = float(input("Digite a primeira nota: "))
    nota2 = float(input("Digite a segunda nota: "))

    media = calcular_media(nota1, nota2)
    conceito = atribuir_conceito(media)

    print("Notas: {:.1f} e {:.1f}".format(nota1, nota2))
    print("Média: {:.1f}".format(media))
    print("Conceito: {}".format(conceito))

    if conceito in ['A', 'B', 'C']:
        print("APROVADO")
    else:
        print("REPROVADO")

main()
