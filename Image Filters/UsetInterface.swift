//
//  UsetInterface.swift
//  Image Filters
//
//  Created by Phil Huffman on 2016-08-14.
//  Copyright © 2016 Phil Huffman. All rights reserved.
//

import Foundation
import UIKit

class UserInterface: UIViewController {
    var image = UIImage()
    var originalImage = UIImage()
    
    let labelX: CGFloat = 240
    let labelWidth: CGFloat = 130
    let labelHieght: CGFloat = 25
    let imageSide: CGFloat = 200
    let margin: CGFloat = 10
    
    var alphaLevel = 100.0
    var blueLevel = 100.0
    var brightnessLevel = 100.0
    var contrastLevel = 100.0
    var greenLevel = 100.0
    var redLevel = 100.0
    
    var alteredImageView = UIImageView()
    let alphaLabel = UITextField()
    let blueLabel = UITextField()
    let brightnessLabel = UITextField()
    let contrastLabel = UITextField()
    let greenLabel = UITextField()
    let grayscaleLabel = UITextField()
    var invalids = NSCharacterSet()
    let negativeLabel = UITextField()
    let originalImageView = UIImageView()
    let redLabel = UITextField()
    let sepiaLabel = UITextField()
//    let view = UIView()
    
    let availableFilters = [
        "alpha",
        "alterChannels",
        "blue",
        "blueOff",
        "blueOnly",
        "contrast",
        "doubleContrast",
        "doubleBrightness",
        "grayscale",
        "green",
        "greenOff",
        "greenOnly",
        "halfBrightness",
        "halfContrast",
        "increaseBrightness50Percent",
        "increaseContrast50Percent",
        "negative",
        "red",
        "redOff",
        "redOnly",
        "sepia",
        "wierdness"
    ]
    
