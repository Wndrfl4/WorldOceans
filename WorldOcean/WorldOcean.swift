//
//  WorldOcean.swift
//  WorldOcean
//
//  Created by Aslan  on 14.12.2024.
//

import Foundation
import SwiftyJSON

struct WorldOcean {
    var name = ""
    var vallue = ""
    var AverageDepth = ""
    var URL = ""
    var picture = ""
    
    init(json: JSON){
        if let item = json["name"].string{
            name = item
        }
        if let item = json["vallue"].string{
            vallue = item
        }
        if let item = json["AverageDepth"].string{
            AverageDepth = item
        }
        if let item = json["URL"].string{
            URL = item
        }
        if let item = json["picture"].string{
            picture = item
        }
    }
}
