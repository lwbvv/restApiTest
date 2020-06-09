//import Alamofire
//
//enum ApiRouter: URLRequestConvertible {
//
//    //case명명 method + resource
//    //method - read, create, update, destroy
//    //ex readPosts or readPost, createPost ???
//
//    // MARK: - Common
//
//    case readNews(language: String)
//
//    //MARK: - URLRequestConvertible
//    func asURLRequest() throws -> URLRequest {
//
//        let url = try Constants.baseUrl.asURL()
//
//        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
//
//        //Http method
//        urlRequest.httpMethod = method.rawValue
//
//        // Common Headers
//        switch method {
//        case .get:
//            urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
//        default:
//            urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
//        }
//
//        // Encoding
//        let encoding: ParameterEncoding = {
//            switch method {
//            case .get:
//                return URLEncoding.default
//            default:
//                return JSONEncoding.default
//            }
//        }()
//
//        print("\(method) -> url = \(urlRequest)")
//
//        if let parameters = parameters {
//            print("parameters = \(parameters)")
//        }
//
//        return try encoding.encode(urlRequest, with: parameters)
//    }
//
//    //MARK: - HttpMethod
//    private var method: HTTPMethod {
//        switch self {
//        case .readNews:
//            return .get
//        default:
//            return .get
//        }
//    }
//
//    //MARK: - Path
//    //The path is the part following the base url
//    private var path: String {
//        switch self {
//        case .readNews:
//            return "/v1/app/news" //나중에 바꾸자
//        }
//    }
//
//    //MARK: - Parameterse
//    var parameters: Parameters? {
//        switch self {
//        case .readNews(let language):
//            return [Constants.Parameters.language: language]
//        default:
//            return nil
//        }
//    }
//}
