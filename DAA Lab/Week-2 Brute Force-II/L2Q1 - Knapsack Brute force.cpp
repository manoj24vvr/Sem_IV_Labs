 #include<iostream>
#include<math.h>
#include<string.h>
using namespace std;

void reverse(char str[], int length)
{
    int start = 0;
    int end = length -1;
    while (start < end)
    {
        swap(*(str+start), *(str+end));
        start++;
        end--;
    }
}

char* itoa(int num, char* str, int base)
{
    int i = 0;
    bool isNegative = false;
 
    if (num == 0){
        str[i++] = '0';
        str[i] = '\0';
        return str;
    }
    if (num < 0 && base == 10){
        isNegative = true;
        num = -num;
    }
    while (num != 0){
        int rem = num % base;
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        num = num/base;
    }
    if (isNegative)
        str[i++] = '-';
 
    str[i] = '\0'; 
    reverse(str, i);
    return str;
}

int main(){
    int B, n;
    cout<<"Enter no. of items: ";
    cin>>n;
    
    int w[n], v[n];

    cout<<"Enter the weights of all items in order:\n";
    for(int i=0; i<n; i++){
        cin>>w[i];
    }

    cout<<"Enter the values of all items in order:\n";
    for(int i=0; i<n; i++){
        cin>>v[i];
    }

    cout<<"Enter capacity of Knapsack: ";
    cin>>B;

    unsigned int size = pow(2, n);
    int W[size];
    int V[size];

    for(int i=0; i<size; i++){
        W[i]=0;
        V[i]=0;
        for(int j=0; j<n; j++){
            if(i & (1 << j)){
                W[i] += w[j];
                V[i] += v[j];
            }
        }
    }

    int maxVal_idx=0;
    for(int i=0; i<size; i++){
        if(W[i]<=B){
            if(V[i]> V[maxVal_idx])
                maxVal_idx = i;
        }
    }
    char S1[n];
    cout<<maxVal_idx<<endl;


    itoa(maxVal_idx,S1,2);
    int m = strlen(S1);
    char S2[m];
    reverse(S1,m);
    strcpy(S2,S1);

    cout<<"Optimal Solution is: \n";
    cout<<"Weights:   ";
    for(int i=0; i<n; i++){
        cout<<w[i]<<" ";
    }

    cout<<endl<<"Values:    ";
    for(int i=0; i<n; i++){
        cout<<v[i]<<" ";
    }


    cout<<endl<<"Presence:  ";
    //cout<<bitset<n>(maxVal_idx).toString();

    for(int i=0; i<m; i++){
        cout<<S2[i]<<" ";
    }
    for(int i=m; i<n; i++){
        cout<<"0 ";
    }

    cout<<endl<<"Max Value from items: " <<V[maxVal_idx]<<endl;
    cout<<"With total item weight: "<<W[maxVal_idx]<<endl;
    cout<<"which is less than knapsack capacity of: "<<B<<endl;
    
    return 0;
}
