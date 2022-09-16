#include <iostream>
using namespace std;
#define TRUE 1
#define FALSE 0

int a[50],w[50],sum,n;

int set(int i, int wt, int total) {
        return(((wt+total)>=sum)&&((wt==sum)||(wt+w[i+1]<=sum)));
}

void sumset(int i, int wt, int total) {

        int j;

        if(set(i,wt,total)) {
                if(wt==sum) {
                        cout<<endl;
                        for (j=0;j<=i;j++)
                                if(a[j])
                                        cout<<" "<<w[j];
                } else {
                        a[i+1]=TRUE;
                        sumset(i+1,wt+w[i+1],total-w[i+1]);
                        a[i+1]=FALSE;
                        sumset(i+1,wt,total-w[i+1]);
                }
        }
}

int main() {
        int i,j,n,temp,total=0;
        cout<<"Give number of values: "<<endl;
        cin>>n;
        cout<<"Enter the values: "<<endl;
        for (i=0;i<n;i++) {
                cin>>w[i];
                total+=w[i];
        }

        cout<<"Input the sum value: "<<endl;
        cin>>sum;
        for (i=0;i<=n;i++)
                for (j=0;j<n-1;j++)
                        if(w[j]>w[j+1]) {
                                temp=w[j];
                                w[j]=w[j+1];
                                w[j+1]=temp;
                        }

        cout<<"The given numbers in ascending order:"<<endl;
        for (i=0;i<n;i++)
                cout<<" "<<w[i];
        if((total<sum))
                cout<<"Subset construction is not possible" ;
        else {
                for (i=0;i<n;i++)
                        a[i]=0;
                cout<<endl<<"The solution using backtracking is:"<<endl;
                sumset(-1,0,total);
        }
        return 0;
}