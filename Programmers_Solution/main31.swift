import Foundation

func cal( _ a : Int , _ b : Int, _ prefix : String) -> Int{
    if(prefix == "+"){
        return a + b
    }
    if(prefix == "*"){
        return a * b
    }
    if(prefix == "-"){
        return a - b
    }
    return 0
}


func go(_ number : [Int] , _ sign : [String], t1 : String, t2: String , t3: String) -> Int{
    var case1 = 0
    var nb1 = number
    var cs1 = sign
    
    var index = 0
    
    for c in cs1{
        if(c == t1){
            nb1[index] = cal(nb1[index], nb1[index+1], t1)
            nb1.remove(at: index+1)
            cs1.remove(at: index)
        }
        else{
            index += 1
        }
    }
    
    index = 0
    for c in cs1{
        if(c == t2){
            nb1[index] = cal(nb1[index], nb1[index+1], t2)
            nb1.remove(at: index+1)
            cs1.remove(at: index)
        }
        else{
            index += 1
        }
    }
    
    index = 0
    for c in cs1{
        if(c == t3){
            nb1[index] = cal(nb1[index], nb1[index+1], t3)
            nb1.remove(at: index+1)
            cs1.remove(at: index)
        }
        else{
            index += 1
        }
    }
    case1 = nb1[0]
    
    return case1
}


func solution(_ expression:String) -> Int {
    
    var number = expression.components(separatedBy: ["+","-","*","/"]).map{
        (value:String) -> Int in return Int(value)! }
    
    let sign = expression.components(separatedBy: ["0","1","2","3","4","5","6","7","8","9"]).joined().map{
        (value:Character) -> String in return String(value) }
    
    
    var arr : [Int] = []
    
    arr.append(abs(go(number, sign, t1: "*", t2: "+", t3: "-")))
    arr.append(abs(go(number, sign, t1: "*", t2: "-", t3: "+")))
    arr.append(abs(go(number, sign, t1: "+", t2: "*", t3: "-")))
    arr.append(abs(go(number, sign, t1: "+", t2: "-", t3: "*")))
    arr.append(abs(go(number, sign, t1: "-", t2: "+", t3: "*")))
    arr.append(abs(go(number, sign, t1: "-", t2: "*", t3: "+")))

    
    
    return arr.max()!
}

print(solution("100-200*300-500+20"))
