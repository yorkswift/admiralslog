import Vapor

final class CreateAnchorTag : TagRenderer {
    
    func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        
        guard let moduleTypeRaw = tag.parameters[0].string else {
            print("type string failed")
            throw Abort.init(.badRequest)
        }
        
        guard let moduleType = ModuleType(rawValue: moduleTypeRaw) else {
            print("ModuleType failed")
            throw Abort.init(.badRequest)
        }
        
//        guard let moduleCategoryInitial = tag.parameters[1].string else {
//            print("cat string failed")
//            throw Abort.init(.badRequest)
//        }
//        
//        guard let ModuleCategory = ModuleCategory(rawValue: moduleCategoryInitial) else {
//            print("ModuleType failed")
//            throw Abort.init(.badRequest)
//        }
       
        return tag.container.future(.string(moduleType.initial))
    }
    
}
