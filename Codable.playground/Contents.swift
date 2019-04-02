import Foundation

enum ModuleCategory : String, Codable {
    case A
    case D
    case E
    case I
    case R
}

struct SpaceStationConfiguration: Codable {
    var QI : ModuleCategory?
    var QII : ModuleCategory?
    var QIII : ModuleCategory?
    var QIV : ModuleCategory?
}

let rawConfigJSON =
"""
{
    "QI": "A",
    "QII": "D",
    "QIV": "E"
}
"""

let configRawData = Data(rawConfigJSON.utf8)
let decoder = JSONDecoder()

do {
    
    let stationConfig = try decoder.decode(SpaceStationConfiguration.self, from: configRawData)
    
    stationConfig

} catch {
    
    print("\(error)")

}


// Spacestation

enum ModuleType : String, CaseIterable, Codable {
    case QI
    case QII
    case QIII
    case QIV
}

struct SpaceStationModule {
    var moduleType : ModuleType
    var moduleCategory : ModuleCategory?
    
    init(_ type: ModuleType, category : ModuleCategory?) {
        moduleType = type
        if category != nil {
            moduleCategory = category
        }
    }
}

struct SpaceStation {

     let modules : [SpaceStationModule]
     init(_ config : SpaceStationConfiguration) {
        
        self.modules = [
            SpaceStationModule(.QI, category: config.QI),
            SpaceStationModule(.QII, category: config.QII),
            SpaceStationModule(.QIII, category: config.QIII),
            SpaceStationModule(.QIV, category: config.QIV),
        ]
    }

}


do {
    
    let stationConfig = try decoder.decode(SpaceStationConfiguration.self, from: configRawData)
    
    let currentStation = SpaceStation(stationConfig)
    
    currentStation
    
} catch {
    
    print("\(error)")
    
}