    init(nImage: UIImage) {
        self = UIViewController.init()
        
        invalids = NSCharacterSet.init(charactersInString: "0123456789.").invertedSet
        view.frame = CGRectMake(0, 0, 680, 220)
        originalImage = nImage
        image = nImage
        view.backgroundColor = UIColor.blackColor()
        
        alphaLabel.frame = CGRectMake(labelX, margin, labelWidth, labelHieght)
        alphaLabel.backgroundColor = UIColor.blackColor()
        alphaLabel.textColor = UIColor.whiteColor()
        alphaLabel.text = "Alpha: \(Int(alphaLevel))"
        alphaLabel.textAlignment = .Left
        alphaLabel.addTarget(self, action: #selector(UserInterface.alpha), forControlEvents: .AllEvents )
        view.addSubview(alphaLabel)
        
        brightnessLabel.frame = CGRectMake(labelX, 45, labelWidth, labelHieght)
        brightnessLabel.backgroundColor = UIColor.blackColor()
        brightnessLabel.textColor = UIColor.whiteColor()
        brightnessLabel.text = "Brightness: \(Int(brightnessLevel))"
        brightnessLabel.textAlignment = .Left
        brightnessLabel.addTarget(self, action: #selector(UserInterface.brightness), forControlEvents: .AllEvents )
        view.addSubview(brightnessLabel)
        
        contrastLabel.frame = CGRectMake(labelX, 80, labelWidth, labelHieght)
        contrastLabel.backgroundColor = UIColor.blackColor()
        contrastLabel.textColor = UIColor.whiteColor()
        contrastLabel.text = "Contrast: \(Int(contrastLevel))"
        contrastLabel.textAlignment = .Left
        contrastLabel.addTarget(self, action: #selector(UserInterface.contrast), forControlEvents: .AllEvents )
        view.addSubview(contrastLabel)
        
        sepiaLabel.frame = CGRectMake(labelX, 115, labelWidth, labelHieght)
        sepiaLabel.backgroundColor = UIColor.blackColor()
        sepiaLabel.textColor = UIColor.init(red: 0.7, green: 0.6, blue: 0.15, alpha: 1.0)
        sepiaLabel.text = "Sepia"
        sepiaLabel.textAlignment = .Left
        sepiaLabel.addTarget(self, action: #selector(UserInterface.sepia), forControlEvents: .AllEvents )
        view.addSubview(sepiaLabel)
        
        grayscaleLabel.frame = CGRectMake(labelX, 150, labelWidth, labelHieght)
        grayscaleLabel.backgroundColor = UIColor.blackColor()
        grayscaleLabel.textColor = UIColor.lightGrayColor()
        grayscaleLabel.text = "Grayscale"
        grayscaleLabel.textAlignment = .Left
        grayscaleLabel.addTarget(self, action: #selector(UserInterface.grayscale), forControlEvents: .AllEvents )
        view.addSubview(grayscaleLabel)
        
        negativeLabel.frame = CGRectMake(labelX, 185, labelWidth, labelHieght)
        negativeLabel.backgroundColor = UIColor.blackColor()
        negativeLabel.textColor = UIColor.whiteColor()
        negativeLabel.text = "Negative"
        negativeLabel.textAlignment = .Left
        negativeLabel.addTarget(self, action: #selector(UserInterface.negative), forControlEvents: .AllEvents )
        view.addSubview(negativeLabel)
        
        redLabel.frame = CGRectMake(labelX + labelWidth, margin, labelWidth / 2, labelHieght)
        redLabel.backgroundColor = UIColor.blackColor()
        redLabel.textColor = UIColor.redColor()
        redLabel.text = "\(Int(redLevel))"
        redLabel.textAlignment = .Right
        redLabel.addTarget(self, action: #selector(UserInterface.red), forControlEvents: .AllEvents )
        view.addSubview(redLabel)
        
        greenLabel.frame = CGRectMake(labelX + labelWidth, 45, labelWidth / 2, labelHieght)
        greenLabel.backgroundColor = UIColor.blackColor()
        greenLabel.textColor = UIColor.greenColor()
        greenLabel.text = "\(Int(greenLevel))"
        greenLabel.textAlignment = .Right
        greenLabel.addTarget(self, action: #selector(UserInterface.green), forControlEvents: .AllEvents )
        view.addSubview(greenLabel)
        
        blueLabel.frame = CGRectMake(labelX + labelWidth, 80, labelWidth / 2, labelHieght)
        blueLabel.backgroundColor = UIColor.blackColor()
        blueLabel.textColor = UIColor.blueColor()
        blueLabel.text = "\(Int(blueLevel))"
        blueLabel.textAlignment = .Right
        blueLabel.addTarget(self, action: #selector(UserInterface.blue), forControlEvents: .AllEvents )
        view.addSubview(blueLabel)
        
        originalImageView.frame = CGRectMake(margin, margin, imageSide, imageSide)
        originalImageView.backgroundColor = UIColor.whiteColor()
        originalImageView.contentMode = .ScaleAspectFill
        originalImageView.image = originalImage
        view.addSubview(originalImageView)
        
        alteredImageView.frame = CGRectMake(labelX + 1.775 * labelWidth, margin, imageSide, imageSide)
        alteredImageView.backgroundColor = UIColor.whiteColor()
        alteredImageView.contentMode = .ScaleAspectFill
        alteredImageView.image = image
        view.addSubview(alteredImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func alpha(level: Double) {
        alphaLevel = level
        alteredImageView.image = alteredImageView.image!.alpha(alphaLevel)
    }
    
    func alterChannels(red: Double, green: Double, blue: Double, alpha: Double) {
        alphaLevel = alpha
        greenLevel = green
        blueLevel = blue
        redLevel = red
        alteredImageView.image = alteredImageView.image!.alterChannels(redLevel, green: greenLevel, blue: blueLevel, alpha: alphaLevel)
    }
    
    func blue(level: Double) {
        blueLevel = level
        alteredImageView.image = alteredImageView.image!.blue(blueLevel)
    }
    
    func blueOff() {
        blue(0)
    }
    
    func blueOnly() {
        alterChannels(0, green: 0, blue: 100, alpha: 100)
    }
    
    func brightness(level: Double) {
        brightnessLevel = level
        alphaLevel = brightnessLevel
        blueLevel = brightnessLevel
        greenLevel = brightnessLevel
        redLevel = brightnessLevel
        alteredImageView.image = alteredImageView.image!.brightness(brightnessLevel)
    }
    
    func contrast(level: Double) {
        contrastLevel = level
        alteredImageView.image = alteredImageView.image!.contrast(contrastLevel)
    }
    
    func doubleBrightness() {
        brightness(brightnessLevel * 2)
    }
    
    func doubleContrast() {
        contrast(contrastLevel * 2)
    }
    
    func getLevel(chunk: String) -> Double? {
        
        let s = chunk.componentsSeparatedByString(":")[1].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        let x = Double(s.componentsSeparatedByCharactersInSet(invalids).joinWithSeparator(""))
        
        if x == nil {
            print("Invalid number: \(chunk)")
        }
        
        return x
    }
    
    func grayscale() {
        alteredImageView.image = alteredImageView.image!.grayscale()
        grayscaleLabel.hidden = false
    }
    
    func green(level: Double) {
        greenLevel = level
        alteredImageView.image = alteredImageView.image!.green(greenLevel)
    }
    
    func greenOff() {
        green(0)
    }
    
    func greenOnly() {
        alterChannels(0, green: 100, blue: 0, alpha: 100)
    }
    
    func halfBrightness() {
        brightness(brightnessLevel / 2)
    }
    
    func halfContrast() {
        contrast(contrastLevel / 2)
    }
    
    func increaseBrightness50Percent() {
        brightness(brightnessLevel * 1.5)
    }
    
    func increaseContrast50Percent() {
        contrast(contrastLevel * 1.5)
    }
    
    func negative() {
        alteredImageView.image = alteredImageView.image!.negative()
        negativeLabel.hidden = false
    }
    
    func parseRequestString(request: String) -> UserInterface {
        sepiaLabel.hidden = true
        grayscaleLabel.hidden = true
        negativeLabel.hidden = true
        if request.characters.count > 0 {
            let commands = request.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).componentsSeparatedByString(" ")
            if commands.count > 0 {
                for command in commands {
                    let chunk = command.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                    if chunk.hasPrefix("alterchannels") {
                        let subCommands = chunk.componentsSeparatedByString("|")
                        var red = -9.9
                        var green = -9.9
                        var blue = -9.9
                        var alpha = -9.9
                        
                        if subCommands.count == 4 {
                            red = getLevel(subCommands[0])!
                            green = getLevel(subCommands[1])!
                            blue = getLevel(subCommands[2])!
                            alpha = getLevel(subCommands[3])!
                        }
                        
                        if red < 0 || green < 0 || blue < 0 || alpha < 0 {
                            print("Invalid color: \(chunk)")
                        } else {
                            alterChannels(red, green: green, blue: blue, alpha: alpha)
                        }
                        continue
                    }
                    
                    switch chunk {
                    case "blueoff":
                        blueOff()
                        break
                    case "blueonly":
                        blueOnly()
                        break
                    case "doublebrightness":
                        doubleBrightness()
                        break
                    case "doublecontrast":
                        doubleContrast()
                        break
                    case "grayscale":
                        grayscale()
                        break
                    case "greenoff":
                        greenOff()
                        break
                    case "greenonly":
                        greenOff()
                        break
                    case "halfbrightness":
                        halfBrightness()
                        break
                    case "halfcontrast":
                        halfContrast()
                        break
                    case "increasebrightness50percent":
                        increaseBrightness50Percent()
                        break
                    case "increasecontrast50percent":
                        increaseContrast50Percent()
                        break
                    case "negative":
                        negative()
                        break
                    case "redoff":
                        redOff()
                        break
                    case "redonly":
                        redOnly()
                        break
                    case "sepia":
                        sepia()
                        break
                    case "wierdness":
                        wierdness()
                        break
                    default:
                        let tempLevel = getLevel(chunk)
                        
                        if tempLevel == nil {
                            print("Invalid level request: \(chunk)")
                            continue
                        } else {
                            let filterName = chunk.componentsSeparatedByString(":")[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                            
                            if availableFilters.contains(filterName)  {
                                let sel = Selector(filterName + ":")
                                let levelObject = NSNumber(double: tempLevel!)
                                
                                performSelector(sel, withObject: levelObject)
                            } else {
                                print("unrecongnized filter name: \(filterName)")
                            }
                        }
                    }
                }
            }
        }
        refreshLabels()
        return self
    }
    
    func red(level: Double) {
        redLevel = level
        alteredImageView.image = alteredImageView.image!.red(redLevel)
    }
    
    func redOff() {
        red(0)
    }
    
    func redOnly() {
        alterChannels(100, green: 0, blue: 0, alpha: 100)
    }
    
    func refreshLabels() {
        alphaLabel.text = "Alpha: \(Int(alphaLevel))"
        blueLabel.text = "\(Int(blueLevel))"
        brightnessLabel.text = "Brightness: \(Int(brightnessLevel))"
        contrastLabel.text = "Contrast: \(Int(contrastLevel))"
        greenLabel.text = "\(Int(greenLevel))"
        redLabel.text = "\(Int(redLevel))"
    }
    
    func sepia() {
        alteredImageView.image = alteredImageView.image!.sepia()
        sepiaLabel.hidden = false
    }
    
    func wierdness() {
        let red = Double(arc4random_uniform(UInt32(101)))
        let green = Double(arc4random_uniform(UInt32(101)))
        let blue = Double(arc4random_uniform(UInt32(101)))
        let randomContrast = Double(arc4random_uniform(UInt32(1001)))
        let alpha = Double(arc4random_uniform(UInt32(101)))
        alterChannels(red, green: green, blue: blue, alpha: alpha)
        contrast(randomContrast)
    }
}

