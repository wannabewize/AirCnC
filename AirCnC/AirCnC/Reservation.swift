//
//  Reservation.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 5. 7..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import Foundation


struct ReserveInfo {
    var item: ItemInfo
    var date: Date
}

class Reservation {
    static let shared = Reservation()
    
    var reserves: [ReserveInfo] = []
    
    func addReservation(_ item: ItemInfo, date : Date) {
        reserves.append( ReserveInfo(item: item, date: date) )
    }
}
