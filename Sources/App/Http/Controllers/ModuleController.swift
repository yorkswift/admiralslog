
import Vapor

//struct ScalableVectorGraphic : View {
//
//}

class ModuleController : RouteCollection {
    
   
    
    func boot(router: Router) throws {
        
        let moduleImageRoutes = router.grouped("modules")
        moduleImageRoutes.get("centre.svg",use: getCentreModuleImageHandler)
      
    }
        
    func getCentreModuleImageHandler(_ req: Request) throws -> Future<View> {
        let view = try req.view()
    
        return view.render("Modules/Centre", ["tint": "cyan"])

    }
    
}
