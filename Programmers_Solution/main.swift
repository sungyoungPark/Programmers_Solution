import Foundation

var strBracket = ""


func solution(_ p:String) -> String {
    strBracket = p
   
    return checkBracket(p)
}

func checkBracket(_ p : String) -> String{
    strBracket = p
    var bracketCount = 0
    
    var u = ""
    var flag = 0
    var newU = ""
    
    for i in strBracket{
        if i == "("{
            bracketCount -= 1
        }
        else{
            bracketCount += 1
        }
        u.append(i)
        strBracket.removeFirst()
        if bracketCount == 0{
            break
        }
    }
    
    if u.first == "("{
        flag = 1
    }
    
//    print(u)
//    print(strBracket)
//    print("---")
    if flag == 0{ //올바르지 않은 괄호 문자열 u
        //print("올바르지 않음")
        //newU.append("(")
        if strBracket != ""{
        newU = "("+checkBracket(strBracket)+")"
        }
        else if strBracket == "" {
            newU.insert("(", at: newU.startIndex)
            newU.append(")")
        }
        if u != ""{
                  u.removeFirst()
                  u.removeLast()
                  for i in u{
                      if i == "("{
                          newU.append(")")
                      }
                      else{
                          newU.append("(")
                      }
                  }
              }
        
    }
    else if flag == 1 { //올바른 괄호 문자열 u
        //print("올바름")
        if strBracket != ""{
            newU = u + checkBracket(strBracket)
           // print(u)
        }
        else if strBracket == ""{
            newU = u
        }
        
        
    }
    
    //print(newU)
    return newU
    //print(strBracket)
}

//solution("()))((()")


print(solution("(()())()"))
print("——")
print(solution(")("))
print("——")
print(solution("()))((()"))

