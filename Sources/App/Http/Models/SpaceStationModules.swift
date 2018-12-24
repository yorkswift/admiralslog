
import Foundation

enum ModuleType : String, CaseIterable, Codable {
    case Top
    case Left
    case Centre
    case Right
    case Bottom
}

struct SpaceStationModule  {
   var moduleType : ModuleType
   //var category : ModuleCategory?
    
    init(_ type: ModuleType) {
        moduleType = type
    }
    
}

extension SpaceStationModule: Encodable {
    enum CodingKeys: String, CodingKey { case moduleType, moduleTypeTemplate }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(moduleType, forKey: .moduleType)
        try container.encode("Modules/" + moduleType.rawValue, forKey: .moduleTypeTemplate)
    }
}
