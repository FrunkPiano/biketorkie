//  moya的一个具体的接口实现

import Foundation
import Moya

enum  DMAPI {
    case register(user: AppUser) // 注册
    case login(account: String, password: String) // 登录
}

// 补全【MoyaConfig 3：配置TargetType协议可以一次性处理的参数】中没有处理的参数
extension DMAPI: TargetType {
    //1. 每个接口的相对路径
    //请求时的绝对路径是   baseURL + path
    var path: String {
        switch self {
        case .register:
            return "register.do"
        case .login:
            return "loginbypwd.do?phone=1111&password=123456"
        }
    }

    //2. 每个接口要使用的请求方式
    var method: Moya.Method {
        switch self {
        case .register:
            return .put
        case .login:
            return .post
        }
    }

    //3. Task是一个枚举值，根据后台需要的数据，选择不同的http task。
    var task: Task {
        var params: [String: Any] = [:]
        switch self {
        case .register(let appUser):
            params = ["UserBean": appUser]
        case .login(let phone, let password):
//            params["phone"] = phone
//            params["password"] = password
            return .requestPlain
//        case .rankList:
//            return .requestPlain
//        case let .other1(param):
//            params["param"] = param
        default:
            //不需要传参数的接口走这里
            return .requestPlain
        }
//        let str: String = "{\"phone\":\"1111\",\"password\":\"123456\",\"username\":\"millow\",\"sex\":1,\"age\":8}"
//        let data = str.data(using: String.Encoding.utf8)!
//        return .requestData(data)
//        return .requestJSONEncodable()
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
}
