#include <iostream>
using namespace std;


int p[10][10];//P-permutation
int cp = 0, n;


void permute(int arr[], int i)
{
if(i==n)
{
for(int k=0;k<n;k++)
{
p[cp][k] = arr[k];
}
cp++;
}
else
{
for(int j = i; j<n; j++)
{
int temp = arr[i];
arr[i] = arr[n];
arr[n] = temp;
}
}
}


int main()
{
int jobs[10], money[10][10];


cout << "Enter number of jobs and people: " << endl;
cin >> n;
int i, j;

for(i=0;i<n;i++)
jobs[i] = i+1;

for(i=0;i<n;i++)
{
cout << "Enter money taken by people for job " << i+1 << ": " << endl;
for(j=0;j<n;j++)
{
cin >> money[i][j];
}
}

permute(jobs, n);

int cost, mincost=1000, minarray[10];


for(i=0;i<n;i++)
{
for(j=0;j<n;j++)
{
cost += money[p[i][j]-1][j];
}


if(cost<mincost)
{
mincost = cost;


for(int k=0;k<n;k++)
{
minarray[k] = p[i][k];
}
}
}


cout << "Minimum Cost: " << mincost << endl;
cout << "Combination: ";
for(i=0;i<n;i++)
cout << minarray[i] << " ";


cout << endl;

return 0;
}