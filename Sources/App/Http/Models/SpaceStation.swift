
import Foundation

struct SpaceStation {
    
    let modules : [SpaceStationModule] =
        [
            SpaceStationModule(.QuadrantI),
            SpaceStationModule(.QuadrantII),
            SpaceStationModule(.Centre),
            SpaceStationModule(.QuadrantIII),
            SpaceStationModule(.QuadrantIV)
        ]
    
     let categories : [ModuleCategory] = [.accomodation,.defence,.education,.infrastructure,.recreation]

}

extension SpaceStation: Encodable {
    enum CodingKeys: String, CodingKey {
        case modules
        case categories
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(modules, forKey: .modules)
        try container.encode(categories, forKey: .categories)
    }
}
