#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> solution(int n, long long k) {
    vector<int> answer;
    long long temp = 1;
    long long num =k;
    vector<long long> factorial;
    vector<long long> numVec;
    for(int i = 1; i<n;i++){
        numVec.push_back(i);
        temp = temp *i;
        factorial.push_back(temp);
    }
    numVec.push_back(n);
    for(long long i = factorial.size()-1 ; i >=0;i--){
       // cout<<"hi"<<endl;
        long long fact = factorial[i];
        //cout<<"fact"<<fact<<endl;
        long long addNum = ((num-1) /fact)+1;
        num = (num-1)%fact+1;
        answer.push_back((int)numVec[addNum-1]);
        //cout<<addNum<<"/"<<numVec[addNum-1]<<endl;
        
        //cout<<"vec "<<numVec[addNum-1]<<endl;
        numVec.erase(find(numVec.begin(), numVec.end(), numVec[addNum-1]));
        //cout<<"..."<<endl;
    }
    answer.push_back((int)numVec[0]);
    return answer;
}