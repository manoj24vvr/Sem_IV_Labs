#include<iostream>
using namespace std;


void insertion_sort(int n,int arr[]){
    int i,key,j,count = 0;
    for(i=1;i<n;i++){
        // unsorted list
        key= arr[i];
        j=i-1;

        while(j>=0 && arr[j]>key){
            arr[j+1] = arr[j];
            j=j-1;
            count +=1;
        }
        arr[j+1] = key;
    }
    cout<<"Counter: "<<count<<endl;
}


void display(int n,int arr[]){
    for(int i=0;i<n;i++){
        cout<<arr[i]<<" ";

    }cout<<endl;
}

int main(){


    cout<<"Enter size of the array: "<<endl;
    int size;
    cin>>size;

    int arr[size];

    cout<<"Enter elements: "<<endl;
    for(int i=0;i<size;i++){
        cin>>arr[i];
    }

    

    insertion_sort(size,arr);

    cout<<"AFTER SORTING: "<<endl;
    display(size,arr);


    return 0;
}
