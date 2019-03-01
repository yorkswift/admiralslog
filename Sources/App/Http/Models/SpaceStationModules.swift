
import Foundation

struct SpaceStationModule {
    
   var moduleType : ModuleType
    
   var moduleCategory : ModuleCategory?
    
    var needsCategory : Bool {
        return moduleCategory == nil
    }
    var colourHex : String {
        
        guard let colourHex = moduleCategory?.colourHex else {
            return "#ffffff"
        }
        
        return colourHex
        
    }
    
    init(_ type: ModuleType) {
        moduleType = type
    }
    init(_ type: ModuleType, category : ModuleCategory?) {
        moduleType = type
        if category != nil {
            moduleCategory = category
        }
    }
}

extension SpaceStationModule: Encodable {
    enum CodingKeys: String, CodingKey {
        case moduleType
        case moduleInitial
        case moduleTypeTemplate
        case colourHex
        case categoryInitial
        case needsCategory
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(moduleType, forKey: .moduleType)
        try container.encode(moduleType.initial, forKey: .moduleInitial)
        try container.encode("Modules/" + moduleType.rawValue, forKey: .moduleTypeTemplate)
        
        try container.encode(colourHex, forKey: .colourHex)
        try container.encode(moduleCategory?.initial, forKey: .categoryInitial)
        try container.encode(needsCategory, forKey: .needsCategory)
    }

}

extension SpaceStationModule : Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(moduleType.initial)
        hasher.combine(moduleCategory?.initial)
    }
}

extension SpaceStationModule: Equatable {
    static func == (lhs: SpaceStationModule, rhs: SpaceStationModule) -> Bool {
        return lhs.moduleType == rhs.moduleType && lhs.moduleCategory == rhs.moduleCategory
    }
}
