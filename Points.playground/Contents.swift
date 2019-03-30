import Foundation
import XCTest


// Expected Results
enum Level : Int {
    
    case FourSame = 2200
    case ThreeSame = 1400
   
    case OnePair = 1000
    case TwoPairs = 1800
    
    case FourDifferent = 3000
    
    case None = 0
    
}

// Method
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


//Tests

class PointsTest: XCTestCase {

    func testFourSame() {
        
        XCTAssertEqual(calculatePoints("AAAA").rawValue,2200)
        
    }
    
    func testThreeSame(){

        XCTAssertEqual(calculatePoints("ADDD").rawValue,1400)
    
    }

    func testOnePair(){
        
        XCTAssertEqual(calculatePoints("EERA").rawValue,3000)
    
    }

    func testTwoPairs(){
        XCTAssertEqual(calculatePoints("EEDD").rawValue,1800)
    }
    
    func testFourDifferent(){
        
        XCTAssertEqual(calculatePoints("ADER").rawValue,3000)
    }
    
    func testCorrupt(){
        
        XCTAssertEqual(calculatePoints("").rawValue,0)
        XCTAssertEqual(calculatePoints("B").rawValue,0)
        XCTAssertEqual(calculatePoints("AAAAA").rawValue,0)
        
    }

}

PointsTest.defaultTestSuite.run()
