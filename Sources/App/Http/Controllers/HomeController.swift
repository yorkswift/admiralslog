
import Vapor


//struct SpaceStationConfiguration: Content {
//    var T : ModuleCategory?
//    var L : ModuleCategory?
//    var R : ModuleCategory?
//    var B : ModuleCategory?
//}


class HomeController : RouteCollection {
    
    func boot(router: Router) throws {
        
        router.get(use: getHomeHandler)
        
    }
        
    func getHomeHandler(_ req: Request) throws -> Future<View> {
        
//        let station = req.query.decode(SpaceStation.self)
        
        let station = SpaceStation()
    
        let view = try req.view()
        
        return view.render("welcome", ["station": station])
       
    }
    
}
