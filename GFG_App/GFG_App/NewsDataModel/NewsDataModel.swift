
import Foundation

struct Feed :   Decodable  {
    
    let url : String
    let title : String
    let link : String
    let author : String
    let description : String
    let image : String
}

struct Enclosure : Decodable{
    let link : String
    let type : String
    let thumbnail : String
}

struct Item :   Decodable  {
    
    let title : String
    let pubDate : String
    let link : String
    let guid : String
    let author : String
    let thumbnail : String
    let description : String
    let content : String
    let enclosure : Enclosure
    let categories : [String]
    
}


struct Article : Decodable  {
    let status : String
    let feed : Feed
    let items : [Item]
}
