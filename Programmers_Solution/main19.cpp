#include <iostream>

#include <vector>
#include <set>

using namespace std;

int solution(vector<int> nums)
{
    int answer = 0;
    int r = nums.size()/2;
    
    set<int> mynum(nums.begin(),nums.end());
    
    int n = mynum.size();
    
    if(n >r){
        return r;
    }
    else{
        return n;
    }

}

int main(){
    
    cout<<solution({3, 1, 2, 3})<<endl;
}


