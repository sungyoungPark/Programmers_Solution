#include <string>
#include <vector>
#include <iostream>


using namespace std;

vector<int> solution(int n, int s) {
    vector<int> answer(n);
    
    int share = s / n;
    int remainder = s % n;
    if(share==0){
        return {-1};
    }
    //cout<<share<<remainder<<endl;
    for(int i=1;i<=n;i++){
        //cout<<remainder<<endl;
        if(remainder != 0 ){
            answer[answer.size()-i] = share + 1;
            remainder --;
        }
        else{
            answer[answer.size()-i] = share;
        }
        
    }
    
    
//    for(int i=0;i<answer.size();i++)
//        cout<< answer[i]<<endl;
    return answer;
}


int main(){
    vector<int> result = solution(2, 1);
    
    for(int i=0;i<result.size();i++)
        cout<<result[i]<<endl;
}
