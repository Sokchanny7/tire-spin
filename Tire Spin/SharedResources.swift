//
//  SharedResources.swift
//  Tire Spin
//
//  Created by sok channy on 2/10/17.
//  Copyright © 2017 channy-origin. All rights reserved.
//

import Foundation
import MapKit

let apiKey = "AIzaSyCujc7_4hEyzdKda62vUX4M2pa56MBrBJM"

struct latlong {
    let latitute    : CLLocationDegrees
    let longtitute  : CLLocationDegrees
    let title       : String
    let subTitle    : String
}

let latlongDic = [
    latlong(latitute: 11.5728299, longtitute: 104.8863281,title : "Yai pas kong", subTitle: "016 65 1443"),
    latlong(latitute: 11.573429, longtitute: 104.881770,title : "Yoo leng pas kong", subTitle: "016 65 1443"),
    latlong(latitute: 11.570376, longtitute: 104.886936,title : "Vatha na pas kong", subTitle: "Chal mot he yo"),
    latlong(latitute: 11.562698, longtitute: 104.878207,title : "SomPhors pas kong", subTitle: "Machine love you")
]
