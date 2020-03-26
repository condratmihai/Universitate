#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

typedef struct
{
    int x, y, cost;
}
muchie;

bool cmp (muchie m1, muchie m2)
{
    return m1.cost < m2.cost;
}

int main()
{
    ifstream fin("date.in");

    int n, m;
    int i, j;

    fin>>n>>m;
    int culoare[n+1] = {0};
    muchie muchii[m+1];

    for (i = 1; i <= m; i++)
    {
        fin>>muchii[i].x>>muchii[i].y>>muchii[i].cost;
    }

    sort(muchii + 1, muchii + m + 1, cmp);

    int start;
    fin>>start;
    culoare[start] = 1;

    for (j = 1; j < n; j++)
    {
        for (i = 1; i <= m; i++)
        {
            if (culoare[muchii[i].x] != culoare[muchii[i].y])
            {
                culoare[muchii[i].x] = culoare[muchii[i].y] = 1;
                cout<<muchii[i].x<<" "<<muchii[i].y<<endl;
                break;
            }
        }
    }

    return 0;
}

