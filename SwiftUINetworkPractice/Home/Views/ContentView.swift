//
//  ContentView.swift
//  SwiftUINetworkPractice
//
//  Created by Varun Adit on 1/19/24.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    List {
                        ForEach(homeVM.marketsData, id: \.id) { coin in
//                            Text(String(coin.ask ?? 0.0))
//                                .foregroundStyle(.black)
                            NavigationLink(destination: Text(String(coin.ask ?? 0.0))) {
                                Text(String(coin.ask ?? 0.0))
                                    .foregroundStyle(.black)
                            }
                            .accessibilityHint(Text("Will Navigate to Coin Details"))
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                
            }
            .navigationTitle("Coin Prices")
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background{
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
