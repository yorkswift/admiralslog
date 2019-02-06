import Leaf
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
    try services.register(LeafProvider())
    
    //custom tags
    
    services.register { container -> LeafTagConfig in
        var config = LeafTagConfig.default()
        config.use(CreateAnchorTag(), as: "createAnchor")
        return config
    }
    
//    services.register { container -> LeafTagConfig in
//        var config = LeafTagConfig.default()
//        config.use(Raw(), as: "raw")   // #raw(<myVar>) to print it as raw html in leaf vars
//        return config
//    }

    let http = try HttpKernel()
    services.register(http.routes, as: Router.self)
    
    /// Use Leaf for rendering views
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
}
