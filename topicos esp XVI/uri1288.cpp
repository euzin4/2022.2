#include <bits/stdc++.h>
using namespace std;

int ntestes,N=0,X,Y,K=0,R,ptot=0,dtot=0;
vector <int> res;

int main() {
    cin >> ntestes;
    for(int i=0;i<ntestes;i++){     //numero de testes
        while(N<1 || N>50){         //N=numero de projeteis diponiveis (vezes atiradas)
            cin >> N;
        }
        for(int j=0;j<N;j++){
            cin >> X >> Y;          //X=poder de destruição Y=peso
            ptot+=Y;
            dtot+=X;
        }
        while(K<1 || K>100){        //K=capacidade de carga
            cin >> K;
        }
        cin >> R;                   //R=resistencia do castelo
        if(ptot > K || dtot< R){
            res.push_back(1);
        }
        else{
            res.push_back(2);
        }
    }
    for(int i=0;i< res.size();i++){
        if(res[i]==1){
            cout << "Falha na missao";
        }
        if(res[i]==2){
            cout << "Missao completada com sucesso";
        }
    }

}
