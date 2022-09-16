#include<iostream>
using namespace std;

void bubblesort(int a[], int n){
    int counter = 0;
    for(int i = n-1; i>0;i--){
        for(int j=0;j<i;j++){
        	if(a[j]>a[j+1]){
                int temp = a[j+1];
                a[j+1] = a[j];
                a[j] = temp;
            }
            counter = counter + 1;
        }
    }
    cout<<" Counter: "<<counter<<endl;
}

void selectionsort(int a[], int n){
    int counter =0;
    for(int i=0;i<n-1;i++){
        int min_val = i;
        for(int j=i+1;j<n;j++){
            if(a[j]<a[min_val]){
                min_val = j;
            }
            counter = counter +1;
        }
        int temp = a[min_val];
        a[min_val] = a[i];
        a[i] = temp;
    }
    cout<<" Counter: "<<counter<<endl;
}
int main(){
    int n,counter;
        cout<<"Enter the no. of elements to insert in array: "<<endl;
        cin>>n;
        int a[n];
        cout<<"Enter the elements of the array: "<<endl;
        for(int i=0;i<n;i++){
                cin>>a[i];
        }
        int b[n];
        for(int i=0;i<n;i++){
                b[i] = a[i];
        }
        
        bubblesort(a,n);
        cout<<"Sorted array using bubble sort algorithm: ";
        for(int i=0;i<n;i++){
                cout<<a[i]<<" ";
        }
        cout<<endl;
		
		selectionsort(b,n);
        cout<<"Sorted array using selection sort algorithm: ";
        for(int i=0;i<n;i++){
                cout<<b[i]<<" ";
        }
        cout<<endl;
        return 0;
}
