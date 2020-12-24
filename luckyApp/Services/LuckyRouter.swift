//
//  LuckyRouter.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 23/12/2020.
//

import Alamofire

enum LuckyRouter: URLRequestConvertible {
    case offers
    private struct Constant {
        static let baseURL = "https://www.nasable.com/luckytest/api"
    }
    
    // MARK: Router Protocol
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest: URLRequest
        
        // path
        let url = URL(string: Constant.baseURL + self.path)
        urlRequest = URLRequest(url: url!)
        
        // headers
        for header in self.headers {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        // HTTPMethod
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}

// MARK: - TucanoRouter - path

extension LuckyRouter {
    var path: String {
        switch self {
        case .offers:
            return "/offers"
        }
    }
}

// MARK: - TucanoRouter - parameters

extension LuckyRouter {
    
    var parameters: [String: Any] {
        switch self {
        case .offers:
            return [:]
        }
    }
}

// MARK: - TucanoRouter - headers

extension LuckyRouter {
    
    var headers: [String: String] {
        switch self {
        case .offers:
            return [:]
        }
    }
}

// MARK: - TucanoRouter - HTTPMethod

extension LuckyRouter {
    var method: HTTPMethod {
        switch self {
        case .offers:
            return .get
        }
    }
}

// MARK: - TucanoRouter - parameter encoding

extension LuckyRouter {
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .offers:
            return URLEncoding.default
        }
    }
}
