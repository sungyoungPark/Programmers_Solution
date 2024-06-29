import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    if goal.isEmpty {
        return "Yes"
    }
    var card1 = cards1
    var card2 = cards2
    var goals = goal
    
    for i in 0...goal.count - 1 {
        goals.removeFirst()
        
        let card1First = card1.isEmpty ? "" : card1.first
        let card2First = card2.isEmpty ? "" : card2.first
        
        if card1First == goal[i] || card2First == goal[i]{
            
            if card1First == goal[i] {
                card1.removeFirst()
                solution(card1, card2, goals)
            }
            
            if card2First == goal[i] {
                
                card2.removeFirst()
                solution(card1, card2, goals)
            }
            
        }
        else {
            return "No"
        }
    }
    
    return "Yes"
}
