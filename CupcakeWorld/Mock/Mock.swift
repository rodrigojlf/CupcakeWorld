//
//  Mock.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 14/03/26.
//

import UIKit

struct Mock {
    
    var banners: [UIImage] {
        var images: [UIImage] = []
        guard let banner1 = UIImage(named: "banner1") else { return images }
        images.append(banner1)
        guard let banner2 = UIImage(named: "banner2") else { return images }
        images.append(banner2)
        guard let banner3 = UIImage(named: "banner3") else { return images }
        images.append(banner3)
        return images
    }    
}
