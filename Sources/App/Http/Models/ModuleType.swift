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
