#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <stdio.h>
#include <map>
#include <cstring>
#include <set>
#include <cmath>
#include <cstdlib>
#include <stdlib.h>
#include <functional>

using namespace std;

//dp 거스름돈 문제
int solution(int n, vector<int> money) {
    int arr[money.size()];
    int dp[n+1]; //dp[i]= 거스름돈으로 i를 주는 경우의 수
    memset(dp, 0, sizeof(dp));
    
    for(int i=0;i<money.size();i++)
        arr[i] = money[i];
    sort(arr, arr+money.size());
    
    for(int i=0;i<=n;i=i+arr[0]){
        dp[i] = 1;
    }
    
    for(int i=1;i<money.size();i++){
        for(int j=arr[0]+1;j<=n;j++){
            if(j>=arr[i]){
                dp[j] += dp[j-arr[i]] %1000000007;
            }
        }
    }
    
    
    return dp[n];
}
