
import Foundation

struct SpaceStation {
    
    let modules : [SpaceStationModule] =
        [
            SpaceStationModule(.Top),
            SpaceStationModule(.Left),
            SpaceStationModule(.Centre),
            SpaceStationModule(.Right),
            SpaceStationModule(.Bottom)
        ]
    
}

extension SpaceStation: Encodable {
    enum CodingKeys: String, CodingKey { case modules }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(modules, forKey: .modules)
    }
}
