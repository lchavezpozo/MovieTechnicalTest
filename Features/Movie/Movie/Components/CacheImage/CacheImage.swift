//
//  CacheImage.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import UIKit

class CacheImage {
    static var shared = CacheImage()
    private let cache = NSCache<NSString, NSData>()
    private let configuration = URLSessionConfiguration.default
    func downloadImage(url: URL, handler: @escaping(Data?, Error?) -> Void){
        let cacheID = NSString(string: url.absoluteString)
        
        if let cachedData = cache.object(forKey: cacheID) {
            handler((cachedData as Data), nil)
        }else{

                let session = URLSession(configuration:configuration)
                var request = URLRequest(url: url)
                request.cachePolicy = .returnCacheDataElseLoad
                request.httpMethod = "get"
                session.dataTask(with: request) { [weak self]  (data, response, error) in
                    if let _data = data {
                        self?.cache.setObject(_data as NSData, forKey: cacheID)
                        handler(_data, nil)
                    }else{
                        handler(nil, error)
                    }
                }.resume()
        }
    }
}

extension UIImageView {
    
    func downloadImage(url: URL){
        let cacheImage = CacheImage.shared
        cacheImage.downloadImage(url: url) { [weak self] data, error in
            if let data = data {
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            }
        }
    }
}
