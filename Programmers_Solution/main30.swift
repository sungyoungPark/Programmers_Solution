import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var res = ""
    var R_index = 12
    var L_index = 10
    
    for n in numbers{
        //print(res ," = " , n)
        if(n == 1 || n == 4 || n == 7){
            res = res + "L"
            L_index = n
        }
        else if(n == 3 || n == 6 || n == 9){
            res = res + "R"
            R_index = n
        }
        else if(n == 0 ){
            let L = abs(L_index-11) / 3 + abs(L_index-11) % 3
            let R = abs(R_index-11) / 3 + abs(R_index-11) % 3
            if(L>R){
                res = res + "R"
                R_index = 11
            }
            if(R>L){
                res = res + "L"
                L_index = 11
            }
            if(R==L){
                if(hand == "right"){
                    res = res + "R"
                    R_index = 11
                }
                else{
                    res = res + "L"
                    L_index = 11
                }
            }
        }
        else{
            let L = abs(L_index-n) / 3 + abs(L_index-n) % 3
            let R = abs(R_index-n) / 3 + abs(R_index-n) % 3
            if(L>R){
                res = res + "R"
                R_index = n
            }
            if(R>L){
                res = res + "L"
                L_index = n
            }
            if(R==L){
                if(hand == "right"){
                    res = res + "R"
                    R_index = n
                }
                else{
                    res = res + "L"
                    L_index = n
                }
            }
            
        }
    }
    
    
    
    return res
}


print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
