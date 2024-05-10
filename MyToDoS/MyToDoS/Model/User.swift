//
//  User.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 24/04/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
