//
//  main.cpp
//  helloCPP
//
//  Created by 박성영 on 26/05/2020.
//  Copyright © 2020 박성영. All rights reserved.
//

#include <string>
#include <vector>
#include <iostream>

using namespace std;

string solution(int n) {
    string answer = "";
    int input = n-1;
    // int arr[3] = {1,2,4};
    
    while (true) {
        if(input<0){
            break;
        }
        else{
            //  cout << input<<endl;
            
            int add = input % 3;
            switch (add) {
                case 0:
                    answer = to_string(1) + answer;
                    break;
                case 1:
                    answer = to_string(2) + answer;
                    break;
                case 2:
                    answer = to_string(4) + answer;
                    break;
                default:
                    break;
            }
            input = input / 3;
            input--;
            
        }
    }
    return answer;
}

int main(){
    for(int i=1; i<=19 ; i++)
        cout << solution(i)<<endl;
}
