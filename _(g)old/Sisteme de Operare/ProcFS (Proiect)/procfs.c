#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

struct ARBOREPID{
   int PID;
   int FII[250];
   int nrfii;
};

int noLines;
struct ARBOREPID P_STRUCT[500];

void createFile(char* name, char* command)
{
    FILE *in;
    FILE *out = fopen(name, "w+");

    extern FILE *popen();
    char buff[512];

    if (!(in = popen(command, "r"))) //popen creates a pipe so we can read the output of the program we are invoking
        exit(1);

    while (fgets(buff, sizeof(buff), in) != NULL ) //read the output of netstat, one line at a time
        fprintf(out, "%s", buff); //printf("%s", buff);

    pclose(in); // close the pipe 
    fclose(out);
}

void createStats (pid_t pid, char poz[])
{
    //chdir(poz);

    char name[16];
    sprintf(name, "%d", pid);
    mkdir(name, 0777);

    char location[8] = "";
    sprintf(location, "%d", pid);
    //chdir(location);

    char command[64] = "ps -p ";
    strcat(command, name);
    strcat(command, " -o pid,ppid,fgroup,ni,lstart,etime,cmd");
    createFile("stats.data", command);
    //printf("%s", command);
    //chdir("/home/condratmihai/Documents/ProcFS");
    //;
}

int countLines(char* name)
{
    FILE *fd = fopen(name, "r");
    
    int lines = 0;

    while(!feof(fd))
    {
        char ch = fgetc(fd);
        if(ch == '\n')
            lines++;
    }

    fclose(fd);

    return lines;
}

void printTree()
{
    for (int i = 0; i < noLines; i++)
  {
    printf("Nodul %d are urmatorii fii: %d(nr) \n", P_STRUCT[i].PID, P_STRUCT[i].nrfii);

      for(int j=0; j<P_STRUCT[i].nrfii; j++)
       printf("%d ", P_STRUCT[i].FII[j]);
   printf("\n");
  }
}

int count = 0;

void procFS(struct ARBOREPID pfs, char pozPrezent[])
{
    char name[16];
    char name2[10000];
    strcpy(name2, pozPrezent);
    sprintf(name, "%d", pfs.PID);

    strcat(name2, "/");
    strcat(name2, name);
    //mkdir(name, 0777);
    createStats(pfs.PID, name2);
    //mkdir(name, 0777);

    //chdir(name2);
    printf("%s\n", name2);
    chdir(name2);

    //createStats(pfs.PID, name2);
    char command[64] = "ps -p ";
    strcat(command, name);
    strcat(command, " -o pid,ppid,fgroup,ni,lstart,etime,cmd");
    createFile("stats.data", command);

    
    //printf("%d %d\n", pfs.PID, pfs.FII[0]);

    for(int i = 0; i < pfs.nrfii; i++)
    {
        
        for(int j = 0; j < noLines; j++)
        {
            if(P_STRUCT[j].PID == pfs.FII[i])
            {   
                //printf("!!! %d %d \n",P_STRUCT[j].PID, pfs.FII[i]);
                     
                procFS(P_STRUCT[j], name2);

                //printf("%d\n", count);
                //count++;
            }
        }

        
    }
}
char name[10000] = "";
int main(int argc , char *argv[])
{
    createFile("procs.data", "ps aux"); //general data file in root

    createFile("PIDs.data", "ps xao pid,ppid"); //list of PIDs, used to generate the "process tree"

    FILE *fd = fopen("PIDs.data", "r");
    noLines = countLines("PIDs.data");
    char ch;
    
    do
    {
        ch = fgetc(fd);
    }while(ch != '\n');
    
    int a[noLines][2]; //a - vector of pairs
    for(int i = 0; i < noLines - 1; i++)
    {
        fscanf(fd, "%d %d", &a[i][0], &a[i][1]);
        //printf("%d %d\n", a[i][0], a[i][1]);   
    }

    //struct ARBOREPID P_STRUCT[noLines];
    int Parent;
    int k=0;
    
    //Bag in struct ARBOREPID PIDurile
    for(int i = 0; i < noLines; i++)
      {
          P_STRUCT[i].PID = a[i][0];
          P_STRUCT[i].nrfii = 0;
      }

    //Pentru fiecare PPID
    for(int i=0; i<noLines; i++)
       {

        //Selectez PPID
        Parent=a[i][1];

          k=0;

         //Ciclez PIDURILE
        for(int j = 0; j < noLines; j++)
            if(a[j][1]==Parent) //Daca este parintele lui a[j][1] (PID-fiu)

              for(int l=0; l<noLines; l++) // il caut pe a[j][2](PPID-TATAL) in struct;

            if(P_STRUCT[l].PID==a[j][1])
            {
                P_STRUCT[l].FII[k]=a[j][0];   //Ii adaug FIUL
                k++;   //Iterez vectorul de fii
                P_STRUCT[l].nrfii=k; //Schimb numarul total de fii;
                //printf("LA PIDUL %d, avem acum %d fii \n", P_STRUCT[l].PID, P_STRUCT[l].nrfii);
                       ///+Realoc memorie pt el
            }
       }

    //printTree();

    

    for(int m = 0; m < noLines - 1; m++)
    {
        //printf("---------- FII LUI %d ----------\n", P_STRUCT[m].PID);
        strcpy(name, "/home/condratmihai/Documents/ProcFS");
        procFS(P_STRUCT[m], name);
        strcpy(name, "");
    }
        
    return 0;
    
}
