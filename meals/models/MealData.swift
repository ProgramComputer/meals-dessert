//
//  MealData.swift
//  meals
//
//  Created by Paul C on 11/13/23.
//

import Foundation

struct MealsDecoded: Decodable{
    
    let meals: [Meal]
  //  var detailedMeals: [DetailedMeal]

  
    
}


struct Meal: Decodable, Identifiable,Hashable{
    var id: String{
        return idMeal
    }
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
}

struct DetailMeal: Decodable,Identifiable {
    var id: String{
        return idMeal
    }
    var idMeal: String
    var strArea: String
    var strInstructions: String
    var strIngredients: [Int:String]
    var strMeasures: [Int:String]
   private func extractNumberFromString(_ input: String) -> Int? {
        let pattern = "\\d+$" // Regular expression to match one or more digits at the end of the string
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        
        let range = NSRange(location: 0, length: input.utf16.count)
        if let match = regex.firstMatch(in: input, options: [], range: range) {
            if let matchRange = Range(match.range, in: input) {
                let matchedString = input[matchRange]
                return Int(matchedString)
            }
        }
        
        return nil
    }
   
    private struct CustomCodingKeys: CodingKey {
        var intValue: Int?
        
          var stringValue: String
          init?(stringValue: String) {
              self.stringValue = stringValue
          }
          init?(intValue: Int) {
              return nil
          }
      }

      public init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CustomCodingKeys.self)
          self.strInstructions = "";
          self.idMeal = ""
          self.strArea = ""
          self.strIngredients = [:]
          self.strMeasures = [:]
  
          for key in container.allKeys {
              let keyString = key.stringValue
              do
              {
                  let value = try container.decode(String.self, forKey: CustomCodingKeys(stringValue: keyString)!)
                 if value.isEmpty
                  {
                     continue
                 }
                  if keyString.contains("strIngredient"){
                      guard let digits = extractNumberFromString(keyString) else {
                          continue
                      }
                      
                      
                      self.strIngredients[digits] = value
                  }
                  else  if keyString.contains("strMeasure"){
                      guard let  digits = extractNumberFromString(keyString) else {
                          continue
                      }
                      
                      
                      self.strMeasures[digits] = value
                  }
                  else if(keyString.contains("idMeal")){
                      self.idMeal = value;
                  }
                  else if(keyString.contains("strArea")){
                      self.strArea = value;
                  }
                  else if(keyString.contains("strInstruction")){
                      
                      self.strInstructions = value;
                  }
              }
              catch{
                  continue
              }
          }
      }
  
}

struct DetailMealDecoded: Decodable{
    let meals: [DetailMeal]
}
