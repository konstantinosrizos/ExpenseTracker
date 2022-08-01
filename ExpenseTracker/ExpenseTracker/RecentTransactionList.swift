//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Konstantinos Rizos on 1/8/22.
//

import SwiftUI

struct RecentTransactionList: View {
	@EnvironmentObject var transactionListViewModel: TransactionListViewModel
	
    var body: some View {
		VStack {
			HStack {
				Text("Recent Transactions")
					.bold()
				
				Spacer()
				
				NavigationLink {
					
				} label: {
					HStack(spacing: 4) {
						Text("See All")
						Image(systemName: "chevron.right")
					}
					.foregroundColor(Color.text)
				}
			}
			.padding(.top)
			
			ForEach(Array(transactionListViewModel.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
				TransactionRow(transaction: transaction)
				
				Divider()
					.opacity(index == 4 ? 0 : 1)
			}
		}
		.padding()
		.background(Color.background)
		.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
		.shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
	static let transactionListViewModel: TransactionListViewModel = {
		let transactionListViewModel = TransactionListViewModel()
		transactionListViewModel.transactions = transactionListPreviewData
		return transactionListViewModel
	}()
	
    static var previews: some View {
		Group {
			RecentTransactionList()
			RecentTransactionList()
				.preferredColorScheme(.dark)
		}
		.environmentObject(transactionListViewModel)
    }
}
