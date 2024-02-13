//
//  ViewModel.swift
//  StoryBoard para MVVM e VIEWCODE
//
//  Created by Rafaella Rodrigues Santos on 11/02/24.
//

import UIKit

class ViewModel {
    
   private var listUser: [User] = []
    
    init(){
        self.configArrayUser()
    }
    
   private func configArrayUser(){
       listUser.append(User(name: "Caio", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: true, identifier: 0))
       listUser.append(User(name: "Fabricio", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 1))
       listUser.append(User(name: "Ge", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 2))
       listUser.append(User(name: "Rafaella", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 3))
       listUser.append(User(name: "André", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 4))
       listUser.append(User(name: "Silvio", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 5))
       listUser.append(User(name: "Thiago", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 6))
       listUser.append(User(name: "Caio", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: true, identifier: 7))
       listUser.append(User(name: "Fabricio", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 8))
       listUser.append(User(name: "Ge", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 9))
       listUser.append(User(name: "Rafaella", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 10))
       listUser.append(User(name: "André", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 11))
       listUser.append(User(name: "Silvio", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 12))
       listUser.append(User(name: "Thiago", age: 30, profession: "Dev Ios", salary: "20.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: false, identifier: 13))
    }
    
    public var numberOfRows:Int{
        return self.listUser.count
    }
    
    public func loadCurrentUser(indexPath: IndexPath) -> User{
        return self.listUser[indexPath.row]
    }
    
    public func getName(indexPath: IndexPath) -> String {
        return self.listUser[indexPath.row].name
    }
    
    public func exchangeHeartState (_ user: User){
        
        if let row = self.listUser.firstIndex(where: { user.identifier == $0.identifier}) {
            self.listUser[row] = user
        }
        
    }

}
