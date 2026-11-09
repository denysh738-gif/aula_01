/*
Questão 1 — Resposta:

a) O programa imprime:
   Triplo de 4: 12.0

b) 
   - A função é 'triplo': identificada pelo tipo de retorno 'real' e pela presença do comando 'retorne'.
   - O procedimento é 'mostrar': identificado pelo tipo de retorno 'vazio' e por executar a ação de exibir na tela sem utilizar 'retorne'.
*/

programa
{
	funcao real triplo(real x)
	{
		retorne x * 3.0
	}

	funcao vazio mostrar(cadeia rotulo, real valor)
	{
		escreva(rotulo, ": ", valor, "\n")
	}

	funcao inicio()
	{
		mostrar("Triplo de 4", triplo(4.0))
	}
}