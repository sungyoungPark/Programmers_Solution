import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var input = board
    let x_len = board[0].count - 1
    let y_len = board.count - 1
    var max = 0
    if x_len < 1 || y_len < 1{
        for y in 0...y_len{
            for x  in 0...x_len{
                if input[y][x] == 1 {
                    max = 1
                }
            }
        }
        
    }
        
    else{
        
        for y in 1...y_len{
            for x in 1...x_len{
                //            print(x,y)
                //            print(input[y-1][x-1],input[y-1][x],input[y][x-1])
                if input[y][x] == 1{
                    input[y][x] = [input[y-1][x-1],input[y-1][x],input[y][x-1]].min()! + 1
                    if max < input[y][x]{
                        max = input[y][x]
                    }
                }
            }
        }
    }
    return max * max
}


print(solution([[0, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [0, 0, 1, 0]]))
print(solution([[0,0,1,1],[1,1,1,1]]))
print(solution([[0,0,0,0]]))
