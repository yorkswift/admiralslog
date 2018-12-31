import Vapor

final class CreateAnchorTag : TagRenderer {
    
    func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        
        return tag.container.future(.string("hello tag"))
    }
    
}
