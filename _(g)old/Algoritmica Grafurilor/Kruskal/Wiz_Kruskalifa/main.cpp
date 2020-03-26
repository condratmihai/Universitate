#include <iostream>
#include <fstream>
#include <algorithm>
#include <vector>

using namespace std;

struct muchie
{
    int x, y, cost;
};

bool cmp (muchie m1, muchie m2)
{
    return m1.cost < m2.cost;
}

int tata[101];

int Group (int nod)
{
    if(nod != tata[nod]) tata[nod] = Group(tata[nod]);
    return tata[nod];
}

int Union (int x, int y)
{
    x = Group(x);
    y = Group(y);

    tata[x] = y;
}

int main()
{
    ifstream fin("date.in");
    vector <muchie> muchii;
    vector <muchie> arboreCostMinim;
    muchie edge;

    int n, m, i;
    fin>>n>>m;

    for(i = 0; i < m; i++)
    {
        int x, y, cost;
        fin>>x>>y>>cost;

        edge.x = x;
        edge.y = y;
        edge.cost = cost;

        muchii.push_back(edge);

    }

    sort(muchii.begin(), muchii.end(), cmp);

    for(i = 1; i <= n; i++) tata[i] = i;

    int costArbore = 0;

    i = 0;
    while(1)
    {
        edge = muchii[i];

        if(Group(edge.x) != Group(edge.y))
        {
            costArbore += edge.cost;

            Union(edge.x, edge.y);

            arboreCostMinim.push_back(edge);
        }

        i++;
        if(i == (int)muchii.size()) break;
    }

    cout<<costArbore<<" "<<(int)arboreCostMinim.size()<<endl<<endl;

    for(i = 0; i < (int)arboreCostMinim.size(); i++)
    {
        edge = arboreCostMinim[i];
        cout<<edge.x<<" "<<edge.y<<" "<<edge.cost<<endl;
    }

    return 0;
}
