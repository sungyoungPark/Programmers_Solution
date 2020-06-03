#include <iostream>

#include <string>
#include <vector>


using namespace std;

vector<vector<int>> mytriangle;
vector<vector<int>> sum;

int searching(int floor,int index){
    if(floor == mytriangle.size()){
        return 0 ;
    }
    if(sum[floor][index] >0 ){
        return sum[floor][index];
    }
    
    return sum[floor][index] = mytriangle[floor][index] + max(searching(floor+1, index),searching(floor+1, index+1));
}

int solution(vector<vector<int>> triangle) {
    
    mytriangle = triangle;
    vector<vector<int>> sum1(triangle.size(),vector<int>(triangle.size(),0));
    sum = sum1;
    
    return searching(0,0);
}




int main(){
    cout<< solution({{7}, {3, 8}, {8, 1, 0}, {2, 7, 4, 4}, {4, 5, 2, 6, 5}}) << endl;
}
