/* Funcao para conversao decimal -> binario
 */

 void itob(int i, int index)
 {
 	
 	while(i > 0)
 	{ 
 		buffer[index--] = (i & 1) + '0'; //bit menos significativo AND 1 dpois converte em char
 		i = (i >> 1); //passa pro prox bit
 	}
 }