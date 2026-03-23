    import UIKit



func grader(percentages: (Int, Int, Int)) -> ((Double, Double, Double) -> Int?)? {
    let (w1, w2, w3) = percentages
    
    if w1 < 0 ||  w2 < 0  || w3 < 0 || w1 + w2 + w3 != 100  {
        return nil
    }
        
    return { (points1: Double, points2: Double, points3: Double) -> Int? in
        
        if points1 < 0 || points1 > 100 ||
            points2 < 0 || points2 > 100 ||
            points3 < 0 || points3 > 100  {
            return nil
        }
        
        let total = points1 * Double(w1) / 100.0 + points2 * Double(w2) / 100.0 + points3 * Double(w3) / 100.0
        
        if total < 40 {
            return 0
        }
        
        let result = 0.5 + (total - 40.0) * (4.99 / 60.0)
        
        return Int(result.rounded())
    }
}

let g3 = grader(percentages: (61, 30, 10))
if let g3 = g3 {
    print(g3(40.0, 40.0, 40.0) ?? "Error")
} else {
    print("grader missing")
}

let g1 = grader(percentages: (60, 30, 10))
if let g1 = g1 {
    print(g1(40.0, 40.0, 40.0) ?? "Error")
    print(g1(100.0, 100.0, 100.0) ?? "Error")
    print(g1(100.0, 11.0, 0.0) ?? "Error")
}

let g2 = grader(percentages: (80, 20, 0))
if let g2 = g2 {
    print(g2(40.0, 40.0, 40.0) ?? "Error")
    print(g2(100.0, 100.0, 100.0) ?? "Error")
    print(g2(100.0, 110.0, 0.0) ?? "Error")
}

print("Min total points for each grade")
for grade in 1...5{
    let minIntermediate = Double(grade) - 0.5
    let minTotal = 40.0 + (minIntermediate - 0.5) * (60.0 / 4.99)
    let result = max(minTotal, 40.0)
    print("Grade \(grade): \(String(format: "%.2f", result)) total points")
}
