#include <iostream>
#include <fstream>

using namespace std;

ifstream fin("date.in");

int n, m;
int adj[20][20];
int vizitat[20];
int tata[20];
int dist[20];


void DFS(int i, int t)
{
    vizitat[i] = 1;
    tata[i] = t;
    dist[i] = dist[t] + 1;
    cout<<i<<" "<<dist[i]<<endl;
    for(int j = 1; j <= n; j++)
        if(adj[i][j] == 1 && vizitat[j] == 0)
            DFS(j, i);
}

int main()
{
    int start,i,j;

    fin>>n>>m>>start;

    for (i = 0; i < m; i++)
    {
        int x, y;
        fin>>x>>y;
        adj[x][y] = adj[y][x] = 1;
    }

    dist[0] = -1;
    DFS(start, 0);

    return 0;
}

