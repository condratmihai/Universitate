#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

typedef struct
{
    int x,y,c;
}muchie;

bool cmp(muchie a,muchie b)
{
    return a.c<b.c;
}

int main()
{
    ifstream f("date.in");

    int n,m;
    int i,j;

    f>>n;
    f>>m;

    muchie s[m+1];

    for (i=1;i<=m;i++)
    {
        f>>s[i].x;
        f>>s[i].y;
        f>>s[i].c;
    }
    sort(s+1,s+m+1,cmp);

  /*  for (i=1;i<=m;i++)
    {
        cout<<s[i].x<<" ";
        cout<<s[i].y<<" ";
        cout<<s[i].c<<endl;
    }*/

    int cul[n+1];
    for (i=1;i<=n;i++)
    {
        cul[i]=0;
    }
    int start;
    f>>start;
    cul[start]=1;
    for(j=1;j<=n-1;j++)
    {

    for(i=1;i<=m;i++)
        {
              if(cul[s[i].x]!=cul[s[i].y])
                 {
                      cul[s[i].x]=cul[s[i].y]=1;
                      cout<<s[i].x<<" "<<s[i].y<<" ";
                      cout<<endl;
                      break;
                 }


        }

    }
    return 0;
}
