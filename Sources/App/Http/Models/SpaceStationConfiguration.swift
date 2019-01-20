
import Vapor
import Foundation

struct SpaceStationConfiguration: Content {
    var QI : ModuleCategory?
    var QII : ModuleCategory?
    var QIII : ModuleCategory?
    var QIV : ModuleCategory?
}

extension SpaceStationConfiguration: Encodable {
    enum CodingKeys: String, CodingKey {
        case QI
        case QII
        case QIII
        case QIV
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
       
        try container.encode(QI?.initial, forKey: .QI)
        try container.encode(QII?.initial, forKey: .QII)
        try container.encode(QIII?.initial, forKey: .QIII)
        try container.encode(QIV?.initial, forKey: .QIV)
    }
    
}
