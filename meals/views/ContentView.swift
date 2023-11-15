//
//  ContentView.swift
//  meals
//
//  Created by Paul C on 11/13/23.
//

import SwiftUI

struct ContentView: View {
   
    
    @State var isActive = false
    @ObservedObject var networkManager = NetworkManager()
    @EnvironmentObject var networkMonitor: NetworkMonitor

    var body: some View {
        
        ZStack{
            if !networkMonitor.isConnected{
                
             
                ContentUnavailableView(
                    "No Internet Connection",
                    systemImage: "wifi.exclamationmark",
                    description: Text("Please check your connection and try again.")
                )
            }
           else if self.isActive{
                
                
                NavigationView{
                    List {
                     

                        ForEach(networkManager.meals) { meal in
                            NavigationLink(destination: MealDetailView(meal:meal,networkManager:  networkManager)){
                                
                                MealCardRowView(meal: meal)
                                    .padding(.vertical, 4)
                                
                            }
                            
                        }
                    }
                    .navigationTitle("Meals")
                }
            }
           
            else{
                
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300).frame(maxWidth: .infinity, maxHeight: .infinity)
                        .accentColor(Color.black)
                        .background(Color(uiColor: UIColor(named: "logoColor")!))

                
            }
        }
        .onAppear {
            self.networkManager.fetchMealData()

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    self.isActive = true
            }
            networkManager.meals.sort { $0.strMeal < $1.strMeal }

    }.navigationViewStyle(.stack)
    }
}

#Preview {
   // @StateObject var networkMonitor = NetworkMonitor()

    ContentView().environmentObject(NetworkMonitor())
}


