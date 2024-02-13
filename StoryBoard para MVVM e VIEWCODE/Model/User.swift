//
//  Pessoa.swift
//  StoryBoard para MVVM e VIEWCODE
//
//  Created by Jeferson Dias dos Santos on 19/02/23.
//

import Foundation
import UIKit

struct UserResult: Codable{
    var group:[User]
}

struct User: Codable {
    var name: String
    var age: Int
    var profession: String
    var salary: String
    var imageUser: String
    var isEnableHeart: Bool
    var identifier: Int
}
