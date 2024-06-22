import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    
    let friends = friends
    
    var arr2arr = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    var toDic = [String : Int]()
    var fromeDic = [String : Int]()
    
    for gift in gifts {
        let giftToGift = gift.components(separatedBy: " ")

        guard let to = friends.firstIndex(of: giftToGift[0]) else { return 0 }
        guard let from = friends.firstIndex(of: giftToGift[1]) else { return 0 }
        
        arr2arr[to][from] += 1
        
        //지수 만들기
        let toPer = giftToGift[0]
        let fromPer = giftToGift[1]

        if toDic[toPer] == nil {
            toDic[toPer] = 1
        }
        else {
            toDic[toPer]! += 1
        }
        
        if fromeDic[fromPer] == nil {
            fromeDic[fromPer] = 1
        }
        else {
            fromeDic[fromPer]! += 1
        }

    }
    
    var max = 0
    
    for i in 0...friends.count - 1 {
        let friend = friends[i]
        let a = toDic[friend] == nil ? 0 : toDic[friend]!
        let b = fromeDic[friend] == nil ? 0 : fromeDic[friend]!
        let jisoo = a - b
        
        var ans = 0
        
        for j in 0...friends.count - 1{
            let checkFriend = friends[j]
            let a1 = toDic[checkFriend] == nil ? 0 : toDic[checkFriend]!
            let b1 = fromeDic[checkFriend] == nil ? 0 : fromeDic[checkFriend]!
            let friendJisoo = a1 - b1
            
            if i != j {
                ans =  arr2arr[i][j] > arr2arr[j][i] ? ans + 1 :
                (arr2arr[i][j] == arr2arr[j][i] ? (jisoo > friendJisoo ? ans + 1 : ans) :ans)
            }
        }
        max = max > ans ? max : ans
    }
    
    return max
}
