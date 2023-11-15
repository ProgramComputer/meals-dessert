//
//  MealIngredientView.swift
//  meals
//
//  Created by Paul C on 11/14/23.
//

import SwiftUI

struct MealIngredientView: View {
        var detailMeal: DetailMeal?
        let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
        var body: some View {
            GroupBox(){
                
                DisclosureGroup("Ingredients"){
                    
                    ForEach(0..<(detailMeal?.strIngredients.count ?? 0), id: \.self){
                        item in
                        Divider().padding(.vertical, 2)
                        HStack {
                            Group {
                                Image(systemName: "\(item+1).circle")
                                Text(detailMeal?.strIngredients[item+1] ?? "")
                            }
                         
                            .font(.body).bold()
                            Spacer(minLength: 25)
                            Text(detailMeal?.strMeasures[item+1] ?? "")
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    
                }
            }
            
        }
    }

//#Preview {
//    MealIngredientView(detailMeal: <#T##DetailMeal#>)
//}

