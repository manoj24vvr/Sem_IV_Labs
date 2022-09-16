#include <iostream>
using namespace std;

int main()
{
     int i, j, k, n, a[100][100];
        int indeg[100] = {0};
        int flag[100] = {0};
        int count = 0;

        cout << "Enter number of vertices: " << endl;
        cin >> n;

        cout << "Enter the adjacency matrix: " << endl;
        for(i=0;i<n;i++)
        {       for(j=0;j<n;j++)
                { cin >> a[i][j]; }
        }

        for(i=0;i<n;i++)
        {       for(j=0;j<n;j++)
                { indeg[i] += a[j][i]; }
        }

        cout << "Topologically sorted: " << endl;
        while(count<n)
        {
            for(k=0;k<n;k++)
            {
                if((indeg[k]==0) && (flag[k]==0))
                {
                    cout << k+1 << " ";
                    flag[k] =1;
                }
                for(i=0;i<n;i++)
                {   if(a[k][i]==1)
					{
                        a[k][i] = 0;
                        indeg[i]--;
                    }
                }

                count++;
                break;
            }
        }

        return 0;   
}
