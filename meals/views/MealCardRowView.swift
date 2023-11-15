//
//  MealCardRowView.swift
//  meals
//
//  Created by Paul C on 11/14/23.
//

import SwiftUI
import Kingfisher
struct MealCardRowView: View {
    
    var meal: Meal

    var body: some View {
       

        HStack{
           
            KFImage(URL(string: meal.strMealThumb)!).renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .cornerRadius(8)
            
                VStack(alignment: .leading, spacing: 5){
                    
                    Text(meal.strMeal)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    
                }
            
        }
    }
                
}

// #Preview{
//   
//    }


