//
//  MealHeaderView.swift
//  meals
//
//  Created by Paul C on 11/14/23.
//

import SwiftUI

struct mealHeaderView: View {
    var meal: Meal
    var body: some View {
        
        ZStack{
            AsyncImage(url: URL(string: meal.strMealThumb))
            { phase in
                if let image = phase.image {
                    image  .resizable()
                        .scaledToFit()
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        .padding(.vertical, 20)
                }
            }
            
          
              
        }
        .frame(height: 440)
    }
}

//#Preview {
//    
//}
