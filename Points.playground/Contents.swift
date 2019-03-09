import Foundation
import XCTest

enum Level : Int {
    
    case FourSame = 2200
    case ThreeSame = 1400
   
    case OnePair = 1000
    case TwoPairs = 1800
    
    case FourDifferent = 3000
    
    case None = 0
    
}

func calculatePoints(_ initials:String) -> Level {
    
    if(initials.count != 4){ return .None }
    
    let fourSame = String(repeating: initials.first!, count: 4)
    if(fourSame == initials){ return .FourSame }
    
    var maximumDuplicateCount = 0

    let duplicates = initials.reduce([Character:Int]()) { (duplicates, letter) -> [Character: Int] in
        
        var d = duplicates
        
        guard let previousCount = d[letter] else {
            d[letter] = 1
            maximumDuplicateCount = 1
            return d
        }
        
        let newCount = previousCount + 1
        
        d[letter] = newCount
        
        if(maximumDuplicateCount < newCount){ maximumDuplicateCount = newCount }
        
        return d
    }
    
    switch(maximumDuplicateCount){
        case 3:
            
            return .ThreeSame
        
        case 2:
    
            if let _ = duplicates.values.first(where: { (count) -> Bool in
                return count != 2
            }){
                return .OnePair
            }
            
          return .TwoPairs
        
        default:
            
            return .FourDifferent
    }
    
}

//ADEIR

calculatePoints("AAAA").rawValue

calculatePoints("ADDD").rawValue

calculatePoints("EERA").rawValue

calculatePoints("EEDD").rawValue

calculatePoints("ADER").rawValue

calculatePoints("B").rawValue

