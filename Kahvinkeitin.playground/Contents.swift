import UIKit

class Kahvinkeitin: NSObject {
    var vetta: Int = 0
    var kahvia: Int = 0
    var power: Bool = false
    var maxKahvi: Int = 100
    var maxVetta: Int = 300
    
    var espressoja: Int {
        get {
            min(vetta / 30 , kahvia / 16)
        }
    }
    
    var tavallisia: Int {
        get {
            min(vetta / 200 , kahvia / 15)
        }
    }
    
    func taytaVesiSailio() {
        vetta = maxVetta
    }
    
    func taytaKahviSailio() {
        kahvia = maxKahvi
    }
    
    func teeEspressoa() -> Bool {
        if(!power) {return false}
        if (vetta < 30 || kahvia < 16 ) {
            return false
        } else {
            vetta -= 30
            kahvia -= 16
            return true
        }
    }
    
    func teeTavallinenKahvi() -> Bool {
        if(!power) {return false}
        if (vetta < 200 || kahvia < 15 ) {
            return false
        } else {
            vetta -= 200
            kahvia -= 15
            return true
        }
    }
    
    func painaOnOffNappia() {
        if (power) {
            power = false
        } else {
            power = true
        }
    }

    override var description: String {
        "Kahvinkeitin: \(vetta)/\(maxVetta) vettä, \(kahvia)/\(maxKahvi) kahvia on \(power ? "päällä" : "kiinni")."
    }
}

func main() {
    let kahvinkeitin = Kahvinkeitin()
    print(kahvinkeitin)
    kahvinkeitin.taytaVesiSailio()
    kahvinkeitin.taytaKahviSailio()
    print(kahvinkeitin)
    print("espressoja: \(kahvinkeitin.espressoja)")
    print("tavallisia: \(kahvinkeitin.tavallisia)")
    
    print("tee espresso: \(kahvinkeitin.teeEspressoa())")
    print(kahvinkeitin)
    kahvinkeitin.painaOnOffNappia()
    print("tee tavallinen kahvi: \(kahvinkeitin.teeTavallinenKahvi())")
    print(kahvinkeitin)
    
    for i in 0...4 {
        print("tee espresso: \(kahvinkeitin.teeEspressoa())")
        print(kahvinkeitin)
    }
    
    print("espressoja: \(kahvinkeitin.espressoja)")
    print("tavallisia: \(kahvinkeitin.tavallisia)")
    
    kahvinkeitin.taytaVesiSailio()
    
    print(kahvinkeitin)
    for i in 0...4 {
        print("tee espresso: \(kahvinkeitin.teeEspressoa())")
        print(kahvinkeitin)
    }
}

main()
