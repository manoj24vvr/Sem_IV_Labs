#include<iostream>
using namespace std;
#define size 10

struct Node{
    int data;
    struct Node* link;
};
struct Node* chain[size];

void init(){
    for(int i=0;i<size;i++){
        chain[i] = NULL;
    }
}

void insert(int value){

    struct Node *newNode = new Node();
    newNode->data = value;
    newNode->link = NULL;

    int key = value % size;

    if(chain[key] == NULL){
        chain[key] = newNode;
    }else{
        struct Node *temp = chain[key];
        
        while(temp ->link){
            temp = temp ->link;
        }

        temp ->link = newNode;
    }
}

void print(){

    for(int i=0;i<size;i++){
        cout<<"Chain["<<i<<"]-->";

        struct Node *temp = chain[i];
        while(temp){
            cout<<temp->data<<"-->";
            temp = temp->link;
        }

        cout<<"NULL"<<endl;
    }
}
int main(){
    init();
    int n;
    cout<<"Enter the no. of elements: ";
    cin>>n;
    int j=0;
    cout<<"Enter the elements: ";
    for (int i=0;i<n;i++){
        cin>>j;
        insert(j);
        j = 0;
    }

    print();
    return 0;
    
}


