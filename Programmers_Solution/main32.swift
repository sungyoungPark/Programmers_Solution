import Foundation

func go(_ cur : String, _ target:String, _ words:[String],_ check : Int)->Int{
    var res = 0
    if(cur == target){
        return check
    }
    
    if(words==[]){
        return 0
    }
    
    for word in words{
           var myword = words
           var count = 0
           for i in 0...word.count-1{
               if(word[word.index(word.startIndex, offsetBy: i)] != cur[cur.index(cur.startIndex, offsetBy: i)]){
                   count += 1
               }
           }
           if(count == 1){
               let index = myword.firstIndex(of: word)
               myword.remove(at: index!)
               res = go(word, target,myword,check+1)
           }
           
       }
    
    return res
}


func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var min = 51
    for word in words{
        var myword = words
        var count = 0
        for i in 0...word.count-1{
            if(word[word.index(word.startIndex, offsetBy: i)] != begin[begin.index(begin.startIndex, offsetBy: i)]){
                count += 1
            }
        }
        if(count == 1){
            let index = myword.firstIndex(of: word)
            myword.remove(at: index!)
            let k = go(word, target,myword,1)
            if(min > k && min != 0){
                min = k
            }
        }
        
    }
    if(min == 51){
        return 0
    }
    else{
        return min
    }
}

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
