//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Konstantinos Rizos on 25/7/22.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
	
	var dateParsed: Date {
		date.dateParsed()
	}
	
	var signedAmount: Double {
		return type == TransactionType.credit.rawValue ? amount : -amount
	}
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
	let id: Int
	let name: String
	let icon: FontAwesomeCode
	var mainCategoryId: Int?
}
