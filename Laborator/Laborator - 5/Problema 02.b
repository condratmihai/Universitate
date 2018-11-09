#include <stdio.h>
#include <stdlib.h>

//Folosesc un char* pentru a partitiona spatiul ocupat de un short int.

int main()
{
    char aux;
    short int nr;
    scanf("%d", &nr);

    char *p = NULL;
    p = &nr;

    aux = *p;
    *p = *(p+1);
    *(p+1) = aux;

    printf("%d", nr);

    return 0;
}
