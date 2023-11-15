//
//  NetworkManager.swift
//  meals
//
//  Created by Paul C on 11/13/23.
//

import Foundation

class NetworkManager: ObservableObject{
    
   @Published var meals = [Meal]()
    @Published var detailMeal = [Meal:DetailMeal]()
    init(meals: [Meal] = [Meal](), detailMeal: [Meal : DetailMeal] = [Meal:DetailMeal]()) {
        self.meals = meals
        self.detailMeal = detailMeal
        fetchMealData()
    }
    func fetchMealData(){
        if let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"){
            let session = URLSession(configuration:.default)
            let task = session.dataTask(with: url) { [weak self]data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                    let results = try decoder.decode(MealsDecoded.self, from: safeData)
                            DispatchQueue.main.async {
                    
                            self?.meals = results.meals
                            }
                        }catch{
                            print(error)
                        }
                    }
                    
                }
            }
            task.resume()
            
        }
    }
    func fetchDetailMeal(meal: Meal){
        guard self.detailMeal[meal] == nil else
        {
            return;
        }
        if let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(meal.idMeal)"){
            let session = URLSession(configuration:.default)
            let task = session.dataTask(with: url) {[weak self]data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                    let results = try decoder.decode(DetailMealDecoded.self, from: safeData)
                            DispatchQueue.main.async {
                                self?.detailMeal[meal] = results.meals[0];
                              
                            }
                        }catch{
print(error)
                        }
                    }
                    
                }
            }
            task.resume()
            
        }
    }
}
