
import Foundation
import Vapor


struct ModulePermuation : Encodable {
    
    var moduleInitial : String
    var template : String
    var colourHex : String
    var anchors : [String : String]
    
}

struct CategoryPermuation : Encodable {
    
    var initial : String
    var anchor : String
    
}

class ModuleTypePermutations {
    
    static let shared = ModuleTypePermutations()
    
    func modulePermutationsFor(station: SpaceStation, request: Request) -> [ModulePermuation] {
        
            return station.modules.compactMap {
                module -> ModulePermuation? in
                
                 //if module.moduleType == .Centre { return nil }
                
             //   print(module.moduleType)
                
                
                return ModulePermuation(
                        moduleInitial: module.moduleType.initial,
                        template: "Modules/" + module.moduleType.rawValue,
                        colourHex : module.colourHex,
                        anchors : station.categories.reduce(into: [:]) {
                    
                            (anchors,category)  in
                    
                            anchors[category.initial] = "#"
                            

                  do {
                    
                    let permuation: Set<SpaceStationModule> = [SpaceStationModule(module.moduleType, category: category)]
                    
                    let unionised = station.moduleSet.union(permuation)
                    
                    var permuationConfig = SpaceStationConfiguration()
                    
                    _ = unionised.map {
                        unionisedModule in
                        
                        if let categoryInitial = unionisedModule.moduleCategory, unionisedModule.moduleType == .QuadrantI {
                            permuationConfig.QI = categoryInitial
                        }
                        if let categoryInitial = unionisedModule.moduleCategory, unionisedModule.moduleType == .QuadrantII {
                            permuationConfig.QII = categoryInitial
                        }
                        if let categoryInitial = unionisedModule.moduleCategory, unionisedModule.moduleType == .QuadrantIII {
                            permuationConfig.QIII = categoryInitial
                        }
                        if let categoryInitial = unionisedModule.moduleCategory, unionisedModule.moduleType == .QuadrantIV {
                            permuationConfig.QIV = categoryInitial
                        }
                        
                    }
                    
                        print(permuationConfig)
                    
                        try request.query.encode(permuationConfig)
                    
                        anchors[category.initial] = "./?" + request.http.url.query!
                    
                    } catch {
                        print("error: \(error).")
                    }
            

                })
                
            }
        
    }
    
}
