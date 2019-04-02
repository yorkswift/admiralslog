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
            if(maximumDuplicateCount == 0){ maximumDuplicateCount = 1 }
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
        
        assert("AAAA", isLevel: .FourSame)
        
    }
    
    func testThreeSame(){
        
         assert("ADDD", isLevel: .ThreeSame)
         assert("DDDE", isLevel: .ThreeSame)
    
    }

    func testOnePair(){
        
        assert("EERA", isLevel: .OnePair)
        assert("REEA", isLevel: .OnePair)
        assert("RAEE", isLevel: .OnePair)
    
    }

    func testTwoPairs(){
        
        assert("EEDD", isLevel: .TwoPairs)
        assert("AABB", isLevel: .TwoPairs)
        
    }
    
    func testFourDifferent(){
        
         assert("ADER", isLevel: .FourDifferent)

    }
    
    func testCorrupt(){
        
        assert("", isLevel: .None)
        assert("B", isLevel: .None)
        assert("AAAAA", isLevel: .None)
        
    }
    
    func assert(_ stationConfig: String, isLevel level: Level){
        
        print(stationConfig, level, level.rawValue)
        XCTAssertEqual(calculatePoints(stationConfig),level)
    }

}

PointsTest.defaultTestSuite.run()
