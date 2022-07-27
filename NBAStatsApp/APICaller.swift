//
//  APICaller.swift
//  NBAStatsApp
//
//  Created by Stephen on 6/3/22.
//

import Foundation

//final class APICaller {
//    static let shared = APICaller()
//    
//    private struct Constants {
//        static let assetsEndpoint = "https://data.nba.net/10s/prod/v1/2021/players.json"
////        static let assetsEndpoint = "https://www.balldontlie.io/api/v1/players"
//    }
//    
//    private init() {}
//    
//    public func getAllNbaData(completion: @escaping (Result<Instruction, Error>) -> Void)
//    {
//        guard let url = URL(string: Constants.assetsEndpoint) else {
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//        guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let stats = try JSONDecoder().decode(Instruction.self, from: data)
//
//                    completion(.success(stats))
//            } 
//                    
//                catch {
//                    completion(.failure(error))
//                
//                }
//            }
//            task.resume()
//    }
//
//}
