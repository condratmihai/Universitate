#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

ifstream fin("date.in");
ofstream fout("date.out");

/*
vector <int> ceva;
ceva.push_back(12);
ceva.pop_back();
for(int i = 0; i < ceva.size(); i++) cout<<ceva[i]<<" ";
*/


int main()
{
    int i,j;

    int n,m;
    fin>>n>>m;

    int Adiacenta[n+1][n+1] = {{0}};
    vector <int> lista[n+1];    //b)

    int mi, mf;
    for(i = 1; i <= m; i++)
    {
        fin>>mi>>mf;

        Adiacenta[mi][mf] = Adiacenta[mf][mi] = 1;

        //b)
        lista[mi].push_back(mf);
        lista[mf].push_back(mi);
    }

    for(i = 1; i <= n; i++)
    {
        for(j = 1; j <= n; j++) fout<<Adiacenta[i][j]<<" ";
        fout<<endl;
    }

    fout<<endl<<endl<<endl;

    for(i = 1; i <= n; i++)
    {
        fout<<i<<": ";
        for(j = 0; j < lista[i].size(); j++)
        {
            fout<<lista[i][j]<<" ";
        }
        fout<<endl;
    }

    fout<<endl;
    //c)

    int Suma[n+1] = {0};

    for(i = 1; i <= n; i++)
    {
        for(j = 1; j <= n; j++)
        {
            if(Adiacenta[i][j] == 1) Suma[i]++;
        }
    }

    int suma_max = Suma[1];

    for(i = 2; i <= n; i++)
    {
        if(Suma[i] > suma_max) suma_max = Suma[i];
    }

    int k = 1;
    int comp_max[n+1];
    for(i = 1; i <= n; i++)
    {
        if(Suma[i] == suma_max)
        {
            comp_max[k] = i;
            k++;
        }
    }

    for(i = 1; i < k; i++)
    {
        fout<<comp_max[i]<<" ";
    }

 
/*    
    //ALTERNATIV PT. c)

    int grad[100] = {0};
    int maxim = 0;
    vector <int> comp;

    for(i = 1; i <= m; i++)
    {
        int x,y;

        fin>>x>>y;

        grad[x]++;
        grad[y]++;

        if(grad[x] == maxim)
        {
            comp.push_back(x);
        }

        if(grad[y] == maxim)
        {
            comp.push_back(y);
        }

        if(grad[x] > maxim)
        {
            comp.clear();
            comp.push_back(x);
            maxim = grad[x];
        }

        if(grad[y] > maxim)
        {
            comp.clear();
            comp.push_back(y);
            maxim = grad[y];
        }

    }

    for(i = 0; i < comp.size(); i++) cout<<comp[i]<<" ";
*/

    return 0;
}
