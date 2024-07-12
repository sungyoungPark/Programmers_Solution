import Foundation

struct Point : Hashable{
    var x : Int
    var y : Int
    
    mutating func move(moveX : Int, moveY :Int) {
        x = x + moveX
        y = y + moveY
    }
    
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

struct Line : Hashable{
    static func == (lhs: Line, rhs: Line) -> Bool {
        return lhs.point1 == rhs.point1 && lhs.point2 == rhs.point2
    }
    
    var point1 : Point
    var point2 : Point
}

func solution(_ arrows:[Int]) -> Int {
    let move = [[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]]
    
    var before_oneSteop_Point = Point(x: 0, y: 0)
    var currentPoint = Point(x: 0, y: 0)
    
    var visit_Point : Set<Point> = []
    var maked_Line : Set<Line> = []
    
    
    var res = 0
    visit_Point.update(with: before_oneSteop_Point)
    
    for arrow in arrows {
        for _ in 0...1 {
            currentPoint.move(moveX: move[arrow][0], moveY: move[arrow][1])
            
            let moveline = Line(point1: before_oneSteop_Point, point2: currentPoint)
            let moveline2 = Line(point1: currentPoint, point2: before_oneSteop_Point)
            
            if visit_Point.contains(currentPoint) {
                if maked_Line.contains(moveline) == false || maked_Line.contains(moveline2) == false {

                    res += 1
                }
            }
            
            visit_Point.update(with: currentPoint)
            maked_Line.update(with: moveline)
            maked_Line.update(with: moveline2)
            
            before_oneSteop_Point = currentPoint
        }
    }

    return res
}