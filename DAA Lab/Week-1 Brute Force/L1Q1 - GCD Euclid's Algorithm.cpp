#include<iostream>
using namespace std;
int counter =0;
int gcd(int num1, int num2)
{
        if (num2 == 0){
                return num1;
        }else{
        	// Basic operation
        	counter++;
            return gcd(num2, num1 % num2);
        }
}
int main()
{
        int num1,num2;
        cout<<"Enter 1st integer:"<<endl;
        cin>>num1;
        cout<<"Enter 2nd integer:"<<endl;
        cin>>num2;
        cout<<"GCD of "<<num1<<" and "<<num2<<" is "<<gcd(num1,num2)<<endl;
        cout<<"Counter: "<<counter;
        return 0;
}
