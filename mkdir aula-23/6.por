/*
Questão 6 — Teste de Mesa:

Passo a Passo:
1. inicio() começa.
2. A variável 'n' (inteiro) é criada e recebe o valor 5.
3. A função 'dobro(n)' é chamada com o argumento x = 5.
4. Dentro de dobro(5): calcula x * 2 (5 * 2 = 10) e retorna 10.
5. Em inicio(): a expressão 'dobro(n) + 3' se torna '10 + 3', resultando em 13.
6. A variável 'r' (inteiro) é criada e recebe o valor 13.
7. O comando 'escreva' exibe a saída.

Saída final:
Resultado: 13
*/

programa
{
	funcao inteiro dobro(inteiro x)
	{
		retorne x * 2
	}

	funcao inicio()
	{
		inteiro n = 5
		inteiro r = dobro(n) + 3
		escreva("Resultado: ", r, "\n")
	}
}