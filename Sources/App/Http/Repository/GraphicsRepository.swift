
import Foundation

class GraphicsRepository {
    
    static let shared = GraphicsRepository()
    
    let cdn = "images/"
    let none = ["AADE","AARR","AEEI","DDDD","DDII","DEEI","RRRR"]
    let bitmap  = ["DDIR","ADRR"]
    let multi = [
                "DEII":["DEII_01","DEII_02","DEII_03"],
                "DIRR":["DIRR_01","DIRR_02","DIRR_03","DIRR_04","DIRR_05"]
                ] 
}
