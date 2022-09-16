#include<iostream>
using namespace std;
#define INFINITY 999
#define SIZE 10


void dijikstra(int x[SIZE][SIZE], int n, int start);
int main(){
        int x[SIZE][SIZE], i, j, n, u;
        cout<<"Enter the no. of vertices: "<<endl;
        cin>>n;
        cout<<"Enter the adjacency matrix: "<<endl;
        for(i=0;i < n;i++)
                for(j=0;j < n;j++)
                        cin>> x[i][j];
        cout<<"Enter the starting node: " <<endl;
        cin>>u;
        dijikstra(x,n,u);
        return 0;
}

void dijikstra(int x[SIZE][SIZE], int n, int start){
        int a[SIZE][SIZE], distance[SIZE], pred[SIZE];
        int visited[SIZE], count, mindistance, next, i,j;
        for(i=0;i < n;i++)
                for(j=0;j < n;j++)
                        if(x[i][j]==0)
                                a[i][j]=INFINITY;
                        else
                                a[i][j]=x[i][j];
        for(i=0;i< n;i++) {
                distance[i]=a[start][i];
                pred[i]=start;
                visited[i]=0;
        }
        distance[start]=0;
        visited[start]=1;
        count=1;
        while(count < n-1){
                mindistance=INFINITY;
                for(i=0;i < n;i++)
                        if(distance[i] < mindistance && !visited[i]) {
                                mindistance=distance[i];
                                next=i;
                        }
                visited[next]=1;
                for(i=0; i < n; i++)
                        if(!visited[i])

                                if(mindistance+a[next][i] < distance[i]) {
                                        distance[i]=mindistance+a[next][i];
                                        pred[i]=next;
                                }
                count++;
        } for(i=0;i < n;i++)
        if(i!=start)
        {
                cout<<endl<<"Distance from starting node to "<<i<<" : "<<distance[i]<<endl;
                cout<<"Path : "<< i;
                j=i;
                do
		{
                        j=pred[j];
                cout<<" : "<<j;
                }
                while(j!=start);
        }}