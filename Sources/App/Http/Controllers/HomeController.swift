
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
            var options :LoadOptions
        }
        
        struct LoadOptions: Content {
            var skip: Bool?
        }
        
         var loadOptions = LoadOptions(skip: false)
        
        do{
            loadOptions = try req.query.decode(LoadOptions.self)
            
            if(loadOptions.skip == nil){ loadOptions.skip = false }
            
        } catch {
           print("error")
        }
        
        print(loadOptions)
        
        let stationConfig = try req.query.decode(SpaceStationConfiguration.self)
        
        let station = SpaceStation(stationConfig)
        
        let permutations = ModuleTypePermutations.shared.modulePermutationsFor(station: station, request: req)
    
        let view = try req.view()
        
        return view.render("moduleSelector", ModuleSelectorContext(station: station, permutations: permutations, options: loadOptions ))
    }
    
    func getLogHandler(_ req: Request) throws -> Future<View> {
        
        struct LogContext : Encodable {
            var station : SpaceStation
            var logNumber : Float
            var cdn : String
            var bitmapGraphics : [String]
            var customTemplates : [String]
        }
        
        let stationConfig = try req.query.decode(SpaceStationConfiguration.self)
        
        let station = SpaceStation(stationConfig)
        
        if(!station.isComplete){
            return try getModuleSelectorHandler(req)
        }
        
        let logNumber = Float.random(in: 234234..<999999)
        
        let view = try req.view()
        
        let graphics = GraphicsRepository.shared
        let templates = TemplateRepository.shared
        
        return view.render("log", LogContext(
                station: station,
                logNumber: logNumber,
                cdn: graphics.cdn,
                bitmapGraphics: graphics.bitmap,
                customTemplates : templates.customLayout
                ))
    }
    
}
