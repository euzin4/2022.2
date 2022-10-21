#include <bits/stdc++.h>
using namespace std;

const int n=7;
int grid[n][n];
int cont=0;

bool is_free_pos(int i, int j){
    if(i>=0 && j>=0 && i<n && j<n && grid[i][j] == 0){
        return true;
    }
    return false;
}

void search (int s, int i, int j){
    if(s == n*n-1){
        if(i == n-1 && j == n-1){
            cont++;
        }
        return;
    }
    if(s == 0 && i == 0 && j == 0){
        //primeira posicao vai sempre pra baixo
        grid[i][j]=1;
        search(s+1,i+1,j);
        grid[i+1][j]=0;
    }
    if(is_free_pos(i+1,j)){
        //going down
        grid[i][j]=1;
        search(s+1,i+1,j);
        grid[i+1][j]=0;
    }
    if(is_free_pos(i-1,j)){
        //going up
        grid[i][j]=2;
        search(s+1,i-1,j);
        grid[i-1][j]=0;
    }
    if(is_free_pos(i,j+1)){
        //going right
        grid[i][j]=3;
        search(s+1,i,j+1);
        grid[i][j+1]=0;
    }
    if(is_free_pos(i,j-1)){
        //going left
        grid[i][j]=4;
        search(s+1,i,j-1);
        grid[i][j-1]=0;
    }
}

int main() {
    search(0,0,0);

    cout << cont*2 << endl;

    return 0;
}
