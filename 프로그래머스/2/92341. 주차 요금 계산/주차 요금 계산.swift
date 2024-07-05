import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    var dicIn = [String : String]()
    var dicOut = [String : String]()
    
    var ansDic = [String : Int]()
    var ansArr = [Int]()
    
    let inStr = records.filter { str in
        let spl = str.components(separatedBy: " ")
        if spl[2] == "IN" {
            return true
        }
        return false
    }.sorted { str1, str2 in
        let stl1 = str1.components(separatedBy: " ")
        let stl2 = str2.components(separatedBy: " ")
        
        let num1 = Int(stl1[1])
        let num2 = Int(stl2[1])
        
        if num1! > num2! {
            return false
        }
        else if num1 == num2 {
            let time1 = stl1[0].components(separatedBy: ":")
            let time2 = stl2[0].components(separatedBy: ":")
            
            if Int(time1[0])! < Int(time2[0])! {
                return true
            }
            else if Int(time1[0])! == Int(time2[0])! {
                if Int(time1[1])! < Int(time2[1])! {
                    return true
                }
                return false
            }
            return false
        }
        
        else {
            return true
        }
    }
    
    let outStr = records.filter { str in
        let spl = str.components(separatedBy: " ")
        if spl[2] == "OUT" {
            return true
        }
        return false
    }.sorted { str1, str2 in
        let stl1 = str1.components(separatedBy: " ")
        let stl2 = str2.components(separatedBy: " ")
        
        let num1 = Int(stl1[1])
        let num2 = Int(stl2[1])
        
        if num1! > num2! {
            return false
        }
        else if num1 == num2 {
            let time1 = stl1[0].components(separatedBy: ":")
            let time2 = stl2[0].components(separatedBy: ":")
            
            if Int(time1[0])! < Int(time2[0])! {
                return true
            }
            else if Int(time1[0])! == Int(time2[0])! {
                if Int(time1[1])! < Int(time2[1])! {
                    return true
                }
                return false
            }
            return false
        }
        
        else {
            return true
        }
    }
    
    var index = 0
    for inData in inStr {
        let splInData = inData.components(separatedBy: " ")
        
        let splOutData = index <= outStr.count - 1 ?  outStr[index].components(separatedBy: " ") : "23:59 99999 OUT".components(separatedBy: " ")
        print(splOutData)
        if splInData[1] == splOutData[1] { //출차 시간 비교
            let inTime = splInData[0].components(separatedBy: ":")
            let inHour = Int(inTime[0])!
            let inMinute = Int(inTime[1])!
            
            let outTime = splOutData[0].components(separatedBy: ":")
            let outHour = Int(outTime[0])!
            let outMinute = Int(outTime[1])!
            
            let calTime = (outHour - inHour) * 60 + (outMinute - inMinute)
            
            if ansDic[splInData[1]] == nil {
                ansDic[splInData[1]] = calTime
            }
            else {
                ansDic[splInData[1]]! += calTime
            }
            index += 1
        }
        else { //출차 시간 11:59분
            let inTime = splInData[0].components(separatedBy: ":")
            let inHour = Int(inTime[0])!
            let inMinute = Int(inTime[1])!
            
            let outHour = 23
            let outMinute = 59
            
            let calTime = (outHour - inHour) * 60 + (outMinute - inMinute)
            
            if ansDic[splInData[1]] == nil {
                ansDic[splInData[1]] = calTime
            }
            else {
                ansDic[splInData[1]]! += calTime
            }
        }
    }
    
    let my1 = ansDic.sorted { dic1, dic2 in
        if Int(dic1.key)! < Int(dic2.key)! {
            return true
        }
        return false
    }
    
    let sortedAns = ansDic.sorted { dic1, dic2 in
        if Int(dic1.key)! < Int(dic2.key)! {
            return true
        }
        return false
    }
    
    var res = [Int]()
    
    sortedAns.forEach { dic in
        if dic.value <= fees[0] {   //기본 시간
            res.append(fees[1])
        }
        else {
            let t = ((dic.value - fees[0]) / fees[2]) * fees[3]
            let k = ((dic.value - fees[0]) % fees[2]) == 0 ? 0 : fees[3]
            res.append(fees[1] + t + k)
        }
    }
    
    return res
}