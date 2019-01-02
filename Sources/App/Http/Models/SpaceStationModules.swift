
import Foundation


enum ModuleType : String, CaseIterable, Codable {
    
    case Centre
    
    case QuadrantI
    case QuadrantII
    case QuadrantIII
    case QuadrantIV
    
    var initial : String {
        switch self {
            
        case .Centre : return "C0"
            
        case .QuadrantI: return "QI"
        case .QuadrantII: return "QII"
        case .QuadrantIII : return "QIII"
        case .QuadrantIV : return "QIV"

        }
    }
}

struct SpaceStationModule {
   var moduleType : ModuleType
   var moduleCategory : ModuleCategory?
    
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
    enum CodingKeys: String, CodingKey { case moduleType,moduleInitial, moduleTypeTemplate, colourHex }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(moduleType, forKey: .moduleType)
        try container.encode(moduleType.initial, forKey: .moduleInitial)
        try container.encode(colourHex, forKey: .colourHex)
        try container.encode("Modules/" + moduleType.rawValue, forKey: .moduleTypeTemplate)
    }
}
