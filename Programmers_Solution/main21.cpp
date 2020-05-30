#include <iostream>

#include <string>
#include <vector>
#include <map>
#include <algorithm>

using namespace std;

string solution(vector<string> participant, vector<string> completion) {
    string answer = "";
    
    sort(participant.begin(),participant.end());
    sort(completion.begin(),completion.end());
    
    for(int i= 0 ; i<participant.size();i++){
        if(participant[i] != completion[i])
            return participant[i];
    }
    
 
    
    return participant[0];
}

int main(){
    
    cout<<solution({"leo", "kiki", "eden"}, {"eden", "kiki"})<<endl;
}


