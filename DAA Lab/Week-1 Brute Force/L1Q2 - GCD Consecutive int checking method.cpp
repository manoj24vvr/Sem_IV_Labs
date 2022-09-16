#include<iostream>
using namespace std;
int counter=0;
int gcd(int num1,int num2){
        int t;
        if(num1<num2){
                t = num1;
        }else{
                t = num2;
        }
        for(;t>0;t--){
        	// Basic Operation
        	counter++;
            if(num1%t == 0 && num2%t == 0){
                       return t;
            }
        }
}
int main(){
        int num1,num2;
        cout<<"Enter 1st integer:"<<endl;
        cin>>num1;
        cout<<"Enter 2nd integer:"<<endl;
        cin>>num2;
        cout<<"GCD of "<<num1<<" and "<<num2<<" is "<<gcd(num1,num2)<<endl;
        cout<<"Counter: "<<counter;
        return 0;
}
