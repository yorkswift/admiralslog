import Vapor

class HttpKernel {
    
    var routes = EngineRouter.default()
    
    init() throws {
        
        try defaultRoutes()
        
    }
    
    public func defaultRoutes() throws {
        
        let logController = LogController()
        try routes.register(collection: logController)
        
    }

}
