#include<iostream>
using namespace std;
#define MAX 100

#define initial 1
#define visited 2

int n;    /* Number of nodes in the graph */
int adj[MAX][MAX]; /*Adjacency Matrix*/
int state[MAX]; /*Can be initial or visited */

int stack[MAX];
int top = -1;

void push(int v)
{
        if(top == (MAX-1))
        {
                cout<<"\nStack Overflow\n";
                return;
        }
        top=top+1;
        stack[top] = v;

}

int pop()
{
        int v;
        if(top == -1)
        {
                cout<<"\nStack Underflow\n";
                exit(1);
        }
        else
        {
                v = stack[top];
                top=top-1;
                return v;
        }
}

int isEmpty_stack( )
{
  if(top == -1)
          return 1;
  else
          return 0;
}

void DFS(int v)
{
        int i;
        push(v);
        while(!isEmpty_stack())
        {
                v = pop();
                if(state[v]==initial)
                {
                        cout<<v;
                        state[v]=visited;
                }
                for(i=n-1; i>=0; i--)
                {
                        if(adj[v][i]==1 && state[i]==initial)
                                push(i);
                }
        }
}

void DF_Traversal()
{
        int v;

        for(v=0; v<n; v++)
                state[v]=initial;

        cout<<"Enter starting node for Depth First Search : ";
        cin>>v;
        DFS(v);
        cout<<endl;
}

void create_graph()
{
        int i,max_edges,origin,destin;

        cout<<"\nEnter number of nodes : ";
        cin>>n;
        max_edges=n*(n-1);

        for(i=1;i<=max_edges;i++)
        {
                cout<<"\nEnter edge "<<i<<" ( -1 -1 to quit ) : ";
                cin>>origin>>destin;

                if( (origin == -1) && (destin == -1) )
                        break;

                if( origin >= n || destin >= n || origin<0 || destin<0)
                {
                        cout<<"\nInvalid edge!"<<endl;
                        i--;
                }
                else
                {
                        adj[origin][destin] = 1;
                }
        }
}

main()
{
        create_graph();
        DF_Traversal();
}
