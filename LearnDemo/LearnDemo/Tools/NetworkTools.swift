//
//  NetworkTools.swift
//  AFNetworking的封装
//
//  Created by Apple on 2020/2/26.
//  Copyright © 2020 Insight. All rights reserved.
//

import AFNetworking

enum Request_Method_Type : String {
    case GET = "GET"
    case POST = "POST"
}

class NetWorkTools: AFHTTPSessionManager {
    //let线程安全
    static let shareInstance : NetWorkTools =  {
        let tools = NetWorkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return tools
    }()
}
//
//// MARK:- 封装请求方法
extension NetWorkTools {
    func request(methodType : Request_Method_Type, usrlString : String, parameters : [String : Any], finished : ((_ result : Any?, _ error : Error?) ->Void)?) {
        
        let successa = { (task : URLSessionDataTask, resulta : Any) in
            finished!(resulta,nil)
        }
        
        let failurea =  { (task : URLSessionDataTask?, errora : Error) in
            finished!(nil, errora)
        }
    
        
        if methodType == .GET {
            
            get(usrlString, parameters: usrlString, success: successa, failure: failurea)
            
        }else {
            
            post(usrlString, parameters: parameters, success: successa, failure:failurea)
            
        }
    }
        
}
