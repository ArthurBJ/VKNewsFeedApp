//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Артур Байбиков on 07.09.2023.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
