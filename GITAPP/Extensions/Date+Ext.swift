//
//  Date+Ext.swift
//  GITAPP
//
//  Created by Yareni Grajales Mérida on 14/10/24.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}
