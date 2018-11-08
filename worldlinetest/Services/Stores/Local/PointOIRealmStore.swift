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
        
        for item in pointsOIRealm {
            if !objectExist(with: item.id!) {
                try! realm.write {
                    realm.add(item, update: false)
                }
            }
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    private func objectExist(with id: String) -> Bool {
        return try! Realm().object(ofType: PointOIRealm.self, forPrimaryKey: id) != nil
    }
    
    func updatePointOI(with pointOI: PointOI, completion: @escaping PointOIStoreUpdatePointOICompletionHandler) {
        print("Hey, this gonna save your POI!!!")
        
        let pointOIRealm = PointOIRealm()
        pointOIRealm.id = pointOI.id
        pointOIRealm.title = pointOI.title
        pointOIRealm.latitude = pointOI.latitude
        pointOIRealm.longitude = pointOI.longitude
        pointOIRealm.address = pointOI.address
        pointOIRealm.transport = pointOI.transport
        pointOIRealm.email = pointOI.email
        pointOIRealm.desc = pointOI.description
        pointOIRealm.phone = pointOI.phone
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(pointOIRealm, update: true)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    func getPointsOIFromDB(completion: @escaping PointOIStoreGetPointsOIFromDBCompletionHandler) {
        var result: PointOIStoreResult<[PointOI]>

        var pointsOI: [PointOI] = []
        let realm = try! Realm()
        let pointsOIRealm = realm.objects(PointOIRealm.self)
        
        for item in pointsOIRealm {
            let pointOI = PointOI(id: item.id!, title: item.title, address: item.address, transport: item.transport, email: item.email, latitude: item.latitude, longitude: item.longitude, description: item.desc, phone: item.phone)
            pointsOI.append(pointOI)
        }
        
        result = .success(result: pointsOI)
        completion(result)   
    }
}
