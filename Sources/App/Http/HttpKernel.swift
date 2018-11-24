import Vapor

class HttpKernel {
    
    var routes = EngineRouter.default()
    
    init() throws {
        
        try defaultRoutes()
        
    }
    
    public func defaultRoutes() throws {
        
        let homeController = HomeController()
        try routes.register(collection: homeController)

        let moduleController = ModuleController()
        try routes.register(collection: moduleController)
        
    }

}
