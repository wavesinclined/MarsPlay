//
//  APIClient.swift
//  MarsPlay
//
//  Created by alice singh on 4/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import Foundation
import PromiseKit

enum APIErrors: Error {
    case invalidURL
    case parsingError
    case unknown
    case authentication
}

let APIKey = "eeefc96f"

class OMDBClient {
    class func moviesGET(_ search: String,_ page: Int) -> Promise<MovieResponse> {
        return firstly {
            URLSession.shared.dataTask(.promise, with: try makeUrl(search, page)).validate()
        }.map {
            try JSONDecoder().decode(MovieResponse.self, from: $0.data)
        }
    }
    
    class func makeUrl(_ search: String, _ page: Int) throws -> URL {
        var compo = URLComponents()
        compo.scheme = "http"
        compo.host = "www.omdbapi.com"
        let querySearchString = URLQueryItem(name: "s", value: search)
        let queryPage = URLQueryItem(name: "page", value: String(page))
        let queryApiKey = URLQueryItem(name: "apikey", value: APIKey)
        compo.queryItems = [queryApiKey, queryPage, querySearchString]
        
        guard let url = compo.url else { throw APIErrors.invalidURL }
        return url
    }
}
