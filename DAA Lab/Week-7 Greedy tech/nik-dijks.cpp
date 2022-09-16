#include<iostream>
using namespace std;
#define v 3


	int mindist(int dist[v],bool sptset[v])
	{
		int min = INT_MAX;
		int min_index=0 ;
		for(int i=0;i<v;i++)
		{
			if(sptset[i]==false && dist[i]<min)
			{
				min = dist[i];
				min_index = i;
				
				
			}
		}
		return min_index;
	}
	
	void printSolution(int dist[])
{
    cout <<"Vertex \t Distance from Source" << endl;
    for (int i = 0; i < v; i++)
        cout  << i << " \t\t"<<dist[i]<< endl;
}

void dijkstra(int graph[v][v],int src)
{
	int dist[v];
	bool sptset[v];
	for(int i=0;i<v;i++)
	{
		dist[i]=INT_MAX;
		sptset[i] = false;		
	}
	dist[src]=0;
	
	for(int count =0;count<v; count++)
	{
		
	int u = mindist(dist,sptset);
	sptset[u]=true;
	
	for(int j=0 ; j<v;j++)
	{
		if(!sptset[j]&&graph[u][j]&&dist[u]!= INT_MAX && dist[u] + graph[u][j]< dist[j])
		{
			dist[j] = dist[u] + graph[u][j] ;
		}
	}
		
	}
	
	printSolution(dist);
	
}
int main()
{
	int graph[v][v] = 
	{
		{ 0, 4, 0},
        { 4, 0, 8},
        { 0, 8, 0},
        
	};
	dijkstra(graph,0);
	return 0;
}