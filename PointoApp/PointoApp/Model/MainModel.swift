//
//  MainModel.swift
//  PointoApp
//
//  Created by Ekrem Özkaraca on 29.10.2022.
//

import Foundation

struct Main : Codable {
    let isMaintenance : Bool?
    let statusCode : Int?
    let errorMessage : String?
    let errorCode : Int?
    let validationErrorMessages : String?
    let result : Results?
    let sid : String?
    let requestId : String?
    let logUrl : String?
}

struct Results : Codable {
    let isSuccess : Bool?
    let message : String?
    let explanation : String?
    let errorCode : Int?
    let resultObject : [ResultObjects]?
    let jobID : String?
    let params : Params?
    let requestContextID : String?
}

struct ResultObjects : Codable {
    let key : Int?
    let value : String?
}

struct Params : Codable {
}

