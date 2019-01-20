
import Vapor
import Foundation

struct SpaceStation {
    
    let modules : [SpaceStationModule]
    let config : SpaceStationConfiguration
    let categories : [ModuleCategory] = [.accomodation,.defence,.education,.infrastructure,.recreation]
    
    init(_ config : SpaceStationConfiguration) {
        
        self.config = config
        
        self.modules = [
            SpaceStationModule(.QuadrantI, category: config.QI),
            SpaceStationModule(.QuadrantII, category: config.QII),
            SpaceStationModule(.Centre),
            SpaceStationModule(.QuadrantIII, category: config.QIII),
            SpaceStationModule(.QuadrantIV, category: config.QIV),
        ]
    }
    
    let totalRequiredModules = 4
    
    var isComplete : Bool {
        
        let modulesCompletedCount = modules.reduce(0, {
            count , module in
            if module.moduleCategory != nil {
                return count + 1;
            } else {
                return count
            }
        })
        
        return modulesCompletedCount == totalRequiredModules
            
    }
    
    var moduleSet : Set<SpaceStationModule>  {
        return Set(self.modules)
    }

}

extension SpaceStation: Encodable {
    enum CodingKeys: String, CodingKey {
        case modules
        case categories
        case urls
        case isComplete
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(modules, forKey: .modules)
        try container.encode(categories, forKey: .categories)
        try container.encode(isComplete, forKey: .isComplete)
    }
    
}
