
import Vapor

class HomeController : RouteCollection {
    
    func boot(router: Router) throws {
        
        router.get(use: getHomeHandler)
        
    }
        
    func getHomeHandler(_ req: Request) throws -> Future<View> {
        
       let stationConfig = try req.query.decode(SpaceStationConfiguration.self)

        let station = SpaceStation(stationConfig)
    
        let view = try req.view()
        
        return view.render("welcome", ["station": station])
       
    }
    
}
