//
//  Items.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 5. 15..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import Foundation


struct ItemInfo {
    var itemName: String
    var itemImage: String
    var price: Int
    var detailImage: [String]
    var size: SizeInfo
    var user: UserInfo
}

struct UserInfo {
    var userName: String
    var userImage: String?
}

struct SizeInfo {
    var w, d, h: Int
}

class Couch {
    static let shared = Couch()
    
    var items: [ItemInfo]
    
    func addItem(_ item: ItemInfo) {
        items.append(item)
    }
    
    init() {
        items = [
            ItemInfo(itemName: "ÄLEBY", itemImage: "aleby", price: 34000,
                     detailImage: ["aleby_1", "aleby_2", "aleby_3", "aleby_4", "aleby_5", "aleby_6", "aleby_7"],
                     size: SizeInfo(w: 86, d: 88, h: 101),
                     user: UserInfo(userName: "미나", userImage:"mina")),
            ItemInfo(itemName: "BROMMÖ", itemImage: "brommo", price: 8000,
                     detailImage: ["brommo_1", "brommo_2", "brommo_3", "brommo_4", "abrommo_5"],
                     size: SizeInfo(w: 48, d: 92, h: 89),
                     user: UserInfo(userName: "사나", userImage:"sana")),
            ItemInfo(itemName: "EKEDALEN", itemImage: "ekedalen", price: 6000,
                     detailImage: ["ekedalen_1", "ekedalen_2", "ekedalen_3", "ekedalen_4", "ekedalen_5"],
                     size: SizeInfo(w: 43, d: 51, h: 95),
                     user: UserInfo(userName: "채영", userImage:"chaeyoung")),
            ItemInfo(itemName: "HATTEFJÄLL", itemImage: "hattefjall", price: 23000,
                     detailImage: ["hattefjall_1", "hattefjall_2", "hattefjall_3", "hattefjall_4", "hattefjall_5"],
                     size: SizeInfo(w: 68, d: 68, h: 110),
                     user: UserInfo(userName: "정연", userImage:"jungyeon")),
            ItemInfo(itemName: "MARKUS", itemImage: "markus", price: 20000,
                     detailImage: ["markus_1", "markus_2", "markus_3", "markus_4", "markus_5", "markus_6", "markus_7"],
                     size: SizeInfo(w: 62, d: 60, h: 140),
                     user: UserInfo(userName: "지효", userImage:"jihyo")),
            ItemInfo(itemName: "MILLBERGET", itemImage: "millberget", price: 8000,
                     detailImage: ["millberget_1", "millberget_2", "millberget_3", "millberget_4", "millberget_5", "millberget_6"],
                     size: SizeInfo(w: 52, d: 65, h: 123),
                     user: UserInfo(userName: "미나", userImage:"mina")),
            ItemInfo(itemName: "NORDMYRA", itemImage: "nordmyra", price: 5000,
                     detailImage: ["nordmyra_1", "nordmyra_2", "nordmyra_3"],
                     size: SizeInfo(w: 45, d: 48, h: 80),
                     user: UserInfo(userName: "모모", userImage:"momo")),
            ItemInfo(itemName: "NORRÅKER", itemImage: "norraker", price: 8000,
                     detailImage: ["norraker_1", "norraker_2", "norraker_3", "norraker_4", "norraker_5", "norraker_6"],
                     size: SizeInfo(w: 41, d: 50, h: 81),
                     user: UserInfo(userName: "나연", userImage:"nayeon")),
            ItemInfo(itemName: "TUNHOLMEN", itemImage: "tunholmen", price: 8000,
                     detailImage: ["tunholmen_1", "tunholmen_2", "tunholmen_3", "tunholmen_4", "tunholmen_5"],
                     size: SizeInfo(w: 55, d: 55, h: 78),
                     user: UserInfo(userName: "쯔위", userImage:"tzuyu")),
            ItemInfo(itemName: "YPPERLIG", itemImage: "ypperlig", price: 8000,
                     detailImage: ["ypperlig_1", "ypperlig_2", "ypperlig_3", "ypperlig_4", "ypperlig_5", "ypperlig_6", "ypperlig_7"],
                     size: SizeInfo(w: 55, d: 51, h: 83),
                     user: UserInfo(userName: "사나", userImage:"sana")),
            ]
    }
}
