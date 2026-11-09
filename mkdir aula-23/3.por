programa
{
	funcao real precoComTaxa(real valor)
	{
		retorne valor * 1.10
	}

	funcao inicio()
	{
		real valorConta = 50.0
		real valorFinal = precoComTaxa(valorConta)

		escreva("Valor com taxa (10%): R$ ", valorFinal, "\n")
	}
}