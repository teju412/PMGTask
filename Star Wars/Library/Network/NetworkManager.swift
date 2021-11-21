//
//  NetworkManager.swift
//  Star Wars
//
//  Created by TejaDanasvi on 19/11/21.
//

import Foundation
import Alamofire
import PromiseKit

struct NetworkManager {
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        return Session(configuration: configuration)
    }()
    
    static func request<T: Codable>(url: String, method: HTTPMethod) -> Promise<T> {
        return Promise<T> { seal in
            NetworkManager.session.request(url, method: method).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success:
                    guard let json = response.data else { return }
                    do {
                        let data = try JSONDecoder().decode(T.self, from: json)
                        seal.fulfill(data)
                    } catch (let error) {
                        seal.reject(error)
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}
