#include <cstdio>
#include <vector>
#include <algorithm>

FILE *fin = freopen("apm.in", "r", stdin); FILE *fout = freopen("apm.out", "w", stdout);

const int MAX_N = 2e5 + 5;

struct Edge {
  int u, v, cost;

  Edge(const int &u, const int &v, const int &cost) {
    this->u = u; this->v = v; this->cost = cost;
  }

  bool operator <(const Edge &other) const {
    return this->cost < other.cost;
  }
};

/*-------- Data --------*/
int n, m;
std::vector<Edge > edges;

int father[MAX_N];
std::vector<Edge > mstEdges;
/*-------- --------*/

void ReadInput() {
  scanf("%d%d", &n, &m);

  for(int i = 0; i < m; i++) {
    int u, v, cost; scanf("%d%d%d", &u, &v, &cost);

    edges.emplace_back(u, v, cost);
  }
}

int Group(int node) {
  if(node != father[node]) {
    father[node] = Group(father[node]);
  }
  return father[node];
}

void Unite(int u, int v) {
  u = Group(u); v = Group(v);
  father[u] = v;
}

void Kruskal() {
  std::sort(edges.begin(), edges.end());

  for(int i = 1; i <= n; i++) {
    father[i] = i;
  }

  long long mstCost = 0;

  for(auto& edge : edges) {
    if(Group(edge.u) != Group(edge.v)) {
      mstCost += edge.cost;

      Unite(edge.u, edge.v);

      mstEdges.push_back(edge);
    }
  }

  printf("%lld\n%d\n", mstCost, (int)mstEdges.size());
  for(auto& edge : mstEdges) {
    printf("%d %d\n", edge.u, edge.v);
  }
}

int main() {
  ReadInput();

  Kruskal();

  return 0;
}
