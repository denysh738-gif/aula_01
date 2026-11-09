programa
{
	funcao real valorConta(real kwh)
	{
		retorne kwh * 0.95
	}

	funcao vazio mostrarFatura(cadeia mes, real kwh)
	{
		real valor = valorConta(kwh)
		escreva("Mês: ", mes, " | Consumo: ", kwh, " kWh | Valor: R$ ", valor, "\n")
	}

	funcao inicio()
	{
		mostrarFatura("Janeiro", 150.0)
		mostrarFatura("Fevereiro", 210.0)
		mostrarFatura("Março", 180.0)
	}
}

/*
Reflexão — Que outro trecho poderia virar módulo?
- Uma função para calcular impostos/bandeiras tarifárias (ex: ICMS ou adicional de bandeira vermelha) sobre o valor total do kWh.
- Uma função de cálculo de consumo médio mensal, recebendo os 3 valores de kWh e retornando a média consumida no trimestre.
*/