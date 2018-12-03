
import Foundation

enum ModuleType : String, CaseIterable {
    case Top
    case Left
    case Centre
    case Right
    case Bottom
}

struct SpaceStationModule {
   var moduleType : ModuleType
   var category : ModuleCategory?
    
    init(_ type: ModuleType) {
        moduleType = type
    }
    
}
