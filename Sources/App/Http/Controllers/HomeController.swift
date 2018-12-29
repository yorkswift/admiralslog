
import Vapor

class HomeController : RouteCollection {
    
    func boot(router: Router) throws {
        
        router.get(use: getHomeHandler)
        
    }
        
    func getHomeHandler(_ req: Request) throws -> Future<View> {
        
        let station = SpaceStation()
    
        let view = try req.view()
        
        return view.render("welcome", ["station": station])
       
    }
    
}
