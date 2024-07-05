import Foundation



var banned = Set<Set<String>>()

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    var possibled = [[String]]()
    var index = 0
    for ban in banned_id {
        var posible = [String]()
        for user in user_id{
            index = 0
            for b in ban {
                if index == user.count{
                    break
                }
                if b != "*"{
                    if b != user[user.index(user.startIndex, offsetBy: index)]{
                        break
                    }
                }
                index += 1
            }
            if index == ban.count && index == user.count{
                posible.append(user)
            }
        }
        if posible.count != 0 {
            possibled.append(posible)
        }
    }
    
    possibled = possibled.sorted(by: {$0.count < $1.count})
    let mySet = Set<String>()
    if possibled.count != 0 {
        check(mySet, possibled, possibled[0], 0)
    }
    print(banned)
    return banned.count
}

func check(_ set : Set<String> , _ possibled : [[String]] , _ arr : [String], _ index : Int) -> Set<String>{
    var newSet = set
    
    if index == possibled.count-1{
        for i in arr{
            if set.contains(i) == false{
                newSet.insert(i)
                banned.insert(newSet)
                newSet = set
            }
        }
        return set
    }
    
    for i in arr{
        if set.contains(i) == false {
            newSet.insert(i)
            newSet = check(newSet, possibled, possibled[index+1],index+1)
            newSet = set
        }
    }
    if newSet.count == set.count{
        return []
    }
    
    return newSet
}