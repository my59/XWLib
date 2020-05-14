//
//  DateExt.swift
//  PQPen
//
//  Created by Youzige on 2020/1/15.
//  Copyright © 2020 Ningqu. All rights reserved.
//

import UIKit


extension DateFormatter {
    convenience init(format: String) {
        self.init()
        dateFormat = format
    }
}

extension Date {
    
    static let fullDateFormatter = DateFormatter(format: "yyyy-MM-dd HH:mm:ss")
    
    static let dateFormat = DateFormatter(format: "MM-dd HH:mm")
    
    /// 格式为：yyyy-MM-dd HH:mm:ss
    var fullDateString: String {
        return Date.fullDateFormatter.string(from: self)
    }
    
    /// 格式为：MM-dd HH:mm
    var dateString: String {
        return Date.dateFormat.string(from: self)
    }
    
    init(stamp13: Int64) {
        let time = TimeInterval(stamp13 / 1000)
        self.init(timeIntervalSince1970: time)
    }
    
    init(stamp: Int64) {
        var time = stamp
        while (time / 10 ^ 11) > 0 {
            time /= 10
        }
        self.init(timeIntervalSince1970: TimeInterval(time))
    }
}
