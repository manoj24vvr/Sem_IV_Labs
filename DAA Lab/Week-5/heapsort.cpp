#include <iostream>
using namespace std;
int h[50], i, j, k ,n,v,heap;

void heapBU(int h[],int n){
    for (i=n/2; i>=1; i--){
        k = i; v = h[k];
        heap = false;
        while(!heap && 2*k <=n){
            j = 2*k;
            if(j<n){
                if (h[j] < h[j+1]) j=j+1;
            }
            if (v>=h[j]){
                heap = true;
            }else{
                h[k] = h[j];
                k = j;
            }
        }
        h[k] = v;
    }
}
/*
void sort(int h[]){
    int m = n;
    cout<<"Elements after sorting are: ";
    for(int i=0;i<m;i++){
        cout<<h[i]<<" ";
        m = m-1;
        h[0] = h[m];
        heapBU(h,m);
    }
}
*/
int main()
{
    cout<<"Give number of elements"<<endl;
    cin>>n;
    cout<<"Enter the elements"<<endl;
    for(int i = 1; i<=n; i++){
        cin>>h[i];
    }
    heapBU(h,n);
    cout<<"Elements of bottom-up heap are: "<<endl;
    for(k =1; k<=n; k++){
        cout<<h[k]<<" ";
    }
    
    cout<<endl;
    sort(h);
    return 0;
}