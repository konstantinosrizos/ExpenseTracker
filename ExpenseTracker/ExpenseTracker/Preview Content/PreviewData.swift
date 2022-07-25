//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Konstantinos Rizos on 25/7/22.
//

import Foundation

var transactionPreviewData = Transaction(
    id: 1,
    date: "01/24/2022",
    institution: "ClearScore",
    account: "Visa ClearScore",
    merchant: "Apple",
    amount: 11.45,
    type: "debit",
    categoryId: 801,
    category: "Software",
    isPending: false,
    isTransfer: false,
    isExpense: true,
    isEdited: false
)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
