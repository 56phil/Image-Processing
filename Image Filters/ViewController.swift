//
//  ViewController.swift
//  Image Filters
//
//  Created by Phil Huffman on 2016-08-14.
//  Copyright © 2016 Phil Huffman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alteredImage = UIImage()
    var originalImage = UIImage()

    var alphaLevel = 0
    var blueLevel = 0
    var brightnessLevel = 0
    var contrastLevel = 0
    var greenLevel = 0
    var redLevel = 0
    
    var alteredImageView = UIImageView()
    let originalImageView = UIImageView()
    
    let alphaLabel = UILabel()
    let blueLabel = UILabel()
    let brightnessLabel = UILabel()
    let contrastLabel = UILabel()
    let greenLabel = UILabel()
    let redLabel = UILabel()
    
    let grayscaleButton = UIButton()
    let negativeButton = UIButton()
    let resetButton = UIButton()
    let sepiaButton = UIButton()
    
    var alphaSlider = UISlider()
    var brightnessSlider = UISlider()
    var blueSlider = UISlider()
    var contrastSlider = UISlider()
    var greenSlider = UISlider()
    var redSlider = UISlider()

    func alphaValueChanged(sender: UISlider) {
        setAlpha(alphaSlider.value)
    }
    
    func blueValueChanged(sender: UISlider) {
        setBlue(blueSlider.value)
    }
    
    func brightnessValueChanged(sender: UISlider) {
        setBrightness(brightnessSlider.value)
    }
    
    func contrastValueChanged(sender: UISlider) {
        setContrast(contrastSlider.value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func grayscale() {
        alteredImageView.image = alteredImageView.image!.grayscale()
    }
    
    func green(level: Int) {
        alteredImageView.image = alteredImageView.image!.green(level)
    }
    
    func greenValueChanged(sender: UISlider) {
        setGreen(greenSlider.value)
    }

    func negative() {
        alteredImageView.image = alteredImageView.image!.negative()
    }
    
    func red(level: Int) {
        alteredImageView.image = alteredImageView.image!.red(level)
    }
    
    func redValueChanged(sender: UISlider) {
        setRed(redSlider.value)
    }
    
    func setAlpha(sliderLevel: Float) {
        alteredImageView.image = alteredImageView.image!.alpha(Int(sliderLevel) - alphaLevel)
        alphaLevel = Int(sliderLevel)
        alphaLabel.text = "Alpha: \(Int(sliderLevel))"
        alphaSlider.setValue(sliderLevel, animated: true)
    }
    
    func setBlue(sliderLevel: Float) {
        alteredImageView.image = alteredImageView.image!.blue(Int(sliderLevel) - blueLevel)
        blueLevel = Int(sliderLevel)
        blueLabel.text = "Blue: \(Int(sliderLevel))"
        blueSlider.setValue(sliderLevel, animated: true)
    }
    
    func setBrightness(sliderLevel: Float) {
        alteredImageView.image = alteredImageView.image!.brightness(Int(sliderLevel) - brightnessLevel)
        brightnessLevel = Int(sliderLevel)
        brightnessLabel.text = "Brightness: \(Int(sliderLevel))"
        brightnessSlider.setValue(sliderLevel, animated: true)
    }
    
    func setContrast(sliderLevel: Float) {
        alteredImageView.image = alteredImageView.image!.contrast(Int(sliderLevel) - contrastLevel)
        contrastLevel = Int(sliderLevel)
        contrastLabel.text = "Contrast: \(Int(sliderLevel))"
        contrastSlider.setValue(sliderLevel, animated: true)
    }
    
    func setGreen(sliderLevel: Float) {
        alteredImageView.image = alteredImageView.image!.green(Int(sliderLevel) - greenLevel)
        greenLevel = Int(sliderLevel)
        greenLabel.text = "Green: \(Int(sliderLevel))"
        greenSlider.setValue(sliderLevel, animated: true)
    }
    
    func setRed(sliderLevel: Float) {
        alteredImageView.image = alteredImageView.image!.red(Int(sliderLevel) - redLevel)
        redLevel = Int(sliderLevel)
        redLabel.text = "Red: \(Int(sliderLevel))"
        redSlider.setValue(sliderLevel, animated: true)
    }
    
    func reset() {
        setAlpha(0)
        setBlue(0)
        setBrightness(0)
        setContrast(0)
        setGreen(0)
        setRed(0)

        alteredImageView.image = originalImage
        view.setNeedsDisplay()
    }

    func setupView() {
        let margin: CGFloat = view.frame.size.width / 32
        let imageSide: CGFloat = (view.frame.size.width + margin) / 2 - margin * 2
        let labelWidth: CGFloat = imageSide
        let labelHieght: CGFloat =  view.frame.size.height / 27
        let sliderWidth = imageSide
        let sliderHeight = labelHieght
        let cornerRadius = labelHieght / 2
        let buttonWidth = imageSide / 1.275 - margin * 2
        
        let sliderMinimum:Float = -255
        let sliderMaximum:Float = 255
        
        var x: CGFloat = margin
        var y: CGFloat = margin
        
        originalImage = UIImage(named: "sample")!
        alteredImage = originalImage
        view.backgroundColor = UIColor.blackColor()
        
        originalImageView.frame = CGRectMake(x, y, imageSide, imageSide)
        originalImageView.backgroundColor = UIColor.lightGrayColor()
        originalImageView.contentMode = .ScaleAspectFill
        originalImageView.image = originalImage
        view.addSubview(originalImageView)
        
        x += imageSide + margin
        alteredImageView.frame = CGRectMake(x, y, imageSide, imageSide)
        alteredImageView.backgroundColor = UIColor.blackColor()
        alteredImageView.contentMode = .ScaleAspectFill
        alteredImageView.image = alteredImage
        view.addSubview(alteredImageView)

        x = margin
        y += imageSide + margin
        redSlider.frame = CGRectMake(x, y, sliderWidth, sliderHeight)
        redSlider.minimumValue = sliderMinimum
        redSlider.maximumValue = sliderMaximum
        redSlider.continuous = true
        redSlider.addTarget(self, action: #selector(ViewController.redValueChanged), forControlEvents: .ValueChanged)
        view.addSubview(redSlider)
        
        x += sliderWidth + margin
        redLabel.frame = CGRectMake(x, y, labelWidth, labelHieght)
        redLabel.backgroundColor = UIColor.blackColor()
        redLabel.textColor = UIColor.redColor()
        redLabel.textAlignment = .Left
        view.addSubview(redLabel)
        
        x = margin
        y += sliderHeight + margin
        greenSlider.frame = CGRectMake(x, y, sliderWidth, sliderHeight)
        greenSlider.minimumValue = sliderMinimum
        greenSlider.maximumValue = sliderMaximum
        greenSlider.setValue(Float(greenLevel), animated: true)
        greenSlider.continuous = true
        greenSlider.addTarget(self, action: #selector(ViewController.greenValueChanged), forControlEvents: .ValueChanged)
        view.addSubview(greenSlider)
        
        x += sliderWidth + margin
        greenLabel.frame = CGRectMake(x, y, labelWidth, labelHieght)
        greenLabel.backgroundColor = UIColor.blackColor()
        greenLabel.textColor = UIColor.greenColor()
        greenLabel.textAlignment = .Left
        view.addSubview(greenLabel)
        
        x = margin
        y += sliderHeight + margin
        blueSlider.frame = CGRectMake(x, y, sliderWidth, sliderHeight)
        blueSlider.minimumValue = sliderMinimum
        blueSlider.maximumValue = sliderMaximum
        blueSlider.setValue(Float(blueLevel), animated: true)
        blueSlider.continuous = true
        blueSlider.addTarget(self, action: #selector(ViewController.blueValueChanged), forControlEvents: .ValueChanged)
        view.addSubview(blueSlider)
        
        x += sliderWidth + margin
        blueLabel.frame = CGRectMake(x, y, labelWidth, labelHieght)
        blueLabel.backgroundColor = UIColor.blackColor()
        blueLabel.textColor = UIColor.blueColor()
        blueLabel.textAlignment = .Left
        view.addSubview(blueLabel)
        
        x = margin
        y += sliderHeight + margin
        alphaSlider.frame = CGRectMake(x, y, sliderWidth, sliderHeight)
        alphaSlider.minimumValue = sliderMinimum
        alphaSlider.maximumValue = sliderMaximum
        alphaSlider.setValue(Float(alphaLevel), animated: true)
        alphaSlider.continuous = true
        alphaSlider.addTarget(self, action: #selector(ViewController.alphaValueChanged), forControlEvents: .ValueChanged)
        view.addSubview(alphaSlider)
        
        x += sliderWidth + margin
        alphaLabel.frame = CGRectMake(x, y, labelWidth, labelHieght)
        alphaLabel.backgroundColor = UIColor.blackColor()
        alphaLabel.textColor = UIColor.whiteColor()
        alphaLabel.textAlignment = .Left
        view.addSubview(alphaLabel)
        
        x = margin
        y += sliderHeight + margin
        brightnessSlider.frame = CGRectMake(x, y, sliderWidth, sliderHeight)
        brightnessSlider.minimumValue = sliderMinimum
        brightnessSlider.maximumValue = sliderMaximum
        brightnessSlider.setValue(Float(brightnessLevel), animated: true)
        brightnessSlider.continuous = true
        brightnessSlider.addTarget(self, action: #selector(ViewController.brightnessValueChanged), forControlEvents: .ValueChanged)
        view.addSubview(brightnessSlider)
        
        x += sliderWidth + margin
        brightnessLabel.frame = CGRectMake(x, y, labelWidth, labelHieght)
        brightnessLabel.backgroundColor = UIColor.blackColor()
        brightnessLabel.textColor = UIColor.whiteColor()
        brightnessLabel.textAlignment = .Left
        view.addSubview(brightnessLabel)
        
        x = margin
        y += sliderHeight + margin
        contrastSlider.frame = CGRectMake(x, y, sliderWidth, sliderHeight)
        contrastSlider.minimumValue = sliderMinimum
        contrastSlider.maximumValue = sliderMaximum
        contrastSlider.setValue(Float(contrastLevel), animated: true)
        contrastSlider.continuous = true
        contrastSlider.addTarget(self, action: #selector(ViewController.contrastValueChanged), forControlEvents: .ValueChanged)
        view.addSubview(contrastSlider)
        
        x += sliderWidth + margin
        contrastLabel.frame = CGRectMake(x, y, labelWidth, labelHieght)
        contrastLabel.backgroundColor = UIColor.blackColor()
        contrastLabel.textColor = UIColor.whiteColor()
        contrastLabel.textAlignment = .Left
        view.addSubview(contrastLabel)
        
        x = margin
        y += sliderHeight + margin * 1.25
        sepiaButton.frame = CGRectMake(x, y, buttonWidth, labelHieght)
        sepiaButton.backgroundColor = UIColor.init(red: 0.7, green: 0.6, blue: 0.15, alpha: 1.0)
        sepiaButton.showsTouchWhenHighlighted = true
        sepiaButton.layer.cornerRadius = cornerRadius
        sepiaButton.setTitle("Sepia", forState: .Normal)
        sepiaButton.addTarget(self, action: #selector(ViewController.sepia), forControlEvents: .TouchUpInside)
        view.addSubview(sepiaButton)
        
        x += buttonWidth + margin
        grayscaleButton.frame = CGRectMake(x, y, buttonWidth, labelHieght)
        grayscaleButton.showsTouchWhenHighlighted = true
        grayscaleButton.layer.cornerRadius = cornerRadius
        grayscaleButton.backgroundColor = UIColor.darkGrayColor()
        grayscaleButton.setTitle("Grayscale", forState: .Normal)
        grayscaleButton.addTarget(self, action: #selector(ViewController.grayscale), forControlEvents: .TouchUpInside)
        view.addSubview(grayscaleButton)
        
        x += buttonWidth + margin
        negativeButton.frame = CGRectMake(x, y, buttonWidth, labelHieght)
        negativeButton.layer.cornerRadius = cornerRadius
        negativeButton.showsTouchWhenHighlighted = true
        negativeButton.backgroundColor = UIColor.whiteColor()
        negativeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        negativeButton.setTitle("Negative", forState: .Normal)
        negativeButton.addTarget(self, action: #selector(ViewController.negative), forControlEvents: .TouchUpInside)
        view.addSubview(negativeButton)
        
        x -= buttonWidth + margin
        y += labelHieght + margin
        resetButton.frame = CGRectMake(x, y, buttonWidth, labelHieght)
        resetButton.layer.cornerRadius = cornerRadius
        resetButton.showsTouchWhenHighlighted = true
        resetButton.backgroundColor = UIColor.lightTextColor()
        resetButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        resetButton.setTitle("Reset", forState: .Normal)
        resetButton.addTarget(self, action: #selector(ViewController.reset), forControlEvents: .TouchUpInside)
        view.addSubview(resetButton)
        
        reset()
    }

    func sepia() {
        alteredImageView.image = alteredImageView.image!.sepia()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
