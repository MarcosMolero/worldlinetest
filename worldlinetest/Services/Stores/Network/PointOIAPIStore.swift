//
//  CustomAPIStore.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation

class PointOIAPIStore: PointOIStore {
    func getPointsOI(completion: @escaping PointOIStoreGetPointsOICompletionHandler) {
        
        guard let url = URL(string: Constants.API.PointsOI.url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            var result: PointOIStoreResult<[PointOI]>
            guard let data = data, error == nil else {
                result = .failure(error: PointOIStoreError.cannotGet("Cannot get POI: \(error.debugDescription)"))
                completion(result)
                return
            }

            do {
                let dictionary = try JSONSerialization.jsonObject(with: data) as! [String:Any]
                let values = dictionary["list"] as! [[String:Any]]
                
                var pointsOI: [PointOI] = []
                for item in values {
                    let pointOI = PointOI(fromDictionary: item)
                    pointsOI.append(pointOI!)
                }
                
                result = .success(result: pointsOI)
                completion(result)
            } catch let parseError {
                debugPrint(parseError.localizedDescription)
            }
            
        }.resume()
        
        
    }
    
    func getPointOI(withId id: String, completion: @escaping PointOIStoreGetPointOICompletionHandler) {
        guard let url = URL(string: Constants.API.PointOI.url + id) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            var result: PointOIStoreResult<PointOI>
            guard let data = data, error == nil else {
                result = .failure(error: PointOIStoreError.cannotGet("Cannot get POI: \(error.debugDescription)"))
                completion(result)
                return
            }
          
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                let pointOI = PointOI(fromDictionary: json)!
                
                result = .success(result: pointOI)
                completion(result)
            } catch let parseError {
                debugPrint(parseError.localizedDescription)
            }
            
            }.resume()
    }
    
    func savePointsOI(with pointsOI: [PointOI], completion: @escaping PointOIStoreSavePointsOICompletionHandler) {

    }
    
    func updatePointOI(with pointOI: PointOI, completion: @escaping PointOIStoreUpdatePointOICompletionHandler) {
        
    }
    
    func getPointsOIFromDB(completion: @escaping PointOIStoreGetPointsOIFromDBCompletionHandler) {
        
    }
}
