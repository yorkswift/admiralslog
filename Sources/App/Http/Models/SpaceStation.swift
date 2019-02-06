
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
    
    var completedModules : Int {
        
        return modules.reduce(0, {
            count , module in
            if module.moduleCategory != nil {
                return count + 1;
            } else {
                return count
            }
        })
            
    }
    
    var initials : String {
        
            return String(modules.reduce("", {
                initials , module in
                
                if let initial = module.moduleCategory?.initial {
                    return initials + initial;
                } else {
                    return initials
                }
 
            }).sorted())
        
    }
    
    var isComplete : Bool {
        return completedModules == totalRequiredModules
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
        case completedModules
        case initials
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(modules, forKey: .modules)
        try container.encode(categories, forKey: .categories)
        try container.encode(isComplete, forKey: .isComplete)
        try container.encode(completedModules, forKey: .completedModules)
        try container.encode(initials, forKey: .initials)
        
    }
    
}
