//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Konstantinos Rizos on 24/7/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
	@StateObject var transactionListViewModel = TransactionListViewModel()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(transactionListViewModel)
        }
    }
}
