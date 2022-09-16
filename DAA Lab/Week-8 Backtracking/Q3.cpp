#include <iostream>
using namespace std;
#define max 8

int w[max],i,j,p[max];
int n,m;
float unit[max];
int y[max],x[max],fp=-1,fw;
void get()
{
        cout<<"Enter total number of items: "<<endl;
        cin>>n;
        cout<< "Give capacity" <<endl;
        cin>>m;
        for(i=0;i<n;i++)
        {
                cout<<"Enter the weight of the item"<<endl;
                cin>>w[i];
                cout<<"Enter the profit of the item"<<endl;
                cin>>p[i];
        }
}

void show()
{

        float s=0.0;
        for(i=0;i<n;i++)
                for(i=0;i<n;i++)
                        if(x[i]==1)
                        {
                                cout<<i+1;
                                s += (float) p[i] * (float) x[i];
                        }
cout<<endl<<"Maximum Profit: "<<" "<<endl<<s;
}


void sort()
{
        int t,t1;
        float temp;
        for(i=0;i<n;i++)
                unit[i] = (float) p[i] / (float) w[i];
        for(i=0;i<n-1;i++)
        {
                for(j=i+1;j<n;j++)
                {
                        if(unit[i]  < unit[j])
                        {
                                temp = unit[i];
                                unit[i] = unit[j];
                                unit[j] = temp;
                                t = p[i];
                                p[i] = p[j];
                                p[j] = t;
                                t1 = w[i];
                                w[i] = w[j];
                                w[j] =t1;
                        }
                }
        }
}
float bound(float cp,float cw,int k)
{
        float b = cp;
        float c = cw;
        for(i=k;i<=n;i++)
        {
                c = c+w[i];
                if( c < m)
                        b = b +p[i];
                else
                        return (b+(1-(c-m)/ (float)w[i])*p[i]);
        }
        return b;
}
void knapsack(int k,float cp,float cw)
{
        if(cw+w[k] <= m)
        {
                y[k] = 1;
                if(k <= n)
                        knapsack(k+1,cp+p[k],cw+w[k]);
                if(((cp+p[k]) > fp) && ( k == n))
                {
                        fp = cp+p[k];
                        fw = cw+w[k];
                        for(j=0;j<=k;j++)
                                x[j] = y[j];
                }
        }
        if(bound(cp,cw,k) >= fp)
        {
                y[k] = 0;
                if( k <= n)
                        knapsack(k+1,cp,cw);
                if((cp > fp) && (k == n))
                {
                        fp = cp;
                        fw = cw;
                        for(j=0;j<=k;j++)
                                x[j] = y[j];
                }
        }
}
int main()
{
        get();
        sort();
        knapsack(0,0.0,0.0);
        show();
        return 0;
}