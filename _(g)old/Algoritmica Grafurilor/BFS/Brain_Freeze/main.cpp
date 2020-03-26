#include <iostream>
#include <fstream>
#include <queue>

using namespace std;

ifstream fin("date.in");
ofstream fout("date.out");

int n, m;
int adj[20][20];
int vizitat[20];
int tata[20];
int dist[20];

void BFS(int start)
{
    queue<int> q;

    q.push(start);
    dist[start] = 0;
    vizitat[start] = 1;
    int nr_vizitate = 1;

    cout<<start<<" ";

    while (!q.empty() && nr_vizitate < n)
    {
        int i = q.front();
        q.pop();
        //cout<<i<<" ";

        for(int j = 1; j <= n; j++)
        {
            if (adj[i][j] == 1 && vizitat[j] == 0)
            {
                q.push(j);
                cout<<j<<" ";

                vizitat[j] = 1;
                tata[j] = i;
                dist[j] = dist[i] + 1;

                nr_vizitate++;
            }
        }
    }

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


    BFS(start);

    return 0;
}
