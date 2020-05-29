#include <iostream>

#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int solution(vector<int> people, int limit) {
    int answer = 0;
    
    vector<int> myPeople = people;
    sort(myPeople.begin(),myPeople.end());
    
    int st_Index = 0;
    int end_Index = myPeople.size()-1;
    
    while (true) {
        if(myPeople[st_Index] + myPeople[end_Index] <= limit){
            answer ++;
            st_Index ++;
            end_Index--;
        }
        else{
            end_Index--;
        }
        
        if(st_Index>=end_Index){
            break;
        }
        
        
        
    }
    
    int another = myPeople.size() - (answer*2);
    
    return answer+another;
}

int main(){
    
    cout<<solution({40,50,50,60,70,80}, 100)<<endl;
}


