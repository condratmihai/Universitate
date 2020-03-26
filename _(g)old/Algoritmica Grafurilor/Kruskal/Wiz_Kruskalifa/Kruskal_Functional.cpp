#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

using namespace std;

struct Edge {
  int u, v, cost;
};

bool cmp (Edge e1, Edge e2)
{
    return e1.cost < e2.cost;
}

int father[100];

int Group(int node)
{
  if(node != father[node])
    father[node] = Group(father[node]);

  return father[node];
}

void Unite(int u, int v)
{
  u = Group(u); v = Group(v);
  father[u] = v;
}

int main() {

    ifstream fin("date.in");
    ofstream fout("date.out");

    vector<Edge > edges;
    vector<Edge > mstEdges;
    Edge edge;

    int n, m, i;

    fin>>n>>m;

    //int father[n];

    for(i = 0; i < m; i++) {

        int u,v,cost;

        fin>>u>>v>>cost;

        edge.u = u;
        edge.v = v;
        edge.cost = cost;

        edges.push_back(edge);
  }

  //Kruskal();

  sort(edges.begin(), edges.end(), cmp);

    for(i = 1; i <= n; i++) {
        father[i] = i;
    }

    int mstCost = 0;

    i = 0;
    while(1){

        edge = edges[i];

        if(Group(edge.u) != Group(edge.v)) {
            mstCost += edge.cost;

            Unite(edge.u, edge.v);

            mstEdges.push_back(edge);
        }

        i++;
        if(i == (int)edges.size()) break;
    }

    cout<<mstCost<<" "<<(int)mstEdges.size()<<endl<<endl;

    for (i = 0; i < (int)mstEdges.size(); i++)
    {
        edge = mstEdges[i];
        cout<<edge.u<<" "<<edge.v<<" "<<edge.cost<<endl;
    }

  return 0;
}
