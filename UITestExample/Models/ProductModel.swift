//
//  ProductModel.swift
//  UITestExample
//
//  Created by hm kim on 2021/11/14.
//

import Foundation

struct ProductModel: Codable {
    let id: Int
    let name: String
    let brandName: String
    let priceInfo: String
    let rank: Int
    let adPurchaseId: Int
}
