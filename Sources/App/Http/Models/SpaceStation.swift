
import Foundation

struct SpaceStation {
    
    let modules : [SpaceStationModule] =
        [
            SpaceStationModule(.QuadrantI, category: .accomodation),
            SpaceStationModule(.QuadrantII, category: .defence),
            SpaceStationModule(.Centre),
            SpaceStationModule(.QuadrantIII, category: .infrastructure),
            SpaceStationModule(.QuadrantIV, category: .education),
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
