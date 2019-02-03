
import Vapor

class HomeController : RouteCollection {
    
    func boot(router: Router) throws {
        
        router.get(use: getModuleSelectorHandler)
        router.get("log", use: getLogHandler)
        
    }
        
    func getModuleSelectorHandler(_ req: Request) throws -> Future<View> {
        
        struct ModuleSelectorContext : Encodable {
           var station : SpaceStation
           var permutations : [ModulePermuation]
        }
        
       let stationConfig = try req.query.decode(SpaceStationConfiguration.self)
        
        let station = SpaceStation(stationConfig)
        
        let permutations = ModuleTypePermutations.shared.modulePermutationsFor(station: station, request: req)
    
        let view = try req.view()
        
        return view.render("moduleSelector", ModuleSelectorContext(station: station, permutations: permutations))
    }
    
    func getLogHandler(_ req: Request) throws -> Future<View> {
        
        let stationConfig = try req.query.decode(SpaceStationConfiguration.self)
        
        let station = SpaceStation(stationConfig)
        
        let view = try req.view()
        
        return view.render("log", ["station": station])
    }
    
}
