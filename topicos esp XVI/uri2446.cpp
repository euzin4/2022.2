#include <bits/stdc++.h>
using namespace std;

int v,m,val;
vector<int> vet;
string res;

int main(){
    cin >> v >> m;

    for(int i=0; i<m; i++){
        cin >> val;
        vet.push_back(val);
    }
    sort(vet.begin(), vet.end());

    for(int i=m-1; i>=0; i--){
        if(vet[i] <= v){
            v-=vet[i];
            if(v==0){
                break;
            }
        }
    }
    if(v==0){
        res = "S";
    }else{
        res = "N";
    }
    cout << res << "\n";

    return 0;
}
