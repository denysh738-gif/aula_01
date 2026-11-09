programa
{
	funcao real calcularTotalComTaxa(real valorMesa)
	{
		retorne valorMesa * 1.10
	}

	funcao vazio exibirMesa(cadeia nomeMesa, real valorMesa)
	{
		real total = calcularTotalComTaxa(valorMesa)
		escreva(nomeMesa, " - total com taxa: R$ ", total, "\n")
	}

	funcao inicio()
	{
		exibirMesa("Mesa 1", 40.0)
		exibirMesa("Mesa 2", 70.0)
	}
}