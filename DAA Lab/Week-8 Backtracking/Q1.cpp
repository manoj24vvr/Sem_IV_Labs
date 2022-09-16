#include<iostream>
using namespace std;
#define N 4

void print(int board[N][N]) {
           for (int i = 0; i < N; i++) {
                         for (int j = 0; j < N; j++)
                                          cout << board[i][j] << " ";
                                  cout << endl;
                                     }
}
bool isValid(int board[N][N], int row, int col) {
           for (int i = 0; i < col; i++)
                         if (board[row][i])
                                          return false;
              for (int i=row, j=col; i>=0 && j>=0; i--, j--)
                            if (board[i][j])
                                             return false;
                 for (int i=row, j=col; j>=0 && i<N; i++, j--)
                               if (board[i][j])
                                                return false;
                    return true;
}
bool solve(int board[N][N], int col) {
           if (col >= N)
                         return true;
              for (int i = 0; i < N; i++) {
                            if (isValid(board, i, col) ) {
                                             board[i][col] = 1;
                                                      if ( solve(board, col + 1))
                                                                          return true;
                                                               board[i][col] = 0;
                                                                     }
                               }
                 return false; //when no possible order is found
}
bool checkSolution() {
           int board[N][N];
              for(int i = 0; i<N; i++)
                         for(int j = 0; j<N; j++)
                                    board[i][j] = 0; //set all elements to 0
                 if ( solve(board, 0) == false ) {
                               cout << "Solution does not exist";
                                     return false;
                                        }
                    print(board);
                       return true;
}
