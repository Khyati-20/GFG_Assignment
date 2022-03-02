

import Foundation
import Alamofire

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}

class Service: ObservableObject  {
    
    var results : Array<Item> = []
    let cache = URLCache()
    
    
    init() {
        updateNews()
    }
    
    func getNews (url: URL, completionHandler: @escaping (Data?) -> ()) {
        let urlRequest = URLRequest(url: url)
        // First try to fetching cached data if exist
        if let cachedData = cache.cachedResponse(for: urlRequest) {
            print("Cached data in bytes:", cachedData.data)
            completionHandler(cachedData.data)
        }
        else if(Connectivity.isConnectedToInternet)
        {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                let cachedData = CachedURLResponse(response: response!, data: data)
                self.cache.storeCachedResponse(cachedData, for: urlRequest)
                completionHandler(cachedData.data)
            }.resume()
        }
        else {
            print("Error connecting server!")
        }
    }
    
    func updateNews() {
        
        let url = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml")!
        getNews(url: url){ result in
            let news = try! JSONDecoder().decode( Article.self, from: result!)
            let article = news
            self.results = article.items
        }
    }
}




