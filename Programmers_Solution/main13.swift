import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var ans = ""
    var tmpTime = 0
    for musicinfo in musicinfos{
        var obj = musicinfo.components(separatedBy: ",")
        let finTime = obj[1].components(separatedBy: ":")
        let stTime = obj[0].components(separatedBy: ":")
        var isCheck = true
        let finHour = finTime[0]
        let stHour = stTime[0]
        let finMin = finTime[1]
        let stMin = stTime[1]
        
        let playTime = (Int(finHour)! - Int(stHour)!) * 60 + Int(finMin)! - Int(stMin)!
        
        var fullMusic = ""
        let myMusic = obj[3]
        
        var index = 0
        if playTime != 0 {
            for _ in 0...playTime-1{
                if myMusic[myMusic.index(myMusic.startIndex, offsetBy: (index+1) % myMusic.count)] == "#"{
                    fullMusic = fullMusic + String(myMusic[myMusic.index(myMusic.startIndex, offsetBy: index % myMusic.count)]) + "#"
                    
                    index += 2
                }
                else{
                    fullMusic = fullMusic + String(myMusic[myMusic.index(myMusic.startIndex, offsetBy: index % myMusic.count)])
                    index += 1
                }
            }
        }
        //print(fullMusic)
        if fullMusic.contains(m) == true{
            let check = fullMusic.components(separatedBy: m)
            //print(check)
            var count = 0
            for c in check{
                if c.first == "#"
                {
                    isCheck = false
                }
                else{
                    if count != 0{
                        isCheck = true
                        break
                    }
                }
                count += 1
            }
            if isCheck == true{
                if tmpTime < playTime{
                    ans = obj[2]
                    tmpTime = playTime
                }
            }
        }
    }
    if ans == ""{
        ans =  "(None)"
    }
    
    return ans
}
