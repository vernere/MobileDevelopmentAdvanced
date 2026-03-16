import UIKit


func arvosana(pisteet p: Double) -> Int? {
    if p < 0.0 || p > 100 {
        return nil
    }
    if p < 40 {
        return 0
    } else {
        return Int(round(0.5 + (p - 40.0)/12.0))
    }
}

arvosana(pisteet: 8.5)
arvosana(pisteet: 40.0)
arvosana(pisteet: -5.0)
arvosana(pisteet: 110.0)
