#include<iostream>
using namespace std;

#define size 10

struct Node{
        int data;
        struct Node* link;
};

struct Node* chain[size];       //linked list creation


void init()
{
    for(int i = 0; i < size; i++)
        chain[i] = NULL;            //both data and link is null
}

void insert(int value)
{
    struct Node *newNode = new Node();
    
    newNode->data = value;
    newNode->link = NULL;
    
    int key = value % size;              //Hash Function
    
    if(chain[key] == NULL)        //location allocation
        chain[key] = newNode;
    
    else
    {
        struct Node *temp = chain[key];     //temp pointing to the address position
    
        while(temp->link)
        {
            temp = temp->link;        //traverse 
        }

        temp->link = newNode;       //then allocate
    }
}

void print()
{
    int i;
    for(i = 0; i < size; i++)
    {
        struct Node *temp = chain[i];

        cout<<"chain["<<i<<"]-->";
        while(temp)
        {
            cout<<temp->data<<"-->";
            temp = temp->link;
        }
        cout<<"NULL"<<endl;
    }
}

int main()
{
    init();
    cout<<"Enter the number of elements: "<<endl;
    int n;
    cin>>n;
    int j=0;
    cout<<"Enter the elements: "<<endl;
    for(int i=0;i<n;i++){
            cin>>j;
            insert(j);
            j=0;
    }

    print();

    return 0;
}