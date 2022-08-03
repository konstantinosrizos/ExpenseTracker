//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Konstantinos Rizos on 24/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
					
					RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
	static let transactionListViewModel: TransactionListViewModel = {
		let transactionListViewModel = TransactionListViewModel()
		transactionListViewModel.transactions = transactionListPreviewData
		return transactionListViewModel
	}()
	
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
		.environmentObject(transactionListViewModel)
    }
}
