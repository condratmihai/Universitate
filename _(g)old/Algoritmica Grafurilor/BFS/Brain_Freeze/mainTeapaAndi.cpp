#include <iostream>
#include <fstream>
#include <vector>
#include <queue>

using namespace std;

ifstream fin("date.in");

int n, m, start;
vector< vector <int> >graph;

void BFS (int start)
{
    vector<int> dist(n+1, n+1);
    queue<int> Q;

    dist[start] = 0;
    Q.push(start);

    while (!Q.empty())
    {
        int node = Q.front();
        Q.pop();

        cout<<node;

        int i = 0;
        while(1)
        {
            if (dist[i] == n+1)
            {
                dist[i] = dist[node] + 1;
                Q.push(i);
            }

            i++;
            if(i == (int)graph[node].size()) break;
        }


    }
}

int main()
{
    fin>>n>>m>>start;

    for(int i = 0; i < m; i++)
    {
        int x, y;

        fin>>x>>y;

        graph[x].push_back(y);
    }


    BFS(start);

    return 0;
}
