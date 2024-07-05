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

using namespace std;

int solution(int m, int n, vector<vector<int>> puddles) {

    int arr[n+1][m+1];
    memset(arr, 0, sizeof(arr));
    
    for(int i=0;i<puddles.size();i++){
        int y = puddles[i][0];
        int x = puddles[i][1];
        arr[x][y] = -1;
    }
    
    for(int i=1;i<=n;i++){
        for(int j=1;j<=m;j++){
            if(i==1 && j==1){
                arr[i][j] = 1;
            }
            else{
                if(arr[i][j] != -1){
                    if(arr[i][j-1] != -1){
                        arr[i][j] = (arr[i][j] + arr[i][j-1]) % 1000000007;
                    }
                    if(arr[i-1][j] != -1){
                        arr[i][j] = (arr[i][j] + arr[i-1][j]) % 1000000007;
                    }
                }
            }
            
            
            
            
        }
    }
    
    
    return arr[n][m];
}