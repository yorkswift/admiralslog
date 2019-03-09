
import Vapor

class LogController : RouteCollection {
    
    func boot(router: Router) throws {
        
        router.get(use: getModuleSelectorHandler)
        router.get("log", use: getLogHandler)
        
    }
        
    func getModuleSelectorHandler(_ req: Request) throws -> Future<View> {
        
        struct ModuleSelectorContext : Encodable {
           var station : SpaceStation
           var permutations : [ModulePermuation]
           var showIntro : Bool
            var audio: String
        }
        
        struct LoadOptions: Content {
            var skip: Bool?
        }
        
        var loadOptions = LoadOptions(skip: false)
        var showIntro = true
        
        do {
            
            loadOptions = try req.query.decode(LoadOptions.self)
            
            if let skip = loadOptions.skip  {
                showIntro = !skip
            }
            
            
        } catch {
            
           print("error decoding params")
        
        }
        
        let stationConfig = try req.query.decode(SpaceStationConfiguration.self)
        
        let station = SpaceStation(stationConfig)
        
        if(station.completedModules > 0){
            showIntro = false
        }
        
        let permutations = ModuleTypePermutations.shared.modulePermutationsFor(station: station, request: req)
        
        let audios = AudioRepository.shared
    
        let view = try req.view()
        
        return view.render("moduleSelector", ModuleSelectorContext(station: station, permutations: permutations, showIntro: showIntro, audio: audios.urlForAudio(with:"INTRO") ?? "" ))
    }
    
    func getLogHandler(_ req: Request) throws -> Future<View> {
        
        struct LogContext : Encodable {
            var station : SpaceStation
            var logNumber : Float
            var cdn : String
            var bitmapGraphics : [String]
            var customTemplates : [String]
            var audio: String
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
        
        let audios = AudioRepository.shared
        
        return view.render("log", LogContext(
                station: station,
                logNumber: logNumber,
                cdn: graphics.cdn,
                bitmapGraphics: graphics.bitmap,
                customTemplates : templates.customLayout,
                audio: audios.urlForAudio(with: station.initials) ?? ""
                ))
    }
    
}
