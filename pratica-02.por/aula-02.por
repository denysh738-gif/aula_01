programa
{
	inclua biblioteca Matematica --> mat

	funcao inicio()
	{
		// Declaração de variáveis
		real km_rodados, litros_consumidos, preco_litro
		real rendimento, custo_diesel, custo_por_km
		cadeia classificacao

		// Entrada de dados
		escreva("Informe os quilômetros rodados (km): ")
		leia(km_rodados)

		escreva("Informe os litros consumidos (l): ")
		leia(litros_consumidos)

		escreva("Informe o preço do litro do diesel (R$): ")
		leia(preco_litro)

		// Cálculos
		rendimento = km_rodados / litros_consumidos
		custo_diesel = litros_consumidos * preco_litro
		custo_por_km = custo_diesel / km_rodados

		// Regra de Classificação
		se (rendimento >= 0.8)
		{
			classificacao = "eficiente"
		}
		senao se (rendimento >= 0.6 e custo_por_km <= 9.00)
		{
			classificacao = "aceitável"
		}
		senao
		{
			classificacao = "revisar caminhão"
		}

		// Exibição dos resultados com arredondamento em 2 casas decimais
		escreva("\n--- RELATÓRIO DO TURNO ---\n")
		escreva("Rendimento: ", mat.arredondar(rendimento, 2), " km/l\n")
		escreva("Custo do diesel: R$ ", mat.arredondar(custo_diesel, 2), "\n")
		escreva("Custo por km: R$ ", mat.arredondar(custo_por_km, 2), "\n")
		escreva("Classificação: ", classificacao, "\n")
	}
}