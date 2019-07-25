//
//  Model.swift
//  RequestAPI
//
//  Created by Cuong on 7/24/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

struct User : Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
