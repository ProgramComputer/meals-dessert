//
//  MealDetailView.swift
//  meals
//
//  Created by Paul C on 11/14/23.
//




import SwiftUI

struct MealDetailView: View {
    @State var meal: Meal
    
    @ObservedObject var networkManager: NetworkManager
    var body: some View {

        NavigationView{
           // var detailMeal = networkManager.detailMeal[meal];

            ScrollView(.vertical, showsIndicators: false){
                
                    VStack(alignment: .center, spacing: 20.0){
                        mealHeaderView(meal: meal)
                        
                        VStack(alignment: .leading, spacing: 20.0) {
                            
                            Text(meal.strMeal)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            Text("Origin: " + (networkManager.detailMeal[meal]?.strArea ?? "" ))
                                   .font(.headline)
                                  .multilineTextAlignment(.leading)
                            MealIngredientView(detailMeal: networkManager.detailMeal[meal])
                            
                            Text("Instructions")
                                .fontWeight(.bold)
                            
                            Text(   networkManager.detailMeal[meal]?.strInstructions ?? "" )
                             .multilineTextAlignment(.leading)
                            
                        }
                        .padding(.horizontal, 20)
                        .frame(maxWidth: 640, alignment: .center)
                    }
                
                .navigationBarTitle(meal.strMeal, displayMode: .inline)
                .navigationBarHidden(true)
            }
        }.onAppear {
          
             networkManager.fetchDetailMeal(meal: meal)
          
        }
    }
}

//#Preview {
//    mealDetailView(meal: <#T##Meal#>)
//}
   
