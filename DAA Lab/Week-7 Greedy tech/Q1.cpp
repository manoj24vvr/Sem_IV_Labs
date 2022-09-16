#include <iostream>
using namespace std;

int a,b,u,v,n,i,j, e =1;
int visited[10] = {0}, mincost = 0, x[10][10],m;

int main(){
    cout<<"Enter the dimension of matrix: "<<endl;
    cin>>n;
    cout<<"Enter the adjacency matrix: "<<endl;
    for(i=1; i<=n; i++){
            for(j =1; j<=n; j++){
                    cin>>x[i][j];
                    if(x[i][j] == 0)
                        x[i][j] = 999;
            }
    }
    visited[1] = 1;
    cout<<endl;

    while(e<n){
        for(i =1, m =999; i<=n; i++){
            for(j=1;j<=n;j++){
                if(x[i][j]<m){
                    if(visited[i]!=0){
                        m = x[i][j];
                        a = u = i;
                        b = v= j;
                    }
                }
            }
        }
        if (visited [u] == 0 || visited [v] == 0){
            cout<<" Edge "<<e++<<"("<<a<<" "<<b<<")"<<" cost "<<" " <<m;
            mincost += m;
            visited[b] =1;
        }

        
        x[a][b] = x[b][a] =999;
    }


    cout<<" Min cost: "<<mincost<<endl;
    return 0;
}