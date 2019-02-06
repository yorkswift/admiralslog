
import Foundation
import Vapor


struct ModulePermuation : Encodable {
    
    var moduleInitial : String
    var template : String
    var colourHex : String
    var needsCategory : Bool
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
                
                var categoryAnchors = [String:String]()
         
                if(module.moduleType != .Centre){
                    
                    categoryAnchors = station.categories.reduce(into: [:]) {
                    
                        (anchors,category) in
                    
                            anchors[category.initial] = "#"
                    
                    do {
                        
                        let permuation: Set<SpaceStationModule> = [SpaceStationModule(module.moduleType, category: category)]
                        
                        let unionised = permuation.union(station.moduleSet)
                        
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
                        
                        
                        
                        try request.query.encode(permuationConfig)
                        
                        if let queryString = request.http.url.query {
                            
                            anchors[category.initial] = "./?" + queryString
                            
                        }
                        
                    } catch {
                        print("error: \(error).")
                    }
                    
                    
                }
                }
                
                return ModulePermuation(
                        moduleInitial: module.moduleType.initial,
                        template: "Modules/" + module.moduleType.rawValue,
                        colourHex : module.colourHex,
                        needsCategory : module.needsCategory,
                        anchors : categoryAnchors)
                
            }
        
    }
    
}
