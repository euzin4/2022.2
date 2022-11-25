#include <bits/stdc++.h>
using namespace std;
#define ll long long

ll n,imp=0;
list<ll> lst,res;
list<ll>::iterator it,it2,it1;


void ultimo_impar(){
    it=lst.begin();
    lst.erase(it);
    it=lst.begin();
}

int main(){
    cin >> n;

    for(int i=1;i<=n;i++){
        lst.push_back(i);
    }

    if(n%2 == 1){
        imp=1;
    }

    it=lst.begin();
    it1=it;
    advance(it1,1);
    it2=lst.end();
    it2--;
    while(!lst.empty()){
        if(imp==1 && it== it2){
            ultimo_impar();
        }else{
            if(it== lst.end()){
                it=lst.begin();
                cout << *it;
                lst.erase(it);
            }else{
                cout << *it1;
                it=lst.erase(it1);
                it1=it;
                advance(it1,1);
            }
        }
    }
}
