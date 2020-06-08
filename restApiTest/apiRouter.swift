import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    // MARK: - Common
    case showNews(language: String)
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        //string url로 바꿔주는
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        switch method {
        case .get:
            urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        default:
            urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        }
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        print("\(method) -> url = \(urlRequest)")
        
        if let parameters = parameters {
            print("parameters = \(parameters)")
        }
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    //MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self {
        case .showNews:
            return .get
        default:
            return .get
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
        case .showNews:
            return "/v1/app/news" //나중에 바꾸자
        }
    }
    
    //MARK: - Parameterse
    var parameters: Parameters? {
        switch self {
        case .showNews(let password):
            return [Constants.Parameters.language: password]
        default:
            return nil
        }
    }
}
