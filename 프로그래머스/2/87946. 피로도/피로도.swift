import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    return checkHP(hp: k, dungeons: dungeons, points: 0)
}

func checkHP(hp : Int, dungeons: [[Int]], points : Int) -> Int{
    
    var point = points
    
    if hp <= 0 {
        return points
    }
    
    if dungeons.count == 1 {
        
        return hp >= dungeons[0][0] ? points + 1 : points
    }
    
    
    for i in 0...dungeons.count - 1 {
        var my_hp = hp
        var my_dungeons = dungeons

        if my_hp >= dungeons[i][0] {
            my_hp = my_hp - dungeons[i][1]
            my_dungeons.remove(at: i)
            
            point = max(point, checkHP(hp: my_hp, dungeons: my_dungeons, points: points + 1))
        }
    }
    
    return point
}