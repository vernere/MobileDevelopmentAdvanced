import UIKit



func grader(percentages: (Int, Int, Int)) -> ((Double, Double, Double) -> Int?)? {
    let (p1, p2, p3) = percentages
    
    if p1 < 0 ||  p2 < 0  || p3 < 0 || p1 + p2 + p3 != 100  {
        return nil
    }
        
    return { (p1: Double, p2: Double, p3: Double) -> Int? in
        
        if p1 < 0 || p1 > 100 || p2 < 0 || p2 > 100 || p3 < 0 || p3 > 100  {
            return nil
        }
        
        let average = p1 * Double(p1)/100 + p2 * Double(p2)/100 + p3 * Double(p3)/100
        
        if average >= 90 {
            return 5
        } else if average >= 80 {
            return 4
        } else if average >= 70 {
            return 3
        } else if average >= 60 {
            return 2
        } else if average >= 50 {
            return 1
        } else {
            return 0
        }
    }
}


if let g = grader(percentages: (30, 30, 40)) {
    print(g(80, 90, 85)!)
}
