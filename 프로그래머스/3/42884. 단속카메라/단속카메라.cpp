#include <iostream>

#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int solution(vector<vector<int>> routes) {
    int cam = 1;
    
    sort(routes.begin(), routes.end());
    
  
    int cam_start = routes[0][0];
    int cam_end = routes[0][1];
    
    for(int i=1;i<routes.size();i++){
        int this_start = routes[i][0];
        int this_end = routes[i][1];
        
        if(cam_start <= this_start && this_start <= cam_end){
            cam_start = this_start;
            if(cam_end >= this_end){
                cam_end = this_end;
            }
        }
        else if(this_start > cam_end){
            cam_start = this_start;
            cam_end = this_end;
            cam++;
        }
        
               
    }
    
    
    return cam;
}