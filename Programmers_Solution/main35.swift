import Foundation

func check(_ file : String) -> [String]{
    var head = ""
    var number = ""
    var tail = ""
    var index = 0
    
    for i in 0...file.count-1{
        if(file[file.index(file.startIndex, offsetBy: i)].isNumber == false){
            head = head + String(file[file.index(file.startIndex, offsetBy: i)])
            index += 1
        }
        else{
            break
        }
        
    }
    
    for i in index...file.count-1{
        if(file[file.index(file.startIndex, offsetBy: i)].isNumber){
            number = number + String(file[file.index(file.startIndex, offsetBy: i)])
            index += 1
        }
        else{
            break
        }
    }
    
    if(index <= file.count-1){
        for i in index...file.count-1{
            tail = tail +  String(file[file.index(file.startIndex, offsetBy: i)])
        }
    }
    
    return [head.lowercased(),number,tail]
}



func solution(_ files:[String]) -> [String] {
    
    var arr = files
    
    arr.sort { (a1, b1) -> Bool in
        let a = check(a1)
        let b = check(b1)
        
        if(a[0] > b[0]){
            //print(1,b1,"이 먼저 나와야함", a1)
            return false
        }
        else if(a[0] == b[0]){
            if(Int(a[1])! >= Int(b[1])! ){
                //print(2,b1,"이 먼저 나와야함",a1)
                return false
            }
            else{
                //print(3,a1,"이 먼저 나와야함",b1)
                return true
            }
        }
        else{
            //print(4,a1,"이 먼저 나와야함",b1)
            return true
        }
        
    }
  
    //print(arr)
    
    return arr
}


print(solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG","a11"]))
