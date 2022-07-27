//
//  NetworkManager.swift
//  NBAStatsApp
//
//  Created by Stephen on 6/6/22.
//

import Foundation
import UIKit


class NetworkManager {
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
    
extension NetworkManager {
    

final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let assetsEndpoint = "https://data.nba.net/10s/prod/v1/2021/players.json"
        static let teamsEndpoint = "https://data.nba.net/10s/prod/v1/2021/teams.json"
    }
    
    private init() {}
    
    public func getAllNbaData(completion: @escaping (Result<Instruction, Error>) -> Void)
    {
        guard let url = URL(string: Constants.assetsEndpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
        guard let data = data, error == nil else {
                return
            }
            do {
                let stats = try JSONDecoder().decode(Instruction.self, from: data)

                    completion(.success(stats))
            }
                    
                catch {
                    completion(.failure(error))
                
                }
            }
            task.resume()
    }

}
    
func fetchImageData(id: String, completion: @escaping (Result<Data, Error>) -> Void) {
    
    guard let url = URL(string: "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/\(id).png") else {
        completion(.failure(NetworkError.badURL))
        return
    }
    print(url)
    
    self.session.dataTask(with: url) { data, response, error in
        
        if let error = error {
            completion(.failure(error))
            return
        }
        
        if let httpResponse = response as? HTTPURLResponse, !(200..<300).contains(httpResponse.statusCode) {
            completion(.failure(NetworkError.badServiceResponse(httpResponse.statusCode)))
            return
        }
        
        guard let data = data else {
            completion(.failure(NetworkError.badData))
            return
        }
        completion(.success(data))
        
    }.resume()
    
}
    private struct Constants {
        static let teamsEndpoint = "https://data.nba.net/10s/prod/v1/2021/teams.json"
    }
    
    public func getOtherNbaData(completion: @escaping (Result<League, Error>) -> Void)
    {
        guard let url = URL(string: Constants.teamsEndpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
        guard let data = data, error == nil else {
                return
            }
            do {
                let stats = try JSONDecoder().decode(League.self, from: data)

                    completion(.success(stats))
            }
                    
                catch {
                    completion(.failure(error))
                
                }
            }
            task.resume()
    }

}






