//
//  Service.swift
//  StoryBoard para MVVM e VIEWCODE
//
//  Created by Rafaella Rodrigues Santos on 13/02/24.
//

import UIKit

protocol GenericService: AnyObject{
    typealias completion<T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error{
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
}




protocol ServiceDelegate: GenericService{
    func getUserFromJson(fromFileNamed name:String, completion: @escaping completion<UserResult?>)
    
}

class Service: ServiceDelegate {
    
    func getUserFromJson(fromFileNamed name: String, completion: @escaping completion<UserResult?>) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {return completion(nil, Error.fileNotFound(name: name))}
        
        do {
           let data = try Data(contentsOf: url)
            let user = try JSONDecoder().decode(UserResult.self,from: data)
            completion(user,nil)
            
        } catch  {
            completion(nil,Error.fileDecodingFailed(name: name, error))
        }
    }
    

}
