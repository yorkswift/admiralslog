
import Vapor

class ModuleController : RouteCollection {
    
    func boot(router: Router) throws {
        
        let moduleImageRoutes = router.grouped("modules")
        moduleImageRoutes.get("centre",use: getCentreModuleImageHandler)
      
    }
        
    func getCentreModuleImageHandler(_ req: Request) throws -> Future<View> {
         
         return try req.view().render("Modules/Centre", ["tint": "cyan"])

    }
    
}
