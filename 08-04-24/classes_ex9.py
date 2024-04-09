class Ponto:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    def __str__ (self):
        return f'({self.x}, {self.y})'

class Retangulo:
    def __init__(self, ponto_inicial, largura, altura):
        self.ponto_inicial = ponto_inicial
        self.largura = largura
        self.altura = altura
    
    def centro(self):
        centro_x = self.largura / 2
        centro_y = self.altura / 2
        return Ponto(centro_x,centro_y)

def imprimir_ponto(ponto_inicial, retangulo):
    print(f"Ponto inicial: {ponto_inicial}")
    print(f"Centro: {retangulo}")

def main():
    while True:
        ponto_inicial = Ponto(0, 0)
        retangulo = Retangulo(ponto_inicial, 8, 3)
        print("1 - Imprimir valores do retângulo // 2 - Alterar valores do retângulo // 3 - Encerrar")
        opcao = int(input("Digite uma opção: "))
        if opcao == 1:
            imprimir_ponto(f"Ponto inicial: {ponto_inicial}")
            imprimir_ponto(f"Centro: {retangulo.centro()}")
        elif opcao == 2:
            x = int(input("Digite a posição X: "))
            y = int(input("Digite a posição Y: "))
            largura = int(input("Digite a largura: "))
            altura = int(input("Digite a altura: "))
            ponto_inicial = Ponto(x, y)
            retangulo = Retangulo(Ponto(x,y), largura, altura)
            imprimir_ponto(ponto_inicial, retangulo.centro())
        elif opcao == 3:
            break
        else:
            print("Opção inválida")
    
main()


