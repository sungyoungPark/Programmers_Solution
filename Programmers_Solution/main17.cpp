#include <iostream>
#include <string>
#include <vector>

using namespace std;

int solution(int n) {
    int answer = 0;
    int tmp1 = 1;
    int tmp2 = 2;
    int tmp3 = 0;
    if(n==2){
        return tmp2;
    }
    if(n==1){
        return tmp1;
    }
    
    for(int i=0;i<n-2;i++){
        tmp3 = (tmp1+tmp2)% 1000000007;
        tmp1 = tmp2;
        tmp2 = tmp3;
    }
    
    
    return tmp3 ;
}

int main(){
    cout <<solution(7) <<endl;
    return 0;
}
