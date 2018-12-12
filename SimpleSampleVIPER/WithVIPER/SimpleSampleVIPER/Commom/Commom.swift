//
//  Commom.swift
//  SimpleSampleVIPER
//
//  Created by Marcos Lacerda on 05/12/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import Foundation

enum ViewState {
    case normal, loading, error
}

enum Result<Value> {
    case success(Value)
    case error(String)
}

//let apiKey = "{your-api-key}"
let kApiKey = "fdac4266e99b4b97bb979b08eeb835f5"
let kCountry = "us"
