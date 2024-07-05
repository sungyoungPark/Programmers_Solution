import Foundation


func pad (_ n : Int) -> String {
    let front = String(format: "%02d", n / 100)
    var back = ""
    if n % 100 > 60 {
        back = String(format: "%02d", n % 100 - 40)
    }
    else{
     back = String(format: "%02d", n % 100)
    }
    return front + ":" + back
}


func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    let start_time = 900
    var add = [String]()
    var arr = [Int]()
    var count = 0 //버스에 타는 사람 수
    var num = 0 //셔틀 순환 횟수
    
    var next_m = 0
    
    let last_time = start_time + ((n-1) * t / 60 ) * 100 + ((n-1) * t % 60)
    
    var next_start = 900
    
    //print(last_time)
    for i in timetable {
        add = i.components(separatedBy: ":")
        
        arr.append(Int(add[add.startIndex])!*100 + Int(add[add.index(add.startIndex, offsetBy: 1)])!)
    }
    arr.sort()
    
    for i in arr{
        if i > last_time { //막차 시간보다 늦게 온사람이 들어올떄
            return pad(last_time)
        }
        
        else{  //막차 시간보다 일찍 도착
            if i <= next_start {  //다음 출발 시간보다 일찍 도착하거나 정각에 도착
                count += 1
                if count == m { //마지막으로 탄사람이 들어 올때
                    count = 0
                    num += 1
                   
                    
                    if next_start % 100 + t >= 60 {
                        next_start = next_start + 100 + (next_start % 100 + t -  60)
                    }
                    else{
                         next_start = next_start + 100 * (t/60) + (t%60)
                    }
                }
                
            }
            else { //다음 출발 시간보다 늦게 도착했을때
                count = 1
                while true {
                    if i <= next_start{
                        break
                    }
                    
                    next_start = next_start + 100 * (t/60) + (t%60)
                    //print(num+1, "대 출발")
                    num = num + 1
                }
                
            }
            
            
            
        }
        if num >= n{ //현재사람이 막차에 마지막 사람일때 이 사람 보다 1분 일찍 와야함
           
            return pad(i-1)
        }
        
        
    }
    //print("출발시간= ",next_start)
    
  return(pad(last_time))
}