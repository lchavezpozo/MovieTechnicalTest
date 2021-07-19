//
//  TheMovieNetworkingServiceAdapterMoya.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation
import Moya

class TheMovieNetworkingServiceMoya: TheMovieNetworkingService {
    
    private lazy var provider: MoyaProvider<TheMovieAPI> = {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        let provider = MoyaProvider<TheMovieAPI>(plugins: [networkLogger])
        return provider
    }()
    
    func request<Model>(target: TheMovieAPI, completion: @escaping ((Result<Model, Error>) -> Void)) where Model : Decodable {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(Model.self, from: response.data)
                    completion(.success(model))
                } catch (let errorDecoder) {
                    completion(.failure(errorDecoder))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}

extension TheMovieAPI: TargetType {

    public var method: Moya.Method {
        switch self {
        case .movie(let resource): return Moya.Method.mapTo(method: resource.method)
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .movie(.popular(let parameters)),
             .movie(.rated(let parameters)),
             .movie(.upcomming(let parameters)),
             .movie(.trailers(let parameters)):
            var parametersExtra = parameters
            parametersExtra["api_key"] = "ddda56592c20e8a6da52fc5d3dd4bd7b"
            return .requestParameters(parameters: parametersExtra, encoding: URLEncoding.queryString)
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

extension Moya.Method {

    static func mapTo(method: Method)-> Moya.Method {
        switch method {
        case  .get: return Moya.Method.get
        case .post: return  Moya.Method.post
        }
    }
}

