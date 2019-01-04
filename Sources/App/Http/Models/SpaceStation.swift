
import Vapor
import Foundation

struct SpaceStationConfiguration: Content {
    var QI : ModuleCategory?
    var QII : ModuleCategory?
    var QIII : ModuleCategory?
    var QIV : ModuleCategory?
}

struct SpaceStation {
    
    let modules : [SpaceStationModule]
    
    let categories : [ModuleCategory] = [.accomodation,.defence,.education,.infrastructure,.recreation]
    
    init(_ config : SpaceStationConfiguration) {
        modules = [
            SpaceStationModule(.QuadrantI, category: config.QI),
            SpaceStationModule(.QuadrantII, category: config.QII),
            SpaceStationModule(.Centre),
            SpaceStationModule(.QuadrantIII, category: config.QIII),
            SpaceStationModule(.QuadrantIV, category: config.QIV),
        ]
    }
    
    init() {
       modules = [
            SpaceStationModule(.QuadrantI, category: .accomodation),
            SpaceStationModule(.QuadrantII, category: .defence),
            SpaceStationModule(.Centre),
            SpaceStationModule(.QuadrantIII, category: .infrastructure),
            SpaceStationModule(.QuadrantIV, category: .education),
            ]
    }
    
    var configurationUrls : [[String : [String]]] {
        
       let urls = modules.compactMap {
        module -> [String : [String]]? in
        
       if module.moduleType == .Centre { return nil }
        
        var urls = [String: [String] ]()
        
        urls[module.moduleType.initial] = categories.map({
            
             category in
            
//            if category == module.moduleCategory {
//
//            }
            
            return category.initial
            
        })
        return urls
        
        }
        
        return urls
    }

}

extension SpaceStation: Encodable {
    enum CodingKeys: String, CodingKey {
        case modules
        case categories
        case urls
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(modules, forKey: .modules)
        try container.encode(categories, forKey: .categories)
        try container.encode(configurationUrls, forKey: .urls)
    }
    
    
}
