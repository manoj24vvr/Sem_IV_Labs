#include<iostream>
#include<string.h>
using namespace std;
int stringmatch(char str[], char pattern[]){
	int i,j;
	int n = strlen(str);
	int m = strlen(pattern);
	for(int i=0;i<=n-m;i++){
		int j =0;
		while(j<m && pattern[j]==str[i+j]){
			j++;
		}
		if( j == m){
			return i;
		}
	}
	return -1;
}
int main(){
	char str[100], pattern[100];
	cout<<"Enter the string: ";
	cin>>str;
	cout<<endl<<"Enter the pattern to be searched in the string: ";
	cin>>pattern;
	cout<<endl;
	cout<<"By applying Brute force string matching...";
	int index = stringmatch(str,pattern);
	if(index >= 0){
		cout<<"Match is found at index "<<index<<endl;
	}else{
		cout<<"Match is not found.";
	}
	return 0;
}
