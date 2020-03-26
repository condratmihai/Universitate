#include <stdio.h>
#include <stdlib.h>

struct STACKSMASHING
{
    char USER[100];
    char PID[100];
    //char PPID[100];
    char CPU[100];
    char MEM[100];
    char VSZ[100];
    char RSS[100];
    char TTY[100];
    char STAT[100];
    char START[100];
    char TIME[100];
    char COMMAND[100];
}josh;

void MAREASPARGERE()
{

    FILE * File;
    File = fopen ("test.txt" , "r");

    char mystring [100];
    char* pch;

    if (File == NULL) perror ("Error opening file");
    else
    {
        fgets (mystring , 100 , File);

        pch = strtok (mystring," \n");
        strcpy(josh.USER,pch);
        printf("%s\n",josh.USER);

        pch = strtok (NULL," ");
        strcpy(josh.PID,pch);
        printf("%s\n",josh.PID);

        pch = strtok (NULL," ");
        strcpy(josh.CPU,pch);
        printf("%s\n",josh.CPU);

        pch = strtok (NULL," ");
        strcpy(josh.MEM,pch);
        printf("%s\n",josh.MEM);

        pch = strtok (NULL," ");
        strcpy(josh.VSZ,pch);
        printf("%s\n",josh.VSZ);

        pch = strtok (NULL," ");
        strcpy(josh.RSS,pch);
        printf("%s\n",josh.RSS);

        pch = strtok (NULL," ");
        strcpy(josh.TTY,pch);
        printf("%s\n",josh.TTY);

        pch = strtok (NULL," ");
        strcpy(josh.STAT,pch);
        printf("%s\n",josh.STAT);

        pch = strtok (NULL," ");
        strcpy(josh.START,pch);
        printf("%s\n",josh.START);

        pch = strtok (NULL," ");
        strcpy(josh.TIME,pch);
        printf("%s\n",josh.TIME);

        pch = strtok (NULL,"\n");
        strcpy(josh.COMMAND,pch);
        printf("%s\n",josh.COMMAND);
     }

     fclose (File);
}


int main(void)
{
    MAREASPARGERE();

    return 0;
}
