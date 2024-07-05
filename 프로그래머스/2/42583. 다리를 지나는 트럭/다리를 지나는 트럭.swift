import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge_arr = [Int](repeating: 0, count: bridge_length)
    var wait_truck = truck_weights
    var fin = [Int]()
    var cur_weight = 0
    var time = 0
    
    while true{
        if wait_truck == [] {
            break
        }
        else{
            time += 1
            if bridge_arr.first! != 0 {
                cur_weight = cur_weight - bridge_arr.first!
                fin.append(bridge_arr.first!)
                bridge_arr.removeFirst()
            }
            else if bridge_arr.first! == 0 {
                bridge_arr.removeFirst()
            }
            
            if cur_weight + wait_truck.first! <= weight {
                cur_weight = cur_weight + wait_truck.first!
                bridge_arr.append(wait_truck.first!)
                wait_truck.removeFirst()
            }
            else {
                bridge_arr.append(0)
            }
            
        }
        
        
    }
    //print(bridge_arr)
    
    return time + bridge_arr.count
}