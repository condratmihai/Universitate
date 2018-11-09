#include <iostream>
#include <string.h>
#define btoa(x) ((x)?"true":"false") //Pentru afisarea valorii de adevar ca un bool.
using namespace std;

//d) Nota minima in examen.
const int dacanumaieiestimort = 5;

//a) Declarare structura.
struct participant
{
    unsigned int nr_legitimatie;
    float nota_examen;
    float nota_bac;
    float medie;
    char nume[100];
    bool admis;
};

int main()
{
    int i = 0;
    int nr_participanti;
    char prov[2];


    //b) Citirea datelor despre participanti + prelucrare.
    //Presupunem ca sunt 101 participanti. Pentru eficienta, ar trebui folosita o lista.
    participant c[101];
    while(scanf("%d", &c[i].nr_legitimatie) == 1) //Citeste datele participantilor pana primeste un nr_legitimatie invalid (un string).
    {
        //La citirea numelui:
        fgets(prov, 2, stdin);                  //Scapa de "Enter-ul" precedent.
        fgets(c[i].nume, 100, stdin);           //Citeste numele propriu-zis.
        c[i].nume[strlen(c[i].nume)-1] = '\0';  //Scapa de "Enter-ul" final.

        scanf("%f %f",
              &c[i].nota_examen,
              &c[i].nota_bac
              );

        //c) Calculeaza media & e) Verifica daca este admis.
        c[i].medie = (4*c[i].nota_examen + c[i].nota_bac)/5;

        if(c[i].medie >= dacanumaieiestimort) c[i].admis = true;
        else c[i].admis = false;

        i++;
    }
    nr_participanti = i;

//CHECK! CHECK!
    for(i = 0; i < nr_participanti; i++){
        printf("\n\n%d\n%s\n%f\n%f\n%f\n%s",
               c[i].nr_legitimatie,
               c[i].nume,
               c[i].nota_examen,
               c[i].nota_bac,
               c[i].medie,
               btoa(c[i].admis));
    }

    return 0;
}

