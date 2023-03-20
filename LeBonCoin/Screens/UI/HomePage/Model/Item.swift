//
//  Item.swift
//  LeBonCoin
//
//  Created by Younup on 20/03/2023.
//

import Foundation

fileprivate enum ItemCodingKeys: String, CodingKey {
    case id
    case categoryId = "category_id"
    case title
    case description
    case price
    case imagesUrl = "images_url"
    case isUrgent = "is_urgent"
    case creationDate = "creation_date"

}

public protocol ItemProtocol: Codable {
    func getId() -> Int
    func getCategoryId() -> Int
    func getTitle() -> String
    func getDescription() -> String
    func getPrice() -> Float
    func getLargeImageUrl() -> String?
    func getSmallImageUrl() -> String?
    func getCreationDate() -> Date?
    func isUrgent() -> Bool

    init(id: Int,
         title: String,
         description: String,
         catId: Int,
         price: Float,
         largeImage: String,
         smallImage: String,
         creationDate: Date,
         isUrgent: Bool )
}


class Item: Codable {

    private var id: Int?
    private var categoryId: Int?
    private var title: String?
    private var description: String?
    private var price: Float?
    private var imagesUrl :[String:String]?
    private var largeImage : String?
    private var smallImage: String?
    private var creation_date: String?
    private var urgent: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case categoryId = "category_id"
        case title
        case description
        case price
        case imagesUrl = "images_url"
        case urgent = "is_urgent"
    }

    public func getId() -> Int {
        return id ?? -1
    }

    public func getCategoryId() -> Int {
        return categoryId ?? -1
    }

    public func getTitle() -> String {
        return title ?? ""
    }

    public func getDescription() -> String {
        return description ?? ""
    }

    public func getPrice() -> Float {
        return price ?? 0.0
    }

    public func getLargeImageUrl() -> String? {
        return largeImage ?? ""
    }

    public func getSmallImageUrl() -> String? {
        return smallImage ?? ""
    }

    public func getCreationDate() -> String? {
        return creation_date ?? ""
    }

    public func isUrgent() -> Bool {
        return urgent ?? false
    }



}
