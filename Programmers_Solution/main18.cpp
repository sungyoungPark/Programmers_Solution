#include <iostream>

#include <string>
#include <vector>

using namespace std;

bool solution(vector<string> phone_book) {
    string first = phone_book[0];
    int n = phone_book.size();
    for(int i = 0; i<n-1;i++){
        string first = phone_book[i];
        for(int j = i+1; j<n;j++){
            if(first.find(phone_book[j]) == 0){
                return false;
            }
            if(phone_book[j].find(first) == 0){
                return false;
            }
        }
        
        
    }   
    
    return true;
}


int main(){
    
    cout<<solution({"123", "456", "789"})<<endl;
}


