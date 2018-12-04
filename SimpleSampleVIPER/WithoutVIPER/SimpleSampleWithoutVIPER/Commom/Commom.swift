//
//  Commom.swift
//  SimpleSampleWithoutVIPER
//
//  Created by Marcos Lacerda on 04/12/18.
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

let apiKey = "{your-api-key}"
let kCountry = "us"
