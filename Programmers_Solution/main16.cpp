#include <string>
#include <vector>
#include <iostream>

using namespace std;

long long solution(int N) {
    long long answer = 0;
    vector<long long> line = {1,1};
    long long temp = 0;
    
    if(N<=2){
        if(N==1){
            return 4;
        }
        if(N==2){
            return 1*2+2*2;
        }
    }
    
    for(int i = 0 ; i<N-2;i++){
        temp = line[0];
        line[0] = line[1];
        line[1] = temp +line[1];
    }
    
  //  for(int i = 0; i<line.size();i++)
  //     cout<<line[i]<<endl;
    
    return(line[0]+line[1])*2 + line[1]*2;
}

int main(){
    cout<<solution(2)<<endl;
}
