//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Konstantinos Rizos on 4/8/22.
//

import SwiftUI

struct TransactionList: View {
	@EnvironmentObject var transactionListViewModel: TransactionListViewModel
	
    var body: some View {
		VStack {
			List {
				ForEach(Array(transactionListViewModel.groupTransactionsByMonth()), id: \.key) { month, transactions in
					Section {
						ForEach(transactions) { transaction in
							TransactionRow(transaction: transaction)
						}
					} header: {
						Text(month)
					}
					.listSectionSeparator(.hidden)
				}
			}
			.listStyle(.plain)
		}
		.navigationTitle("Transactions")
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
	static let transactionListViewModel: TransactionListViewModel = {
		let transactionListViewModel = TransactionListViewModel()
		transactionListViewModel.transactions = transactionListPreviewData
		return transactionListViewModel
	}()
	
    static var previews: some View {
		Group {
			NavigationView {
				TransactionList()
			}
			NavigationView {
				TransactionList()
					.preferredColorScheme(.dark)
			}
		}
		.environmentObject(transactionListViewModel)
    }
}
