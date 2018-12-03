
import Vapor

class HomeController : RouteCollection {
    
    func boot(router: Router) throws {
        
        router.get(use: getHomeHandler)
        
    }
        
    func getHomeHandler(_ req: Request) throws -> Future<View> {
        
        let station = SpaceStation()
        //
        return try req.view().render("welcome",['tint','blue'] )

    }
    
}
