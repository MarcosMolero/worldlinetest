//
//  PointOIRealmStore.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import RealmSwift

class PointOIRealmStore: PointOIStore {
    func getPointsOI(completion: @escaping PointOIStoreGetPointsOICompletionHandler) {
        
    }
    
    func getPointOI(withId id: String, completion: @escaping PointOIStoreGetPointOICompletionHandler) {
        
    }
    
    func savePointsOI(with pointsOI: [PointOI], completion: @escaping PointOIStoreSavePointsOICompletionHandler) {
        print("Hey dude, this gonna save your locations!")
        
        var pointsOIRealm: [PointOIRealm] = []
        
        for item in pointsOI {
            let pointOIRealm = PointOIRealm()
            pointOIRealm.id = item.id
            pointOIRealm.title = item.title
            pointOIRealm.latitude = item.latitude
            pointOIRealm.longitude = item.longitude
            
            pointsOIRealm.append(pointOIRealm)
        }
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(pointsOIRealm)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
}
