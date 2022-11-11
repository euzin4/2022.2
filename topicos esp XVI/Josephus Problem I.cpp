#include <bits/stdc++.h>
using namespace std;
#define ll long long

ll n,atual=0,excl=1;
vector<ll> vet,res;

int main()
{
    cin >> n;

    for(int i=1;i<=n;i++){
        vet.push_back(i);
    }
    while(n>0){
        if(vet[atual] != 300000 && vet[excl]!=300000){
            res.push_back(vet[excl]);
            vet[excl]=300000;
            n--;
            atual=atual+2;
            excl=atual+1;
            if(excl>=vet.size() && atual!=300000){
                atual=-1;
                excl=atual+1;
            }
        }else if(vet[atual] != 300000){
            excl++;
        }
        if(vet[atual] == 300000){
            atual++;
            excl=atual+1;
        }
    }
}
