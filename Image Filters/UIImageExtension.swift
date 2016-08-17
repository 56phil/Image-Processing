//
//  UIImageExtension.swift
//  Image Filters
//
//  Created by Phil Huffman on 2016-08-14.
//  Copyright © 2016 Phil Huffman. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func adjustContrast(color: UInt8, f:Double) -> UInt8 {
        return clampUInt8(Int(f * Double(color) - 128) + 128)
    }
    
    func alpha(nLevel: Int) -> UIImage {
        var RGBA1 = RGBAImage.init(image: self)
        let imagePixilCount = RGBA1!.width * RGBA1!.height
        
        for index in 0..<imagePixilCount {
            var pixil = RGBA1?.pixels[index]
            pixil?.alpha = clampUInt8(Int((pixil?.alpha)!) + nLevel)
            RGBA1?.pixels[index] = pixil!
        }
        
        return (RGBA1?.toUIImage())!
    }
    
    func blue(nLevel: Int) -> UIImage {
        var RGBA1 = RGBAImage.init(image: self)
        let imagePixilCount = RGBA1!.width * RGBA1!.height
        
        for index in 0..<imagePixilCount {
            var pixil = RGBA1?.pixels[index]
            pixil?.blue = clampUInt8(Int((pixil?.blue)!) + nLevel)
            RGBA1?.pixels[index] = pixil!
        }
        
        return (RGBA1?.toUIImage())!
    }

    func brightness(nLevel: Int) -> UIImage {
        var RGBA1 = RGBAImage.init(image: self)
        let imagePixilCount = RGBA1!.width * RGBA1!.height
        
        for index in 0..<imagePixilCount {
            var pixil = RGBA1?.pixels[index]
            pixil?.red = clampUInt8(Int((pixil?.red)!) + nLevel)
            pixil?.green = clampUInt8(Int((pixil?.green)!) + nLevel)
            pixil?.blue = clampUInt8(Int((pixil?.blue)!) + nLevel)
            RGBA1?.pixels[index] = pixil!
        }
        
        return (RGBA1?.toUIImage())!
    }
    
    func clampUInt8(n: Int) -> UInt8 {
        return UInt8(max(0, min(255, n)))
    }
    
    func contrast(nLevel: Int) -> UIImage {
        let f = Double((259 * Double(nLevel + 255)) / (255 * Double(259 - nLevel)))
        var RGBA1 = RGBAImage.init(image: self)
        let imagePixilCount = RGBA1!.width * RGBA1!.height
        
        for index in 0..<imagePixilCount {
            var pixil = RGBA1?.pixels[index]
            pixil!.red = adjustContrast(pixil!.red, f: f)
            pixil?.green = adjustContrast(pixil!.green, f: f)
            pixil?.blue = adjustContrast(pixil!.blue, f: f)
            RGBA1?.pixels[index] = pixil!
        }
        return (RGBA1?.toUIImage())!
    }
    
    func grayscale() -> UIImage {
        var RGBA1 = RGBAImage.init(image: self)
        let imagePixilCount = RGBA1!.width * RGBA1!.height
        for index in 0..<imagePixilCount {
            var pixil = RGBA1?.pixels[index]
            var gray = UInt8(Double(pixil!.red) * 0.299)
            gray += UInt8(Double((pixil?.green)!) * 0.587)
            gray += UInt8(Double((pixil?.blue)!) * 0.114)
            pixil?.red = gray
            pixil?.green = gray
            pixil?.blue = gray
            RGBA1?.pixels[index] = pixil!
        }
        return (RGBA1?.toUIImage())!
    }
    
    func green(nLevel: Int) -> UIImage {
        var RGBA1 = RGBAImage.init(image: self)
        let imagePixilCount = RGBA1!.width * RGBA1!.height
        
        for index in 0..<imagePixilCount {
            var pixil = RGBA1?.pixels[index]
            pixil?.green = clampUInt8(Int((pixil?.green)!) + nLevel)
            RGBA1?.pixels[index] = pixil!
        }
        
        return (RGBA1?.toUIImage())!
    }
    
    func negative() -> UIImage {
        var RGBA1 = RGBAImage.init(image: self)
        let imagePixilCount = RGBA1!.width * RGBA1!.height
        for index in 0..<imagePixilCount {
            var pixil = RGBA1?.pixels[index]
            pixil?.red = clampUInt8(255 - Int((pixil?.red)!))
            pixil?.green = clampUInt8(255 - Int((pixil?.green)!))
            pixil?.blue = clampUInt8(255 - Int((pixil?.blue)!))
            RGBA1?.pixels[index] = pixil!
        }
        return (RGBA1?.toUIImage())!
    }
    
    func red(nLevel: Int) -> UIImage {
        var RGBA1 = RGBAImage.init(image: self)
        let imagePixilCount = RGBA1!.width * RGBA1!.height
        
        for index in 0..<imagePixilCount {
            var pixil = RGBA1?.pixels[index]
            pixil?.red = clampUInt8(Int((pixil?.red)!) + nLevel)
            RGBA1?.pixels[index] = pixil!
        }
        
        return (RGBA1?.toUIImage())!
    }
    
    func sepia() -> UIImage {
        var RGBA1 = RGBAImage.init(image: self)
        let imagePixilCount = RGBA1!.width * RGBA1!.height
        for index in 0..<imagePixilCount {
            let nPixil = RGBA1?.pixels[index]
            var oPixil = nPixil
            oPixil?.red = clampUInt8(Int(Double(nPixil!.red) * 0.393 + Double(nPixil!.green) * 0.769 + Double(nPixil!.blue) * 0.189))
            oPixil?.green = clampUInt8(Int(Double(nPixil!.red) * 0.349 + Double(nPixil!.green) * 0.686 + Double(nPixil!.blue) * 0.168))
            oPixil?.blue = clampUInt8(Int(Double(nPixil!.red) * 0.272 + Double(nPixil!.green) * 0.534 + Double(nPixil!.blue) * 0.131))
            RGBA1?.pixels[index] = oPixil!
        }
        return (RGBA1?.toUIImage())!
    }
}
