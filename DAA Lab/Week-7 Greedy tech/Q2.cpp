#include<iostream>
using namespace std;

int i,j,k,a,b,u,v,n,e=1;
int m, mincost=0,x[10][10],parent[10];
int find(int);
int uni(int,int);

int main(){
        cout<<"Enter dimension of matrix: "<<endl;
        cin>>n;
        cout<<"Enter the cost adjacency matrix"<<endl;
        for(i=1;i<=n;i++)
        {
                for(j=1;j<=n;j++)
                {
                        cin>>x[i][j];
                        if(x[i][j]==0)
                                x[i][j]=999;
                }
        }
        cout<<"The edges of Minimum Cost Spanning Tree are"<<endl;
        while(e<n)
        {
                for(i=1,m=999;i<=n;i++)
                {
                        for(j=1;j<=n;j++)
                        {
                                if(x[i][j]<m)
                                {
                                        m=x[i][j];
                                        a=u=i;
                                        b=v=j;
                                }
                        }
                }
                u=find(u);
                v=find(v);
                if(uni(u,v))
                {
                        cout<<endl<<"Edge "<<e++<<"("<<a<<" "<<b<<")"<<" cost "<<" "<<m;
                        mincost +=m;
                }
                x[a][b]=x[b][a]=999;
        }
        cout<<endl<<" Minimum cost = "<<mincost<<endl;
}
int find(int i)
{
        while(parent[i])
                i=parent[i];
        return i;
}
int uni(int i,int j)
{
        if(i!=j)
        {
                parent[j]=i;
                return 1;
        }
        return 0;
}