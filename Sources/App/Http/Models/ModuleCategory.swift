
import Foundation

enum ModuleCategory : String, CaseIterable {
    
    case accomodation
    case defence
    case education
    case infrastructure
    case recreation
    
    var colourHex : String {
        switch self {
            case .accomodation: return "#fdd97a" //'yellow'
            case .defence: return "#9dcb8c" //'green'
            case .education : return "#a088b8" //'purple'
            case .infrastructure : return "#a5ddec" //'blue'
            case .recreation : return "#f47f52" //'orange'
        }
    }
    
    var initial : String {
        switch self {
        case .accomodation: return "A"
        case .defence: return "D"
        case .education : return "E"
        case .infrastructure : return "I"
        case .recreation : return "R"
        }
    }
    
    init(initial: String) {
        switch initial {
            case "A": self = .accomodation
            case "D": self = .defence
            case "E": self = .education
            case "I": self = .infrastructure
            case "R": self = .recreation
            default: self = .accomodation
        }
    }
}

extension ModuleCategory: Encodable {
    enum CodingKeys: String, CodingKey {
        case name, initial, colourHex
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.rawValue.uppercased(), forKey: .name)
        try container.encode(initial, forKey: .initial)
        try container.encode(colourHex, forKey: .colourHex)
    }
}

extension ModuleCategory: Decodable {
    
    init(from decoder: Decoder) throws {
        
       let container = try decoder.singleValueContainer()
       let rawValue = try container.decode(String.self)
        
       if rawValue.isEmpty {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Cannot initialize ModuleCategory from an empty string"
            )
        }
        
       self.init(initial: rawValue)
    
    }
    
  
}

