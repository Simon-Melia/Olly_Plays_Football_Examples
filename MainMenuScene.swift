//
//  MainMenuScene.swift
//  Olly Plays Football
//
//  Created by Simon Melia  on 29/10/2015.
//  Copyright © 2015 Simon Melia. All rights reserved.
//


import UIKit
import SpriteKit

class MainMenuScene: SKScene {
    
    //general
    let touchLayer = SKNode()
    var touchx: CGFloat?
    var touchy: CGFloat?
    var canTouch = true
    enum page: Int {
        case titlePage = 0, page1Part1 , page1Part2, page2Part1, page2Part2, page3Part1, page3Part2, page4Part1, page4Part2, page5Part1, page5Part2, page6Part1, page6Part2, page7Part1, page7Part2, page8Part1, page8Part2, page9Part1, page9Part2, creditsPage, settingsPage, miniGamesPortalPage, aboutUsPage, introSettingsPage
    }
    enum language {
        case english, french, spanish, italian, dutch, hindi, urdu, mandarin, german, portuguese
    }
    enum textColour {
        case black
    }
    var textBoxColour: textColour!
    var pageInUse: page!
    var pageToReturnTo: page!
    var languageInUse: language!
    let textEnglish = ["text11Eng","text12Eng","text21Eng","text22Eng","text31Eng","text32Eng","text41Eng","text42Eng","text51Eng","text52Eng","text61Eng","text62Eng","text71Eng","text72Eng","text81Eng","text82Eng","text91Eng"]
    let textSpanish = ["text11Spa","text12Spa","text21Spa","text22Spa","text31Spa","text32Spa","text41Spa","text42Spa","text51Spa","text52Spa","text61Spa","text62Spa","text71Spa","text72Spa","text81Spa","text82Spa","text91Spa"]
    let textItalian = ["text11Ita","text12Ita","text21Ita","text22Ita","text31Ita","text32Ita","text41Ita","text42Ita","text51Ita","text52Ita","text61Ita","text62Ita","text71Ita","text72Ita","text81Ita","text82Ita","text91Ita"]
    var bubbleTimer: NSTimer!
    
    
    // navigation
    
    var fowardButton: SKSpriteNode!
    var backButton: SKSpriteNode!
    var homeButton: SKSpriteNode!
    var volumeButton: SKSpriteNode!
    var settingsButton: SKSpriteNode!
    var textBox: SKSpriteNode!
    var changeBase: SKAction!
    var introReadButton = SKSpriteNode(imageNamed: "readBookLabel")
    var introSettingsButton = SKSpriteNode(imageNamed: "settingsLabel")
    var playGamesButton = SKSpriteNode(imageNamed: "playGamesLabel")
    var websiteButton = SKSpriteNode(imageNamed: "websiteLabel")
    var aboutUsButton = SKSpriteNode(imageNamed: "aboutUsLabel")
    var games1Label: SKLabelNode!
    var games2Label: SKLabelNode!

    //settings
    var musicLabel: SKLabelNode!
    var effectsLabel: SKLabelNode!
    var music: String!
    var effects: String!
    var volumeString: String!
    var changeVolButton: SKAction!
    //aboutus page
    var storyLabel: SKLabelNode!
    var artLabel: SKLabelNode!
    var codeLabel: SKLabelNode!
    var copyrightLabel: SKLabelNode!
    var copyright2Label: SKLabelNode!

    
    // front page
   
    var titleBird1 : SKSpriteNode!
    var titleBird1MovingFrames : [SKTexture]!
    var titleBird2 : SKSpriteNode!
    var titleBird2MovingFrames : [SKTexture]!
    var titleBird3 : SKSpriteNode!
    var titleBird3MovingFrames : [SKTexture]!
    
    
    var background = SKSpriteNode(imageNamed: "blankWhite")
    var reef = SKSpriteNode(imageNamed: "reef")
    var imageMask = SKSpriteNode(imageNamed: "imageViewMask")
    var pageBase = SKSpriteNode(imageNamed: "baseTitleImage")
    var bubble: SKSpriteNode!
    var titlePart1 = SKSpriteNode(imageNamed: "titlePart1")
    var titlePart2 = SKSpriteNode(imageNamed: "titlePart2")
    var titlePart3 = SKSpriteNode(imageNamed: "titlePart3")
    var titleFish = SKSpriteNode(imageNamed: "titleFish")
    var titlePaddy = SKSpriteNode(imageNamed: "titlePaddy")
    var titleSeahorse = SKSpriteNode(imageNamed: "titleSeahorse")
    var titleSnail = SKSpriteNode(imageNamed: "titleSnail")
    var titleJellyfish = SKSpriteNode(imageNamed: "titleJellyfish")
    var frontBall = SKSpriteNode(imageNamed: "frontBall")
    var crab = SKSpriteNode(imageNamed: "introCrab")
    var crabLeft = SKSpriteNode(imageNamed: "introCrabLeft")
    var crabRight = SKSpriteNode(imageNamed: "introCrabRight")
   
   
    //page one
    var pageOneStarfish: SKSpriteNode!
    var pageOneClamOne: SKSpriteNode!
    var pageOneClamTwo: SKSpriteNode!
    var pageOneClamThree: SKSpriteNode!
    var pageOneBirdOne: SKSpriteNode!
    var pageOneBirdOneMovingFrames : [SKTexture]!
    var pageOneBirdTwo: SKSpriteNode!
    var pageOneBirdTwoMovingFrames : [SKTexture]!
    var pageOneFlorryOne: SKSpriteNode!
    var pageOneFlorryOneWings: SKSpriteNode!
    var pageOneFlorryTwo: SKSpriteNode!
    var pageOneFlorryTwoWings: SKSpriteNode!
    var pageOneFlorryThree: SKSpriteNode!
    var pageOneWaterMask: SKSpriteNode!

    //page Two
    
    var pageTwoBall: SKSpriteNode!
    var pageTwoClam1: SKSpriteNode!
    var pageTwoClam2: SKSpriteNode!
    var pageTwoClam3: SKSpriteNode!
    var pageTwoClam4: SKSpriteNode!
    var pageTwoLighthouse: SKSpriteNode!
    var pageTwoCloud: SKSpriteNode!
    var pageTwoSun: SKSpriteNode!
    var pageTwoCrabBody: SKSpriteNode!
    var pageTwoCrabPincer1: SKSpriteNode!
    var pageTwoCrabPincer2: SKSpriteNode!
    var pageTwoCrabPincer3: SKSpriteNode!
    var pageTwoCrabEyebrows: SKSpriteNode!
    var pageTwoGrass: SKSpriteNode!
    var pageTwoSnail: SKSpriteNode!
    var pageTwoSnailWhite: SKSpriteNode!
    var pageTwoCornerCloud: SKSpriteNode!
    var pageTwoSizzle: SKSpriteNode!
    var pageTwoEyes: SKSpriteNode!
    var pageTwoLighthouseYellowWindow1: SKSpriteNode!
    var pageTwoLighthouseYellowWindow2: SKSpriteNode!
    var pageTwoLighthouseYellowWindow3: SKSpriteNode!



    //page Three
    
    var pageThreeSun: SKSpriteNode!
   
    var pageThreeClam: SKSpriteNode!
    var pageThreeGrass1: SKSpriteNode!
    var pageThreeGrass2: SKSpriteNode!
    var pageThreeCrabBody: SKSpriteNode!
    var pageThreeCrabPincer1: SKSpriteNode!
    var pageThreeCrabPincer2: SKSpriteNode!
    var pageThreeCrabPincer3: SKSpriteNode!
    var pageThreeBall: SKSpriteNode!
    var pageThreeCloud: SKSpriteNode!
    var pageThreeStarfishInBucketBody: SKSpriteNode!
    var pageThreeBucketHandle: SKSpriteNode!
    var pageThreeStarfishEyes: SKSpriteNode!
    var pageThreeBird: SKSpriteNode!
    var pageThreeSand: SKSpriteNode!

    var pageThreeRocks: SKSpriteNode!

    //page Four
    
    var pageFourMattHand: SKSpriteNode!
    var pageFourMarcoHand: SKSpriteNode!
    var pageFourBird1: SKSpriteNode!
    var pageFourBird1Animation : [SKTexture]!
    var pageFourBird2: SKSpriteNode!
    var pageFourBird2Animation : [SKTexture]!
    var pageFourCloud: SKSpriteNode!
    var pageFourCrabBody: SKSpriteNode!
    var pageFourCrabPincer1: SKSpriteNode!
    var pageFourCrabPincer2: SKSpriteNode!
    var pageFourCrabPincer3: SKSpriteNode!
    var pageFourCrabPincer4: SKSpriteNode!
    var pageFourCrabLeftClaw: SKSpriteNode!
    var pageFourCrabRightClaw: SKSpriteNode!
    var pageFourStarfish: SKSpriteNode!
    var pageFourClam1: SKSpriteNode!
    var pageFourClam2: SKSpriteNode!
    var pageFourClam3: SKSpriteNode!
    var pageFourClam4: SKSpriteNode!
    var pageFourClam5: SKSpriteNode!
    var pageFourRock: SKSpriteNode!

    //page Five
    
    var pageFiveLeftShed: SKSpriteNode!
    var pageFiveRightShed: SKSpriteNode!
    var pageFiveBird: SKSpriteNode!
    var pageFiveBirdAnimation : [SKTexture]!
    var pageFiveLeftBoot: SKSpriteNode!
    var pageFiveRightBoot: SKSpriteNode!
    var pageFiveCrabBody: SKSpriteNode!
    var pageFiveCrabRightClaw: SKSpriteNode!
    var pageFiveStarfish: SKSpriteNode!
    var pageFiveMarcoLeg: SKSpriteNode!
    var pageFiveThump: SKSpriteNode!
    var pageFiveMattLeftHand: SKSpriteNode!
    var pageFiveMattRightHand: SKSpriteNode!
    var pageFiveRock: SKSpriteNode!
    var pageFiveBall: SKSpriteNode!
    var p5lsc = 0
    var p5rsc = 0
    var p5lbc = 0
    var p5rbc = 0
    //page Six
    
    var pageSixSnail: SKSpriteNode!
  //  var pageSixSnailWhite: SKSpriteNode!
    var pageSixSun: SKSpriteNode!
    var pageSixBoot1: SKSpriteNode!
    var pageSixBoot2: SKSpriteNode!
   // var pageSixBoot3: SKSpriteNode!
    //var pageSixBoot4: SKSpriteNode!
    var pageSixSpider: SKSpriteNode!
    //var pageSixSpiderWeb: SKSpriteNode!
    var pageSixCrabPincer1: SKSpriteNode!
    var pageSixCrabPincer2: SKSpriteNode!
    var pageSixCrabPincer3: SKSpriteNode!
    var pageSixCrabEyebrows: SKSpriteNode!
    var pageSixBall: SKSpriteNode!
    var pageSixThumpText: SKSpriteNode!
    var pageSixThumpImage: SKSpriteNode!
    var pageSixStarfish: SKSpriteNode!
    //var pageSixGrass1: SKSpriteNode!
    //var pageSixGrass2: SKSpriteNode!
    var pageSixClam1: SKSpriteNode!
    var pageSixClam2: SKSpriteNode!
    var pageSixClam3: SKSpriteNode!
    var p6b1 = 0
    var p6b2 = 0

    
    //page Seven
    
    var pageSevenBall: SKSpriteNode!
    
    var pageSevenLeaf1: SKSpriteNode!
    var pageSevenLeaf2: SKSpriteNode!
    var pageSevenLeaf3: SKSpriteNode!
    var pageSevenLeaf4: SKSpriteNode!
    var pageSevenEvieArm: SKSpriteNode!
    var pageSevenOlly: SKSpriteNode!
  //  var pageSevenVase: SKSpriteNode!
    var pageSevenPicture: SKSpriteNode!
   // var pageSevenMattArm: SKSpriteNode!
    //var pageSevenMarcoArm: SKSpriteNode!
    var pageSevenBlock1: SKSpriteNode!
    var pageSevenBlock2: SKSpriteNode!
    var pageSevenBlock3: SKSpriteNode!
    var pageSevenBlock4: SKSpriteNode!
    var pageSevenBlock5: SKSpriteNode!
    var pageSevenBlock6: SKSpriteNode!
    var pageSevenBlock7: SKSpriteNode!
    var pageSevenBlock8: SKSpriteNode!
    var pageSevenEvieMask: SKSpriteNode!
    var p7p = 0
    var p7b5 = 1

    //page Eight
    
    var pageEightFlorry1: SKSpriteNode!
    var pageEightFlorry1Wings: SKSpriteNode!
    var pageEightFlorry2: SKSpriteNode!
    var pageEightFlorry2Wings: SKSpriteNode!
    
    var pageEightBootSet1: SKSpriteNode!
    var pageEightBootSet2: SKSpriteNode!
    var pageEightPaddy: SKSpriteNode!
    var pageEightSeahorse: SKSpriteNode!
    var pageEightWheel: SKSpriteNode!
    var pageEightGreenPlant: SKSpriteNode!
    var pageEightRedOrangePlant: SKSpriteNode!
    var pageEightStarfish: SKSpriteNode!
   // var pageEightBubble1: SKSpriteNode!
   // var pageEightBubble2: SKSpriteNode!
   // var pageEightBubble3: SKSpriteNode!
    var pageEightJellyfish: SKSpriteNode!
    var pageEightRocks: SKSpriteNode!
    var p8RO = 0
    var p8G = 0
    var p8BS1 = 0
    var p8BS2 = 0
    //page Nine
    
    var pageNineWorm: SKSpriteNode!
    var pageNineStarfish: SKSpriteNode!
    var pageNineJellyfish: SKSpriteNode!
    var pageNinePaddy: SKSpriteNode!
    var pageNineLizard: SKSpriteNode!
    var pageNineClam1: SKSpriteNode!
    var pageNineClam2: SKSpriteNode!
    var pageNineClam3: SKSpriteNode!
 //   var pageNinePinkReef: SKSpriteNode!
    var pageNineRedGreenPlant: SKSpriteNode!
    var pageNineSeahorse: SKSpriteNode!
    var pageNineFlorry: SKSpriteNode!
    var pageNineFlorryWings: SKSpriteNode!
  //  var pageNineBubble1: SKSpriteNode!
  //  var pageNineBubble2: SKSpriteNode!
  //  var pageNineBubble3: SKSpriteNode!
// var pageNineBubble4: SKSpriteNode!
    // var pageNineBubble5: SKSpriteNode!
   // var pageNineBubble6: SKSpriteNode!
    var p9RG = 0
    var p9L = 0
    
    //page Ten
    var pageTenFurtherInfo: SKSpriteNode!

    //games portal page
    var kickupsButton: SKSpriteNode!
    var raceButton: SKSpriteNode!
    var paintButton: SKSpriteNode!
    var countButton: SKSpriteNode!
    var popButton: SKSpriteNode!
    var spotButton: SKSpriteNode!
    var mmGamesButon: SKSpriteNode!

    //ads
    var blankDirBar: SKSpriteNode!
    var comeDir: SKSpriteNode!
    var tapDir: SKSpriteNode!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
    }
    
   
    
    override init(size: CGSize) {
        super.init(size: size)
        
        let defaults = NSUserDefaults.standardUserDefaults()
       /* if let musicValue: String? = defaults.stringForKey("musicValue"){
            music = musicValue!
            print("\(music!)")
            //maybe the value always exists and initiialises with nil
            // if val == nil {} else {}
        } else  {
            defaults.setValue("on", forKey: "musicValue")
            music = "on"
        }
        if let effectsValue: String? = defaults.stringForKey("effectsValue"){
            effects = effectsValue!
            print("\(effects!)")
        } else  {
            defaults.setValue("on", forKey: "effectsValue")
            effects = "on"
        }*/
        if let musicValue: String? = defaults.stringForKey("musicValue"){
            if musicValue == nil {
                print("musval is nil")
                music = "on"
                defaults.setValue("on", forKey: "musicValue")
            }
            else {
                print("musval is NOT nil")
                music = musicValue!
                defaults.setValue(music, forKey: "musicValue")
            }
        } else {}
        if let effectsValue: String? = defaults.stringForKey("effectsValue"){
            if effectsValue == nil {
                print("effval is nil")
                effects = "on"
            }
            else {
                print("effval is NOT nil")
                effects = effectsValue!
            }
        } else {}
        defaults.synchronize()
        
        MusicPlayer.sharedInstance().playBackgroundMusic("bkMusic.wav")
        if music == "on" {
            MusicPlayer.sharedInstance().fadeIn()
        } else {
            MusicPlayer.sharedInstance().pauseWithVolume()
            
        }
        
        pageInUse = page.titlePage
        
        
        
        musicLabel = SKLabelNode(fontNamed: "Futura-Medium")
        musicLabel.text = "Music: \(music)"
        musicLabel.fontSize = 30
        musicLabel.fontColor = UIColor.blackColor()

        effectsLabel = SKLabelNode(fontNamed: "Futura-Medium")
        effectsLabel.text = "Effects: \(effects)"
        effectsLabel.fontSize = 30
        effectsLabel.fontColor = UIColor.blackColor()
        
        storyLabel = SKLabelNode(fontNamed: "Futura-Medium")
        storyLabel.text = "Story: Patricia Melia"
        storyLabel.fontSize = 20
        storyLabel.fontColor = UIColor.blackColor()
        
        artLabel = SKLabelNode(fontNamed: "Futura-Medium")
        artLabel.text = "Art: Garry Thorburn"
        artLabel.fontSize = 20
        artLabel.fontColor = UIColor.blackColor()
        
        codeLabel = SKLabelNode(fontNamed: "Futura-Medium")
        codeLabel.text = "Coding/Music: Simon Melia"
        codeLabel.fontSize = 20
        codeLabel.fontColor = UIColor.blackColor()
        
        copyrightLabel = SKLabelNode(fontNamed: "Futura-Medium")
        copyrightLabel.text = " Copyright © 2016 Simon Melia"
        copyrightLabel.fontSize = 15
        copyrightLabel.fontColor = UIColor.blackColor()
        
        copyright2Label = SKLabelNode(fontNamed: "Futura-Medium")
        copyright2Label.text = "All rights reserved"
        copyright2Label.fontSize = 15
        copyright2Label.fontColor = UIColor.blackColor()
        
        games1Label = SKLabelNode(fontNamed: "Futura-Medium")
        games1Label.text = "Choose a game"
        games1Label.fontSize = 30
        games1Label.fontColor = UIColor.blackColor()
        
        games2Label = SKLabelNode(fontNamed: "Futura-Medium")
        games2Label.text = "to play!"
        games2Label.fontSize = 30
        games2Label.fontColor = UIColor.blackColor()
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
             introReadButton = SKSpriteNode(imageNamed: "readBookLabeliPadPro")
             introSettingsButton = SKSpriteNode(imageNamed: "settingsLabeliPadPro")
             playGamesButton = SKSpriteNode(imageNamed: "playGamesLabeliPadPro")
             websiteButton = SKSpriteNode(imageNamed: "websiteLabeliPadPro")
             aboutUsButton = SKSpriteNode(imageNamed: "aboutUsLabeliPadPro")
             background = SKSpriteNode(imageNamed: "blankWhiteiPadPro")
             reef = SKSpriteNode(imageNamed: "reefiPadPro")
             imageMask = SKSpriteNode(imageNamed: "imageViewMaskiPadPro")
             pageBase = SKSpriteNode(imageNamed: "baseTitleImageiPadPro")
            
             titlePart1 = SKSpriteNode(imageNamed: "titlePart1iPadPro")
             titlePart2 = SKSpriteNode(imageNamed: "titlePart2iPadPro")
             titlePart3 = SKSpriteNode(imageNamed: "titlePart3iPadPro")
             frontBall = SKSpriteNode(imageNamed: "frontBalliPadPro")
             titleFish = SKSpriteNode(imageNamed: "titleFishiPadPro")
             titlePaddy = SKSpriteNode(imageNamed: "titlePaddyiPadPro")
             titleSeahorse = SKSpriteNode(imageNamed: "titleSeahorseiPadPro")
             titleSnail = SKSpriteNode(imageNamed: "titleSnailiPadPro")
             titleJellyfish = SKSpriteNode(imageNamed: "titleJellyfishiPadPro")

            
        default:
            introReadButton = SKSpriteNode(imageNamed: "readBookLabel")
            introSettingsButton = SKSpriteNode(imageNamed: "settingsLabel")
            playGamesButton = SKSpriteNode(imageNamed: "playGamesLabel")
            websiteButton = SKSpriteNode(imageNamed: "websiteLabel")
            aboutUsButton = SKSpriteNode(imageNamed: "aboutUsLabel")
            background = SKSpriteNode(imageNamed: "blankWhite")
            reef = SKSpriteNode(imageNamed: "reef")
            imageMask = SKSpriteNode(imageNamed: "imageViewMask")
            pageBase = SKSpriteNode(imageNamed: "baseTitleImage")
            
            titlePart1 = SKSpriteNode(imageNamed: "titlePart1")
            titlePart2 = SKSpriteNode(imageNamed: "titlePart2")
            titlePart3 = SKSpriteNode(imageNamed: "titlePart3")
            frontBall = SKSpriteNode(imageNamed: "frontBall")
            titleFish = SKSpriteNode(imageNamed: "titleFish")
            titlePaddy = SKSpriteNode(imageNamed: "titlePaddy")
            titleSeahorse = SKSpriteNode(imageNamed: "titleSeahorse")
            titleSnail = SKSpriteNode(imageNamed: "titleSnail")
            titleJellyfish = SKSpriteNode(imageNamed: "titleJellyfish")
        }
        
        
        background.position = CGPointMake(self.size.width/2, self.size.height/2)
        imageMask.position = CGPointMake(1350*self.size.width/2048, self.size.height/2)
        reef.position = CGPointMake(330*self.size.width/2048, 68*self.size.height/1536)
        introReadButton.position = CGPointMake(327*self.size.width/2048, 1193*self.size.height/1536)
        playGamesButton.position = CGPointMake(327*self.size.width/2048, 969*self.size.height/1536)
        introSettingsButton.position = CGPointMake(327*self.size.width/2048, 767*self.size.height/1536)
        websiteButton.position = CGPointMake(327*self.size.width/2048, 566*self.size.height/1536)
        aboutUsButton.position = CGPointMake(327*self.size.width/2048, 364*self.size.height/1536)
        pageBase.position = CGPointMake(1350*self.size.width/2048, 861*self.size.height/1536)
        titlePart1.position = CGPointMake(1050*self.size.width/2048, 1354*self.size.height/1536 + self.size.height/2)
        titlePart2.position = CGPointMake(1402*self.size.width/2048, 1206*self.size.height/1536)
        titlePart3.position = CGPointMake(1537*self.size.width/2048, 1124*self.size.height/1536)
        frontBall.position = CGPointMake(1535*self.size.width/2048, 928*self.size.height/1536)
        crab.position = CGPointMake(1787*self.size.width/2048, 475*self.size.height/1536)
        crabLeft.position = CGPointMake(1789*self.size.width/2048, 456*self.size.height/1536)
        crabRight.position = CGPointMake(1820*self.size.width/2048, 423*self.size.height/1536)

        titleFish.position = CGPointMake(105*self.size.width/2048, 1085*self.size.height/1536)
        titlePaddy.position = CGPointMake(503*self.size.width/2048, 862*self.size.height/1536)
        titleSeahorse.position = CGPointMake(84*self.size.width/2048, 1410*self.size.height/1536)
        titleSnail.position = CGPointMake(100*self.size.width/2048, 675*self.size.height/1536)
        titleJellyfish.position = CGPointMake(542*self.size.width/2048, 205*self.size.height/1536)
        
        musicLabel.position = CGPointMake(327*self.size.width/2048, 868*self.size.height/1536)
        effectsLabel.position = CGPointMake(327*self.size.width/2048, 668*self.size.height/1536)
        storyLabel.position = CGPointMake(327*self.size.width/2048, 868*self.size.height/1536)
        artLabel.position = CGPointMake(327*self.size.width/2048, 768*self.size.height/1536)
        codeLabel.position = CGPointMake(327*self.size.width/2048, 668*self.size.height/1536)
        copyrightLabel.position = CGPointMake(327*self.size.width/2048, 268*self.size.height/1536)
        copyright2Label.position = CGPointMake(327*self.size.width/2048, 218*self.size.height/1536)

        games1Label.position = CGPointMake(327*self.size.width/2048, 868*self.size.height/1536)
        games2Label.position = CGPointMake(327*self.size.width/2048, 668*self.size.height/1536)

        
        for object in [background,reef,introReadButton,introSettingsButton,playGamesButton,websiteButton,aboutUsButton,touchLayer,titleFish,titlePaddy,titleSeahorse,titleSnail,titleJellyfish,titlePart1,titlePart2,titlePart3,pageBase,imageMask,frontBall,crab,crabLeft,crabRight,musicLabel,effectsLabel,storyLabel,artLabel,codeLabel,copyrightLabel,copyright2Label,games1Label,games2Label] {
            addChild(object)

            
            
        }
        
        
        background.zPosition = 1
        pageBase.zPosition = 5
        frontBall.zPosition = 7
        imageMask.zPosition = 4
        for object in [reef,introReadButton,introSettingsButton,playGamesButton,websiteButton,aboutUsButton,titleFish,titlePaddy,titleSeahorse,titleSnail,titleJellyfish] {
            object.zPosition = 3
        }
        crabLeft.zPosition = 5
        crabRight.zPosition = 5

        for object in [titlePart1,titlePart2,titlePart3,crab] {
            object.zPosition = 6
        }
        
        crabLeft.anchorPoint = CGPointMake(1.0, 0)
        crabRight.anchorPoint = CGPointMake(0, 0)
        titleSeahorse.xScale = -1.0
        
        for label in [musicLabel,effectsLabel,storyLabel,artLabel,codeLabel,copyrightLabel,copyright2Label,games1Label,games2Label] {
            label.zPosition = 5
            label.runAction(SKAction.fadeOutWithDuration(0))
        }
        
       bubbleTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(MainMenuScene.randomBubbleGenerator), userInfo: nil, repeats: true)
        
        
        titlePageAnimations()
        addDir()
        

    
    }
    
    func addDir() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            blankDirBar = SKSpriteNode(imageNamed: "dirBarBkiPadPro")
            comeDir = SKSpriteNode(imageNamed: "comeDiriPadPro")
            tapDir = SKSpriteNode(imageNamed: "tapDiriPadPro")

        default:
            blankDirBar = SKSpriteNode(imageNamed: "dirBarBk")
            comeDir = SKSpriteNode(imageNamed: "comeDir")
            tapDir = SKSpriteNode(imageNamed: "tapDir")

        }
        
        blankDirBar.position = CGPointMake(1350*self.size.width/2048, 93*self.size.height/1536)
        comeDir.position = CGPointMake(1350*self.size.width/2048, 93*self.size.height/1536)
        tapDir.position = CGPointMake(1350*self.size.width/2048, 93*self.size.height/1536)

        blankDirBar.zPosition = 7
        comeDir.zPosition = 8
        tapDir.zPosition = 8

        for object in [blankDirBar,comeDir,tapDir] {
            addChild(object)
        }
        
        tapDir.hidden = true
    }
    
    func titlePageAnimations() {
        bringDownTitle()
        moveTitleBall()
        moveTitleCrab()
        for object in ["titleBird1"] {
            
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            switch screenSize.height {
            case 1366:
            loadTitlePageObjectAtlasiPadPro(object)
            default:
            loadTitlePageObjectAtlasiPad(object)
            }
                
        }
        changeTitleObjectTextures()

    }
   
    
    func bringDownTitle() {
        let titleMoveP1 = SKAction.moveToY(1354*self.size.height/1536 - self.size.height/100, duration: 0.5)
        let titleMoveP2 = SKAction.moveByX(0, y: self.size.height/100, duration: 0.1)
        titlePart1.runAction(SKAction.sequence([titleMoveP1,titleMoveP2]))
        let waitTitle2 = SKAction.waitForDuration(0.5)
        let waitTitle3 = SKAction.waitForDuration(0.75)
        let enlarge = SKAction.scaleTo(1.25, duration: 0.15)
        let shrink = SKAction.scaleTo(1.0, duration: 0.15)
        titlePart1.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.waitForDuration(10.0),enlarge,shrink])))
        titlePart2.runAction(SKAction.repeatActionForever(SKAction.sequence([waitTitle2,enlarge,shrink,SKAction.waitForDuration(10.0)])))
        titlePart3.runAction(SKAction.repeatActionForever(SKAction.sequence([waitTitle3,enlarge,shrink,SKAction.waitForDuration(10.0)])))

    }
    
    func moveTitleBall() {
        
        frontBall.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.waitForDuration(1.0),
            SKAction.moveByX(0, y: self.size.height/10, duration: 0.15),
            SKAction.moveByX(0, y: self.size.height/15, duration: 0.20),
            SKAction.moveByX(0, y: self.size.height/20, duration: 0.25),
            SKAction.moveByX(0, y: self.size.height/25, duration: 0.30),
            SKAction.waitForDuration(0.05),
            SKAction.moveByX(0, y: -self.size.height/25, duration: 0.30),
            SKAction.moveByX(0, y: -self.size.height/20, duration: 0.25),
            SKAction.moveByX(0, y: -self.size.height/15, duration: 0.20),
            SKAction.moveByX(0, y: -self.size.height/10, duration: 0.15),
            SKAction.moveByX(0, y: -self.size.height/60, duration: 0.15),
            SKAction.moveByX(0, y: self.size.height/60, duration: 0.15),
            SKAction.waitForDuration(2.0)
            ])))
               
        
    }
    
    func moveTitleCrab() {
        crabLeft.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.waitForDuration(0.5),
            SKAction.rotateByAngle(15*3.14/180, duration: 0.5),
            SKAction.rotateByAngle(-15*3.14/180, duration: 0.5),
            SKAction.waitForDuration(0.5)
            ])))
        
        crabRight.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.waitForDuration(0.5),
            SKAction.rotateByAngle(-15*3.14/180, duration: 0.5),
            SKAction.rotateByAngle(15*3.14/180, duration: 0.5),
            SKAction.waitForDuration(0.5)
            ])))
        
        
        
        
    }
    
    func randomBubbleGenerator() {
        print("MAIN MENU BUBBLE GENERATOR CALLED")
        
        let bubbleArray = ["bubble1","bubble2","bubble3","bubble4","bubble5"]
        let randomBubbleIndex = Int(arc4random_uniform(UInt32(bubbleArray.count)))
        let bubbleString: String = bubbleArray[randomBubbleIndex]
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
             bubble = SKSpriteNode(imageNamed: bubbleString + "iPadPro")
        default:
             bubble = SKSpriteNode(imageNamed: bubbleString)
        }
        let randomNo = CGFloat(Int(arc4random_uniform(550)+50))
        let startPoint = CGPointMake(randomNo*self.size.width/2048, -50*self.size.height/1536)
        let endPoint = CGPointMake(randomNo*self.size.width/2048, 3*self.size.height/2)
        let wait = SKAction.waitForDuration(0.1, withRange: 4.0)
        let rand =  Double(arc4random_uniform(10)+5)
        let move = SKAction.moveTo(endPoint, duration: rand)
        bubble.position = startPoint
        addChild(bubble)
        bubble.zPosition = 2
        bubble.runAction(SKAction.sequence([wait,move,SKAction.removeFromParent()]))
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        ////dont need special part for ipadpro as it is scaled automatically from ipad
        if canTouch == true {
        if let touch: UITouch = touches.first {
            let location = touch.locationInNode(touchLayer)
            touchx = CGFloat(location.x)
            touchy = CGFloat(location.y)
         
            if pageInUse == page.titlePage {
                if (touchx > 0 && touchy > 1137*self.size.height/1536 && touchx < 650*self.size.width/2048 && touchy < 1244*self.size.height/1536) {
                    MusicPlayer.sharedInstance().fadeOut()
                    readButtonPressed()
                    _ = NSTimer.scheduledTimerWithTimeInterval(0.35, target: self, selector: #selector(MainMenuScene.moveToNextPage), userInfo: nil, repeats: false)
                }
                else if (touchx > 0 && touchy > 930*self.size.height/1536 && touchx < 650*self.size.width/2048 && touchy < 1005*self.size.height/1536) {
                    gamesButtonPressed()
                }
                else if (touchx > 0*self.size.width/2048 && touchy > 730*self.size.height/1536 && touchx < 650*self.size.width/2048 && touchy < 805*self.size.height/1536) {
                    homePageSettingsButtonPressed()
                }
                else if (touchx > 0 && touchy > 530*self.size.height/1536 && touchx < 650*self.size.width/2048 && touchy < 600*self.size.height/1536) {
                    websiteButtonPressed()
                }
                else if (touchx > 0*self.size.width/2048 && touchy > 330*self.size.height/1536 && touchx < 650*self.size.width/2048 && touchy < 400*self.size.height/1536) {
                    aboutButtonPressed()
                }
                else if (touchx > 653*self.size.width/2048 && touchy > 0*self.size.height/1536 && touchx < 2048*self.size.width/2048 && touchy < 186*self.size.height/1536) {
                    if let url = NSURL(string: "http://www.ollyoctopus.com/buy.html") {
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
            }
            else if pageInUse == page.settingsPage {
                if (touchx > 10*self.size.width/2048 && touchy > 1426*self.size.height/1536 && touchx < 120*self.size.width/2048 && touchy < 1526*self.size.height/1536) {
                    
                    returnToBook()
                    
                }
                if (musicLabel.containsPoint(location)) {
                    changeMusicLabel()
                }
                else if (effectsLabel.containsPoint(location)) {
                    changeEffectsLabel()
                }
                
                
            }
            else if pageInUse == page.introSettingsPage {
                if (touchx > 292*self.size.width/2048 && touchy > 1418*self.size.height/1536 && touchx < 368*self.size.width/2048 && touchy < 1494*self.size.height/1536) {
                    
                    returnToHomePage()
                    
                }
                else if (touchx > 653*self.size.width/2048 && touchy > 0*self.size.height/1536 && touchx < 2048*self.size.width/2048 && touchy < 186*self.size.height/1536) {
                    if let url = NSURL(string: "http://www.ollyoctopus.com/buy.html") {
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
                
                if (musicLabel.containsPoint(location)) {
                    changeMusicLabel()
                }
                else if (effectsLabel.containsPoint(location)) {
                    changeEffectsLabel()
                }
            }
            else if pageInUse == page.miniGamesPortalPage {
                if (touchx > 828*self.size.width/2048 && touchy > 946*self.size.height/1536 && touchx < 1072*self.size.width/2048 && touchy < 1224*self.size.height/1536) {
                    kickupsButtonPressed()
                }
                else if (touchx > 1228*self.size.width/2048 && touchy > 946*self.size.height/1536 && touchx < 1472*self.size.width/2048 && touchy < 1224*self.size.height/1536) {
                    naughtButtonPressed()

                }
                else if (touchx > 1628*self.size.width/2048 && touchy > 946*self.size.height/1536 && touchx < 1872*self.size.width/2048 && touchy < 1224*self.size.height/1536) {
                    memoryButtonPressed()

                }
                else if (touchx > 828*self.size.width/2048 && touchy > 495*self.size.height/1536 && touchx < 1072*self.size.width/2048 && touchy < 773*self.size.height/1536) {
                    countButtonPressed()

                }
                else if (touchx > 1228*self.size.width/2048 && touchy > 495*self.size.height/1536 && touchx < 1472*self.size.width/2048 && touchy < 773*self.size.height/1536) {
                    popButtonPressed()

                }
                else if (touchx > 1628*self.size.width/2048 && touchy > 495*self.size.height/1536 && touchx < 1872*self.size.width/2048 && touchy < 773*self.size.height/1536) {
                    didButtonPressed()
                }
                else if (touchx > 292*self.size.width/2048 && touchy > 1418*self.size.height/1536 && touchx < 368*self.size.width/2048 && touchy < 1494*self.size.height/1536) {
                    
                    returnToHomePage()
                    
                }
                else if (touchx > 653*self.size.width/2048 && touchy > 0*self.size.height/1536 && touchx < 2048*self.size.width/2048 && touchy < 186*self.size.height/1536) {
                    if let url = NSURL(string: "http://www.ollyoctopus.com/buy.html") {
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
                
                
            }
            else if pageInUse == page.aboutUsPage {
                if (touchx > 292*self.size.width/2048 && touchy > 1418*self.size.height/1536 && touchx < 368*self.size.width/2048 && touchy < 1494*self.size.height/1536) {
                    
                    returnToHomePage()
                    
                }
                else if (touchx > 653*self.size.width/2048 && touchy > 0*self.size.height/1536 && touchx < 2048*self.size.width/2048 && touchy < 186*self.size.height/1536) {
                    if let url = NSURL(string: "http://www.ollyoctopus.com/buy.html") {
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
            }
            else if pageInUse == page.creditsPage {
                if (touchx > 26*self.size.width/2048 && touchy > 200*self.size.height/1536 && touchx < 2048*self.size.width/2048 && touchy < 650*self.size.height/1536) {
                    
                    websiteButtonPressed()
                    
                }
                else if (touchx > 10*self.size.width/2048 && touchy > 1426*self.size.height/1536 && touchx < 120*self.size.width/2048 && touchy < 1526*self.size.height/1536) {
                    
                    backButtonTouched()
                    
                }
                else if (touchx > 162*self.size.width/2048 && touchy > 1419*self.size.height/1536 && touchx < 242*self.size.width/2048 && touchy < 1494*self.size.height/1536) {
                    
                    homeButtonTouched()
                    
                }
                else if (touchx > 292*self.size.width/2048 && touchy > 1418*self.size.height/1536 && touchx < 368*self.size.width/2048 && touchy < 1494*self.size.height/1536) {
                    
                    pageToReturnTo = pageInUse
                    settingsButtonTouched()
                }
                else if (touchx > 420*self.size.width/2048 && touchy > 1418*self.size.height/1536 && touchx < 493*self.size.width/2048 && touchy < 1498*self.size.height/1536) {
                    
                    volumeButtonTouched()
                }
                else if (touchx > 653*self.size.width/2048 && touchy > 0*self.size.height/1536 && touchx < 2048*self.size.width/2048 && touchy < 186*self.size.height/1536) {
                    if let url = NSURL(string: "http://www.ollyoctopus.com/news.html") {
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
            }
            else {
                if (touchx > 540*self.size.width/2048 && touchy > 1426*self.size.height/1536 && touchx < 650*self.size.width/2048 && touchy < 1526*self.size.height/1536) {
                    fowardButtonTouched()
                    
                }
                else if (touchx > 10*self.size.width/2048 && touchy > 1426*self.size.height/1536 && touchx < 120*self.size.width/2048 && touchy < 1526*self.size.height/1536) {

                    backButtonTouched()
                    
                }
                else if (touchx > 162*self.size.width/2048 && touchy > 1419*self.size.height/1536 && touchx < 242*self.size.width/2048 && touchy < 1494*self.size.height/1536) {
                    
                    homeButtonTouched()
                }
                else if (touchx > 292*self.size.width/2048 && touchy > 1418*self.size.height/1536 && touchx < 368*self.size.width/2048 && touchy < 1494*self.size.height/1536) {
                    
                    pageToReturnTo = pageInUse
                    settingsButtonTouched()
                }
                else if (touchx > 420*self.size.width/2048 && touchy > 1418*self.size.height/1536 && touchx < 493*self.size.width/2048 && touchy < 1498*self.size.height/1536) {
                    
                    volumeButtonTouched()
                }

           }
        
            
            //this bit for animation
            if effects == "on" {
            if pageInUse == page.page1Part1 || pageInUse == page.page1Part2 {
                
                if (touchx > 720*self.size.width/2048 && touchy > 540*self.size.height/1536 && touchx < 850*self.size.width/2048 && touchy < 670*self.size.height/1536) {
                        pageOneStarfishPressed()
                }
                else if (touchx > 720*self.size.width/2048 && touchy > 210*self.size.height/1536 && touchx < 770*self.size.width/2048 && touchy < 255*self.size.height/1536) {
                    pageOneClamOnePressed()
                }
                else if (touchx > 670*self.size.width/2048 && touchy > 400*self.size.height/1536 && touchx < 750*self.size.width/2048 && touchy < 470*self.size.height/1536) {
                    pageOneClamsTwoThreePressed()
                }
                else if ((touchx > 765*self.size.width/2048 && touchy > 790*self.size.height/1536 && touchx < 1000*self.size.width/2048 && touchy < 980*self.size.height/1536) || (touchx > 1110*self.size.width/2048 && touchy > 395*self.size.height/1536 && touchx < 1350*self.size.width/2048 && touchy < 582*self.size.height/1536) ) {
                    pageOneFlorryOneTwoPressed()
                }
                else if (touchx > 1664*self.size.width/2048 && touchy > 310*self.size.height/1536 && touchx < 1800*self.size.width/2048 && touchy < 415*self.size.height/1536) {
                    pageOneFlorryThreePressed()
                }
                else if (touchx > 1075*self.size.width/2048 && touchy > 1405*self.size.height/1536 && touchx < 1280*self.size.width/2048 && touchy < 1506*self.size.height/1536) {
                    changePageOneObjectTextures()
                }
                
            }
              
            else if pageInUse == page.page2Part1 || pageInUse == page.page2Part2 {
                if (touchx > 1110*self.size.width/2048 && touchy > 400*self.size.height/1536 && touchx < 1295*self.size.width/2048 && touchy < 565*self.size.height/1536) {
                    pageTwoBallPressed()
                }
                else if (touchx > 810*self.size.width/2048 && touchy > 520*self.size.height/1536 && touchx < 905*self.size.width/2048 && touchy < 610*self.size.height/1536) {
                    pageTwoClam1Pressed()
                }
                else if (touchx > 990*self.size.width/2048 && touchy > 220*self.size.height/1536 && touchx < 1050*self.size.width/2048 && touchy < 280*self.size.height/1536) {
                    pageTwoClam2Pressed()
                }
                else if (touchx > 1580*self.size.width/2048 && touchy > 235*self.size.height/1536 && touchx < 1655*self.size.width/2048 && touchy < 299*self.size.height/1536) {
                    pageTwoClam3Pressed()
                }
                else if (touchx > 1675*self.size.width/2048 && touchy > 290*self.size.height/1536 && touchx < 1725*self.size.width/2048 && touchy < 340*self.size.height/1536) {
                    pageTwoClam4Pressed()
                }
                else if (touchx > 720*self.size.width/2048 && touchy > 1130*self.size.height/1536 && touchx < 825*self.size.width/2048 && touchy < 1435*self.size.height/1536) {
                    pageTwoLighthousePressed()
                }
                else if (touchx > 1300*self.size.width/2048 && touchy > 1330*self.size.height/1536 && touchx < 1685*self.size.width/2048 && touchy < 1465*self.size.height/1536) {
                    pageTwoCloudPressed()
                }
               /* else if (touchx > 1735*self.size.width/2048 && touchy > 1335*self.size.height/1536 && touchx < 1920*self.size.width/2048 && touchy < 1515*self.size.height/1536) {
                    pageTwoSunPressed()
                }*/
                else if (touchx > 825*self.size.width/2048 && touchy > 780*self.size.height/1536 && touchx < 1235*self.size.width/2048 && touchy < 970*self.size.height/1536) {
                    pageTwoCrabPressed()
                }
                else if (touchx > 1852*self.size.width/2048 && touchy > 288*self.size.height/1536 && touchx < 2029*self.size.width/2048 && touchy < 444*self.size.height/1536) {
                    pageTwoSnailPressed()
                }
                else if (touchx > 704*self.size.width/2048 && touchy > 280*self.size.height/1536 && touchx < 873*self.size.width/2048 && touchy < 440*self.size.height/1536) {
                    pageTwoStarfishPressed()
                }
                
            }
            
            else if pageInUse == page.page3Part1 || pageInUse == page.page3Part2 {
                if (touchx > 717*self.size.width/2048 && touchy > 255*self.size.height/1536 && touchx < 980*self.size.width/2048 && touchy < 426*self.size.height/1536) {
                    pageThreeStarfishBucketPressed()
                }
                else if (touchx > 1031*self.size.width/2048 && touchy > 286*self.size.height/1536 && touchx < 1115*self.size.width/2048 && touchy < 359*self.size.height/1536) {
                    pageThreeClamPressed()
                }
                else if (touchx > 1362*self.size.width/2048 && touchy > 354*self.size.height/1536 && touchx < 1585*self.size.width/2048 && touchy < 515*self.size.height/1536) {
                    pageThreeBirdPressed()
                }
                else if (touchx > 1632*self.size.width/2048 && touchy > 617*self.size.height/1536 && touchx < 1866*self.size.width/2048 && touchy < 902*self.size.height/1536) {
                    pageThreeCrabPressed()
                }
                else if (touchx > 1678*self.size.width/2048 && touchy > 1155*self.size.height/1536 && touchx < 2038*self.size.width/2048 && touchy < 1294*self.size.height/1536) {
                    pageThreeCloudPressed()
                }
                else if (touchx > 1512*self.size.width/2048 && touchy > 1321*self.size.height/1536 && touchx < 1648*self.size.width/2048 && touchy < 1451*self.size.height/1536) {
                    pageThreeSunPressed()
                }
                

            }
            
            else if pageInUse == page.page4Part1 || pageInUse == page.page4Part2 {
                if (touchx > 1379*self.size.width/2048 && touchy > 974*self.size.height/1536 && touchx < 1618*self.size.width/2048 && touchy < 1337*self.size.height/1536) {
                    pageFourMattMarcoPressed()
                }
                else if (touchx > 1622*self.size.width/2048 && touchy > 774*self.size.height/1536 && touchx < 1906*self.size.width/2048 && touchy < 961*self.size.height/1536) {
                    pageFourCrabPressed()
                }
                else if (touchx > 1438*self.size.width/2048 && touchy > 507*self.size.height/1536 && touchx < 1578*self.size.width/2048 && touchy < 657*self.size.height/1536) {
                    pageFourStarfishPressed()
                }
                else if (touchx > 703*self.size.width/2048 && touchy > 398*self.size.height/1536 && touchx < 768*self.size.width/2048 && touchy < 455*self.size.height/1536) {
                    pageFourClam1Pressed()
                }
                else if (touchx > 935*self.size.width/2048 && touchy > 402*self.size.height/1536 && touchx < 1053*self.size.width/2048 && touchy < 514*self.size.height/1536) {
                    pageFourClam2Pressed()
                }
                else if (touchx > 1127*self.size.width/2048 && touchy > 262*self.size.height/1536 && touchx < 1217*self.size.width/2048 && touchy < 356*self.size.height/1536) {
                    pageFourClam3Pressed()
                }
                else if (touchx > 1792*self.size.width/2048 && touchy > 325*self.size.height/1536 && touchx < 1979*self.size.width/2048 && touchy < 493*self.size.height/1536) {
                    pageFourClams45Pressed()
                }
                else if (touchx > 1140*self.size.width/2048 && touchy > 1439*self.size.height/1536 && touchx < 1302*self.size.width/2048 && touchy < 1536*self.size.height/1536) {
                    changePageFourObjectTextures()
                }
                else if (touchx > 654*self.size.width/2048 && touchy > 1299*self.size.height/1536 && touchx < 958*self.size.width/2048 && touchy < 1478*self.size.height/1536) {
                    pageFourCloudPressed()
                }
            }
            
            else if pageInUse == page.page5Part1 || pageInUse == page.page5Part2 {
                
                if (touchx > 665*self.size.width/2048 && touchy > 1084*self.size.height/1536 && touchx < 808*self.size.width/2048 && touchy < 1214*self.size.height/1536) {
                    pageFiveLeftShedPressed()
                }
                else if (touchx > 808*self.size.width/2048 && touchy > 1085*self.size.height/1536 && touchx < 932*self.size.width/2048 && touchy < 1190*self.size.height/1536) {
                    pageFiveRightShedPressed()
                }
                else if (touchx > 900*self.size.width/2048 && touchy > 1416*self.size.height/1536 && touchx < 1107*self.size.width/2048 && touchy < 1515*self.size.height/1536) {
                    changePageFiveObjectTextures()
                }
                else if (touchx > 1000*self.size.width/2048 && touchy > 600*self.size.height/1536 && touchx < 1112*self.size.width/2048 && touchy < 697*self.size.height/1536) {
                    pageFiveLeftBootPressed()
                }
                else if (touchx > 1558*self.size.width/2048 && touchy > 1038*self.size.height/1536 && touchx < 1670*self.size.width/2048 && touchy < 1135*self.size.height/1536) {
                    pageFiveRightBootPressed()
                }
                
                else if (touchx > 1558*self.size.width/2048 && touchy > 409*self.size.height/1536 && touchx < 1821*self.size.width/2048 && touchy < 960*self.size.height/1536) {
                    pageFiveMarcoPressed()
                }
                
                else if (touchx > 1116*self.size.width/2048 && touchy > 399*self.size.height/1536 && touchx < 1255*self.size.width/2048 && touchy < 473*self.size.height/1536) {
                    pageFiveRockPressed()
                }
                
            }
            
            else if pageInUse == page.page6Part1 || pageInUse == page.page6Part2 {
                
                if (touchx > 740*self.size.width/2048 && touchy > 285*self.size.height/1536 && touchx < 913*self.size.width/2048 && touchy < 445*self.size.height/1536) {
                    pageSixSnailPressed()
                }
                else if (touchx > 968*self.size.width/2048 && touchy > 1313*self.size.height/1536 && touchx < 1128*self.size.width/2048 && touchy < 1462*self.size.height/1536) {
                   // pageSixSunPressed()
                }
                else if (touchx > 751*self.size.width/2048 && touchy > 544*self.size.height/1536 && touchx < 933*self.size.width/2048 && touchy < 715*self.size.height/1536) {
                    pageSixBoot1Pressed()
                }
                else if (touchx > 1498*self.size.width/2048 && touchy > 661*self.size.height/1536 && touchx < 1680*self.size.width/2048 && touchy < 781*self.size.height/1536) {
                    pageSixBoot2Pressed()
                }
                else if (touchx > 1653*self.size.width/2048 && touchy > 376*self.size.height/1536 && touchx < 1753*self.size.width/2048 && touchy < 514*self.size.height/1536) {
                    pageSixSpiderPressed()
                }
                else if (touchx > 1808*self.size.width/2048 && touchy > 577*self.size.height/1536 && touchx < 2041*self.size.width/2048 && touchy < 821*self.size.height/1536) {
                    pageSixCrabPressed()
                }
                else if (touchx > 1508*self.size.width/2048 && touchy > 512*self.size.height/1536 && touchx < 1638*self.size.width/2048 && touchy < 630*self.size.height/1536) {
                    pageSixBallPressed()
                }
                else if (touchx > 1309*self.size.width/2048 && touchy > 350*self.size.height/1536 && touchx < 1487*self.size.width/2048 && touchy < 540*self.size.height/1536) {
                   // pageSixStarfishPressed()
                }
                else if (touchx > 665*self.size.width/2048 && touchy > 261*self.size.height/1536 && touchx < 727*self.size.width/2048 && touchy < 317*self.size.height/1536) {
                    pageSixClam1Pressed()
                }
                else if (touchx > 1231*self.size.width/2048 && touchy > 208*self.size.height/1536 && touchx < 1320*self.size.width/2048 && touchy < 288*self.size.height/1536) {
                    pageSixClam2Pressed()
                }
                else if (touchx > 1644*self.size.width/2048 && touchy > 263*self.size.height/1536 && touchx < 1746*self.size.width/2048 && touchy < 359*self.size.height/1536) {
                    pageSixClam3Pressed()
                }
                
            }
            
            else if pageInUse == page.page7Part1 || pageInUse == page.page7Part2 {
                
                if (touchx > 755*self.size.width/2048 && touchy > 409*self.size.height/1536 && touchx < 924*self.size.width/2048 && touchy < 569*self.size.height/1536) {
                    pageSevenBallPressed()
                }
                else if (touchx > 1164*self.size.width/2048 && touchy > 1278*self.size.height/1536 && touchx < 1301*self.size.width/2048 && touchy < 1504*self.size.height/1536) {
                    pageSevenBranchPressed()
                }
                else if (touchx > 1444*self.size.width/2048 && touchy > 189*self.size.height/1536 && touchx < 1733*self.size.width/2048 && touchy < 683*self.size.height/1536) {
                    pageSevenEviePressed()
                }
                else if (touchx > 1412*self.size.width/2048 && touchy > 1204*self.size.height/1536 && touchx < 1646*self.size.width/2048 && touchy < 1470*self.size.height/1536) {
                    pageSevenPicturePressed()
                }
                else if (touchx > 1835*self.size.width/2048 && touchy > 578*self.size.height/1536 && touchx < 1989*self.size.width/2048 && touchy < 735*self.size.height/1536) {
                    pageSevenOllyPressed()
                }
                else if (touchx > 989*self.size.width/2048 && touchy > 235*self.size.height/1536 && touchx < 1235*self.size.width/2048 && touchy < 392*self.size.height/1536) {
                    pageSevenBlocksPressed()
                }
               
               
            }
            
            else if pageInUse == page.page8Part1 || pageInUse == page.page8Part2 {
                
                if (touchx > 746*self.size.width/2048 && touchy > 1161*self.size.height/1536 && touchx < 1003*self.size.width/2048 && touchy < 1307*self.size.height/1536) || (touchx > 1106*self.size.width/2048 && touchy > 1281*self.size.height/1536 && touchx < 1363*self.size.width/2048 && touchy < 1427*self.size.height/1536) {
                    pageEightFlorryPressed()
                }
                else if (touchx > 1105*self.size.width/2048 && touchy > 665*self.size.height/1536 && touchx < 1296*self.size.width/2048 && touchy < 852*self.size.height/1536) {
                    pageEightBootSet1Pressed()
                }
                else if (touchx > 1416*self.size.width/2048 && touchy > 727*self.size.height/1536 && touchx < 1603*self.size.width/2048 && touchy < 895*self.size.height/1536) {
                    pageEightBootSet2Pressed()
                }
                else if (touchx > 667*self.size.width/2048 && touchy > 602*self.size.height/1536 && touchx < 924*self.size.width/2048 && touchy < 748*self.size.height/1536) {
                    pageEightPaddyPressed()
                }
                else if (touchx > 1138*self.size.width/2048 && touchy > 188*self.size.height/1536 && touchx < 1256*self.size.width/2048 && touchy < 434*self.size.height/1536) {
                    pageEightSeahorsePressed()
                }
                else if (touchx > 810*self.size.width/2048 && touchy > 248*self.size.height/1536 && touchx < 1126*self.size.width/2048 && touchy < 552*self.size.height/1536) {
                    pageEightWheelPressed()
                }
                else if (touchx > 1265*self.size.width/2048 && touchy > 349*self.size.height/1536 && touchx < 1482*self.size.width/2048 && touchy < 501*self.size.height/1536) {
                    pageEightGreenPlantPressed()
                }
                else if (touchx > 1570*self.size.width/2048 && touchy > 430*self.size.height/1536 && touchx < 1751*self.size.width/2048 && touchy < 516*self.size.height/1536) || (touchx > 1717*self.size.width/2048 && touchy > 513*self.size.height/1536 && touchx < 1849*self.size.width/2048 && touchy < 601*self.size.height/1536) {
                    pageEightROPlantPressed()
                }
                else if (touchx > 1792*self.size.width/2048 && touchy > 343*self.size.height/1536 && touchx < 1936*self.size.width/2048 && touchy < 485*self.size.height/1536) {
                    pageEightStarfishPressed()
                }
                else if (touchx > 1802*self.size.width/2048 && touchy > 1202*self.size.height/1536 && touchx < 1973*self.size.width/2048 && touchy < 1387*self.size.height/1536) {
                    pageEightJellyfishPressed()
                }
              
            }
           
            else if pageInUse == page.page9Part1 || pageInUse == page.page9Part2 {
                if (touchx > 1550*self.size.width/2048 && touchy > 1111*self.size.height/1536 && touchx < 1763*self.size.width/2048 && touchy < 1269*self.size.height/1536) {
                    pageNineFlorryPressed()
                }
                else if (touchx > 700*self.size.width/2048 && touchy > 475*self.size.height/1536 && touchx < 871*self.size.width/2048 && touchy < 663*self.size.height/1536) {
                    pageNineStarfishPressed()
                }
                else if (touchx > 838*self.size.width/2048 && touchy > 1317*self.size.height/1536 && touchx < 1002*self.size.width/2048 && touchy < 1475*self.size.height/1536) {
                    pageNineJellyfishPressed()
                }
                else if (touchx > 665*self.size.width/2048 && touchy > 652*self.size.height/1536 && touchx < 935*self.size.width/2048 && touchy < 814*self.size.height/1536) {
                    pageNinePaddyPressed()
                }
                else if (touchx > 1180*self.size.width/2048 && touchy > 305*self.size.height/1536 && touchx < 1406*self.size.width/2048 && touchy < 421*self.size.height/1536) {
                    pageNineLizardPressed()
                }
                else if (touchx > 678*self.size.width/2048 && touchy > 354*self.size.height/1536 && touchx < 769*self.size.width/2048 && touchy < 441*self.size.height/1536) {
                    pageNineClam1Pressed()
                }
                else if (touchx > 875*self.size.width/2048 && touchy > 281*self.size.height/1536 && touchx < 964*self.size.width/2048 && touchy < 357*self.size.height/1536) {
                    pageNineClam2Pressed()
                }
                else if (touchx > 1125*self.size.width/2048 && touchy > 206*self.size.height/1536 && touchx < 1176*self.size.width/2048 && touchy < 256*self.size.height/1536) {
                    pageNineClam3Pressed()
                }
                else if (touchx > 833*self.size.width/2048 && touchy > 357*self.size.height/1536 && touchx < 1044*self.size.width/2048 && touchy < 527*self.size.height/1536) || (touchx > 966*self.size.width/2048 && touchy > 262*self.size.height/1536 && touchx < 1126*self.size.width/2048 && touchy < 418*self.size.height/1536) {
                    pageNineRGPlantPressed()
                }
                else if (touchx > 1855*self.size.width/2048 && touchy > 274*self.size.height/1536 && touchx < 1988*self.size.width/2048 && touchy < 489*self.size.height/1536) {
                    pageNineSeahorsePressed()
                }
                else if (touchx > 1792*self.size.width/2048 && touchy > 1000*self.size.height/1536 && touchx < 2020*self.size.width/2048 && touchy < 1224*self.size.height/1536) {
                    pageNineWormPressed()
                }
            }
            
            else if pageInUse == page.creditsPage {
                
            }
            
            } else if effects == "off" {}
            
            
            
            
            
            }
        else {print("CANNOT TOUCH")}
        }
    }
    
    func changeMusicLabel() {
        let defaults = NSUserDefaults.standardUserDefaults()

        if music == "on" {
            music = "off"
            defaults.setValue("off", forKey: "musicValue")
            volumeString = "volumeOff"

            MusicPlayer.sharedInstance().pauseBackgroundMusic()
        } else if music == "off" {
            music = "on"
            defaults.setValue("on", forKey: "musicValue")
            volumeString = "volumeOn"

            MusicPlayer.sharedInstance().resumeBackgroundMusic()
        }
        musicLabel.text = "Music: \(music)"
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeVolButton = SKAction.setTexture(SKTexture(imageNamed: volumeString + "ButtoniPadPro"))
        default:
            changeVolButton = SKAction.setTexture(SKTexture(imageNamed: volumeString + "Button"))
        }
        
        volumeButton.runAction(SKAction.sequence([changeVolButton]))
        defaults.synchronize()

    }
    
    func changeEffectsLabel() {
        
        if effects == "on" {
                effects = "off"
        } else if effects == "off" {
                effects = "on"
        }
         else  {
            
        }
        
        effectsLabel.text = "Effects: \(effects)"
        
        
    }
    
    func readButtonPressed() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.1, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        let enlarge = SKAction.scaleTo(1.25, duration: 0.1)
        let scaleBack = SKAction.scaleTo(1, duration: 0.1)
        let moveRight = SKAction.moveByX(2*self.size.width/100, y: 0, duration: 0.1)
        let moveLeft = SKAction.moveByX(-50*self.size.width/100, y: 0, duration: 0.2)

        introReadButton.runAction(SKAction.sequence([enlarge,scaleBack,moveRight,moveLeft,SKAction.removeFromParent()]))
        for object in [introSettingsButton,playGamesButton,websiteButton,aboutUsButton] {
            let fade = SKAction.fadeOutWithDuration(0.15)
            object.runAction(SKAction.sequence([fade,SKAction.removeFromParent()]))
        }
        
        tapDir.hidden = false
        comeDir.hidden = true
        _ = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: #selector(MainMenuScene.bkPeriMusic), userInfo: nil, repeats: false)
     


        
    }
    
    func bkPeriMusic() {
        MusicPlayer.sharedInstance().playBackgroundMusic("bkPeriMusic.wav")
        if music == "on" {
        MusicPlayer.sharedInstance().fadeIn()
        } else {
            MusicPlayer.sharedInstance().pauseWithVolume()

        }
    }
    
    func bkMusic() {
        MusicPlayer.sharedInstance().playBackgroundMusic("bkMusic.wav")
        if music == "on" {
            MusicPlayer.sharedInstance().fadeIn()
        } else {
            MusicPlayer.sharedInstance().pauseWithVolume()
            
        }
    }
    
    func gamesButtonPressed() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.1, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        let enlarge = SKAction.scaleTo(1.25, duration: 0.1)
        let scaleBack = SKAction.scaleTo(1, duration: 0.1)
        let fade = SKAction.fadeOutWithDuration(0.20)
        playGamesButton.runAction(SKAction.sequence([enlarge,scaleBack]))
        playGamesButton.runAction(fade)
    /*    switch screenSize.height {
        case 1366:
        mmGamesButton = SKSpriteNode(imageNamed: "mmGamesButtoniPadPro")
        default:
        mmGamesButton = SKSpriteNode(imageNamed: "mmGamesButton")
        }
        mmGamesButton.position = CGPointMake(327*self.size.width/2048, 969*self.size.height/1536)
        let mmfadeOut = fadeOutWithDuration(0)
        let mmfadeIn = fadeInWithDuration(0.20)
        let mmwait = waitForDuration(0.20)
        addChild(mmGamesbutton)
        mmGamesButton.runAction(SKAction.sequence([mmfadeOut,mmwait,mmfadeIn]))*/
        for object in [titlePart1,titlePart2,titlePart3,frontBall,crab,crabLeft,crabRight,titleBird1] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(MainMenuScene.removeTitleActions), userInfo: nil, repeats: false)

        for object in [introReadButton,introSettingsButton,playGamesButton,websiteButton,aboutUsButton,titleSeahorse,titleFish,titlePaddy,titleSnail,titleJellyfish] {
            
            object.runAction(SKAction.sequence([SKAction.waitForDuration(0.2),SKAction.fadeOutWithDuration(0.25),SKAction.removeFromParent()]))
        }
        
        
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            homeButton = SKSpriteNode(imageNamed: "homeButtoniPadPro")
        default:
            homeButton = SKSpriteNode(imageNamed: "homeButton")
        }
        homeButton.position = CGPointMake(330*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)
        let homeButtonfinalPos: CGPoint = CGPointMake(330*self.size.width/2048, 1456*self.size.height/1536 )
        for object in [homeButton] {
            addChild(object)
            object.zPosition = 3
        }
        let homeButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let homeButtonMove2 = SKAction.moveTo(homeButtonfinalPos, duration: 0.20)
        homeButton.runAction(SKAction.sequence([SKAction.waitForDuration(0.25),homeButtonMove1,homeButtonMove2]))
        
        
        
        
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removeTitleActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.20)
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "gamesPortalImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "gamesPortalImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            kickupsButton = SKSpriteNode(imageNamed: "youtubeButtoniPadPro")
            raceButton = SKSpriteNode(imageNamed: "starsButtoniPadPro")
            paintButton = SKSpriteNode(imageNamed: "memoryButtoniPadPro")
            countButton = SKSpriteNode(imageNamed: "countButtoniPadPro")
            popButton = SKSpriteNode(imageNamed: "popButtoniPadPro")
            spotButton = SKSpriteNode(imageNamed: "sdidButtoniPadPro")
        default:
            kickupsButton = SKSpriteNode(imageNamed: "youtubeButton")
            raceButton = SKSpriteNode(imageNamed: "starsButton")
            paintButton = SKSpriteNode(imageNamed: "memoryButton")
            countButton = SKSpriteNode(imageNamed: "countButton")
            popButton = SKSpriteNode(imageNamed: "popButton")
            spotButton = SKSpriteNode(imageNamed: "didButton")

            
            
        }
        
        kickupsButton.position = CGPointMake(950*self.size.width/2048, 1085*self.size.height/1536)
        raceButton.position = CGPointMake(1350*self.size.width/2048, 1085*self.size.height/1536)
        paintButton.position = CGPointMake(1750*self.size.width/2048, 1085*self.size.height/1536)
        countButton.position = CGPointMake(950*self.size.width/2048, 635*self.size.height/1536)
        popButton.position = CGPointMake(1350*self.size.width/2048, 635*self.size.height/1536)
        spotButton.position = CGPointMake(1750*self.size.width/2048, 635*self.size.height/1536)

        
        for object in [kickupsButton,raceButton,paintButton,countButton,popButton,spotButton] {
            object.zPosition = 5
            
            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        
        for label in [games1Label,games2Label] {
            label.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.45),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageInUse = page.miniGamesPortalPage
        
    }
    
    func homePageSettingsButtonPressed() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.1, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        let enlarge = SKAction.scaleTo(1.25, duration: 0.1)
        let scaleBack = SKAction.scaleTo(1, duration: 0.1)
        let fadeOut = SKAction.fadeOutWithDuration(0.25)
        introSettingsButton.runAction(SKAction.sequence([enlarge,scaleBack,fadeOut]))

        for object in [introReadButton,introSettingsButton,playGamesButton,websiteButton,aboutUsButton,titleSeahorse,titleFish,titlePaddy,titleSnail,titleJellyfish] {
            object.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.2),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.removeFromParent()
                ]))
        }
        
        
        
        for label in [musicLabel,effectsLabel] {
            label.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.45),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            homeButton = SKSpriteNode(imageNamed: "homeButtoniPadPro")
        default:
            homeButton = SKSpriteNode(imageNamed: "homeButton")
        }
        homeButton.position = CGPointMake(330*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)
        let homeButtonfinalPos: CGPoint = CGPointMake(330*self.size.width/2048, 1456*self.size.height/1536 )
       for object in [homeButton] {
            addChild(object)
            object.zPosition = 3
        }
        let homeButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let homeButtonMove2 = SKAction.moveTo(homeButtonfinalPos, duration: 0.20)
        homeButton.runAction(SKAction.sequence([SKAction.waitForDuration(0.25),homeButtonMove1,homeButtonMove2]))
       
        pageInUse = page.introSettingsPage

    }
    
    func returnToHomePage() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.1, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        tapDir.hidden = true
        comeDir.hidden = false
        if pageInUse == page.introSettingsPage {
            for label in [musicLabel,effectsLabel,homeButton] {
            label.runAction(SKAction.fadeOutWithDuration(0.25))
            }
        
        } else if pageInUse == page.miniGamesPortalPage {
            for label in [games1Label,games2Label,homeButton] {
                label.runAction(SKAction.fadeOutWithDuration(0.25))
            }
            for object in [kickupsButton,raceButton,paintButton,countButton,popButton,spotButton] {
                let fadeOut = SKAction.fadeOutWithDuration(0.10)
                object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
                
            }
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            let baseFadeOut = SKAction.fadeOutWithDuration(0.20)
            switch screenSize.height {
            case 1366:
                changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
            default:
                changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
            }
            let baseFadeIn = SKAction.fadeInWithDuration(0.25)
            pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))

        }
        else if pageInUse == page.aboutUsPage {
            for label in [storyLabel,artLabel,codeLabel,copyrightLabel,copyright2Label] {
                label.runAction(SKAction.fadeOutWithDuration(0.25))
            }
        }
        else {
        
                   }
        
        homeButton.runAction(SKAction.sequence([
            SKAction.scaleTo(1.25, duration: 0.1),
            SKAction.scaleTo(1, duration: 0.1),
            
            SKAction.removeFromParent()
            ]))
        introSettingsButton.position = CGPointMake(327*self.size.width/2048, 767*self.size.height/1536)
        
        returnTheMainMenuObjects()
        

    }
    
    func websiteButtonPressed() {
        if let url = NSURL(string: "http://www.ollyoctopus.com/buy.html") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func aboutButtonPressed() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.1, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        let enlarge = SKAction.scaleTo(1.25, duration: 0.1)
        let scaleBack = SKAction.scaleTo(1, duration: 0.1)
        let fadeOut = SKAction.fadeOutWithDuration(0.25)
        aboutUsButton.runAction(SKAction.sequence([enlarge,scaleBack,fadeOut]))
        
        for object in [introReadButton,introSettingsButton,playGamesButton,websiteButton,aboutUsButton,titleSeahorse,titleFish,titlePaddy,titleSnail,titleJellyfish] {
            object.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.2),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.removeFromParent()
                ]))
        }
        
        for label in [storyLabel,artLabel,codeLabel,copyrightLabel,copyright2Label] {
            label.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.45),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            homeButton = SKSpriteNode(imageNamed: "homeButtoniPadPro")
        default:
            homeButton = SKSpriteNode(imageNamed: "homeButton")
        }
        homeButton.position = CGPointMake(330*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)
        let homeButtonfinalPos: CGPoint = CGPointMake(330*self.size.width/2048, 1456*self.size.height/1536 )
        for object in [homeButton] {
            addChild(object)
            object.zPosition = 3
        }
        let homeButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let homeButtonMove2 = SKAction.moveTo(homeButtonfinalPos, duration: 0.20)
        homeButton.runAction(SKAction.sequence([SKAction.waitForDuration(0.25),homeButtonMove1,homeButtonMove2]))
        
        pageInUse = page.aboutUsPage
    }
    
    func kickupsButtonPressed() {
        MusicPlayer.sharedInstance().fadeOut()

        canTouch = false
        let scaleDown = SKAction.scaleTo(0.75, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        kickupsButton.runAction(SKAction.sequence([scaleDown,scaleBack]), completion: {
        self.scene!.view!.presentScene(KickupsScene(size: self.scene!.size),transition: SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5) )
        }) // maybe make transition longer for fadeout
        bubbleTimer.invalidate()

    }
    
    func naughtButtonPressed() {
        MusicPlayer.sharedInstance().fadeOut()

        canTouch = false
        let scaleDown = SKAction.scaleTo(0.75, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        raceButton.runAction(SKAction.sequence([scaleDown,scaleBack]), completion: {
        self.scene!.view!.presentScene(NaughtScene(size: self.scene!.size),transition: SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5) )
        })
         bubbleTimer.invalidate()

    }
    
    func memoryButtonPressed() {
        MusicPlayer.sharedInstance().fadeOut()

        canTouch = false
        let scaleDown = SKAction.scaleTo(0.75, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        paintButton.runAction(SKAction.sequence([scaleDown,scaleBack]), completion: {
        self.scene!.view!.presentScene(MemoryScene(size: self.scene!.size),transition: SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5) )
        })
        bubbleTimer.invalidate()

    }
    
    func countButtonPressed() {
        MusicPlayer.sharedInstance().fadeOut()

        canTouch = false
        let scaleDown = SKAction.scaleTo(0.75, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        countButton.runAction(SKAction.sequence([scaleDown,scaleBack]), completion: {
        self.scene!.view!.presentScene(CountScene(size: self.scene!.size),transition: SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5) )
        })
        bubbleTimer.invalidate()

    }
    
    func popButtonPressed() {
        MusicPlayer.sharedInstance().fadeOut()

        canTouch = false
        let scaleDown = SKAction.scaleTo(0.75, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        popButton.runAction(SKAction.sequence([scaleDown,scaleBack]), completion: {
        self.scene!.view!.presentScene(PopScene(size: self.scene!.size),transition: SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5) )
        })
        bubbleTimer.invalidate()

    }
    
    func didButtonPressed() {
        MusicPlayer.sharedInstance().fadeOut()

        canTouch = false
        let scaleDown = SKAction.scaleTo(0.75, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        spotButton.runAction(SKAction.sequence([scaleDown,scaleBack]), completion: {
        self.scene!.view!.presentScene(DidScene(size: self.scene!.size),transition: SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5) )
        })
        bubbleTimer.invalidate()

    }
    
    func fowardButtonTouched() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.1, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        let enlarge = SKAction.scaleTo(1.25, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        fowardButton.runAction(SKAction.sequence([enlarge,scaleBack]))

        moveToNextPage()
    }
    
    func backButtonTouched() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.1, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        let enlarge = SKAction.scaleTo(1.25, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        backButton.runAction(SKAction.sequence([enlarge,scaleBack]))
        moveToPreviousPage()

    }
    
    func homeButtonTouched() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.1, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        MusicPlayer.sharedInstance().fadeOut()
        _ = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: #selector(MainMenuScene.bkMusic), userInfo: nil, repeats: false)
        tapDir.hidden = true
        comeDir.hidden = false
        let enlarge = SKAction.scaleTo(1.25, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        homeButton.runAction(SKAction.sequence([enlarge,scaleBack]))
        removeArrows()
        removeIconTab()
        removeTextBoxToLeft()
        returnTheMainMenuObjects()
        if pageInUse == page.page1Part1 || pageInUse == page.page1Part2 {
            moveFromBaseImageOneToZero()
        }
        else if pageInUse == page.page2Part1 || pageInUse == page.page2Part2 {
            moveFromBaseImageTwoToZero()
        }
        else if pageInUse == page.page3Part1 || pageInUse == page.page3Part2 {
            moveFromBaseImageThreeToZero()
        }
        else if pageInUse == page.page4Part1 || pageInUse == page.page4Part2 {
            moveFromBaseImageFourToZero()
        }
        else if pageInUse == page.page5Part1 || pageInUse == page.page5Part2 {
            moveFromBaseImageFiveToZero()
        }
        else if pageInUse == page.page6Part1 || pageInUse == page.page6Part2 {
            moveFromBaseImageSixToZero()
        }
        else if pageInUse == page.page7Part1 || pageInUse == page.page7Part2 {
            moveFromBaseImageSevenToZero()
        }
        else if pageInUse == page.page8Part1 || pageInUse == page.page8Part2 {
            moveFromBaseImageEightToZero()
        }
        else if pageInUse == page.page9Part1 || pageInUse == page.page9Part2 {
            moveFromBaseImageNineToZero()
        }
        else if pageInUse == page.creditsPage {
            moveFromBaseImageTenToZero()
        }
        pageInUse = page.titlePage
        
    }
    
    func settingsButtonTouched() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        let enlarge = SKAction.scaleTo(1.25, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        settingsButton.runAction(SKAction.sequence([enlarge,scaleBack]))
        let moveDown = SKAction.moveByX(0, y: -2*self.size.height/100, duration: 0.20)
        let moveUp = SKAction.moveByX(0, y: 50*self.size.height/100, duration: 0.20)
        for object in [fowardButton,homeButton,settingsButton,volumeButton] {
            object.runAction(SKAction.sequence([moveDown,moveUp]))
        }
        removeTextBoxToLeft()
        if pageInUse == page.creditsPage {
            pageTenFurtherInfo.runAction(SKAction.fadeOutWithDuration(0.1))
        }
        pageInUse = page.settingsPage
        showSettings()
        
        
    }
    
    func volumeButtonTouched() {
        
        let defaults = NSUserDefaults.standardUserDefaults()

        
        if music == "on" {
            music = "off"
            defaults.setValue("off", forKey: "musicValue")

            MusicPlayer.sharedInstance().pauseBackgroundMusic()
            volumeString = "volumeOff"
        }
        else {
            music = "on"
            defaults.setValue("on", forKey: "musicValue")

            MusicPlayer.sharedInstance().resumeBackgroundMusic()
            volumeString = "volumeOn"

        }
        musicLabel.text = "Music: \(music)"
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeVolButton = SKAction.setTexture(SKTexture(imageNamed: volumeString + "ButtoniPadPro"))
        default:
            changeVolButton = SKAction.setTexture(SKTexture(imageNamed: volumeString + "Button"))
        }
        
        volumeButton.runAction(SKAction.sequence([changeVolButton]))
        
        defaults.synchronize()
        
    }
    
    func returnToBook() {
        canTouch = false
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(MainMenuScene.canNowTouch), userInfo: nil, repeats: false)
        let enlarge = SKAction.scaleTo(1.25, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        backButton.runAction(SKAction.sequence([enlarge,scaleBack]))
        
        for label in [musicLabel,effectsLabel] {
            label.runAction(SKAction.fadeOutWithDuration(0.25))
        }
        if pageToReturnTo == page.creditsPage {
            pageTenFurtherInfo.runAction(SKAction.sequence([SKAction.waitForDuration(0.25),SKAction.fadeInWithDuration(0.25)]))

        }else {
        addTextBoxFromLeft(textEnglish[pageToReturnTo.rawValue - 1])
        }
        let moveDown = SKAction.moveByX(0, y: -50*self.size.height/100, duration: 0.20)
        let moveUp = SKAction.moveByX(0, y: 2*self.size.height/100, duration: 0.20)
        for object in [fowardButton,homeButton,settingsButton,volumeButton] {
            object.runAction(SKAction.sequence([moveDown,moveUp]))
        }
        pageInUse = pageToReturnTo

    }
    
    func canNowTouch() {
        canTouch = true
    }
    
    func moveToNextPage() {
        
        if pageInUse == page.titlePage{
            
            addTextBoxFromRight(textEnglish[0])
            addArrows()
            addIconTab()
            moveFromBaseImageZeroToOne()
           

        }
        else if pageInUse == page.miniGamesPortalPage {
            
            addTextBoxFromRight(textEnglish[0])
            addArrows()
            addIconTab()
            moveFromBaseImageGamesToOne()
            
            
        }
        else if pageInUse == page.page1Part1 {
            
            changeTextBoxToRight(textEnglish[1])

        }
        else if pageInUse == page.page1Part2 {
           
            changeTextBoxToRight(textEnglish[2])
            moveFromBaseImageOneToTwo()


        }
        else if pageInUse == page.page2Part1 {
            changeTextBoxToRight(textEnglish[3])

            
        }
        else if pageInUse == page.page2Part2 {
            
            changeTextBoxToRight(textEnglish[4])
            moveFromBaseImageTwoToThree()

        }
        else if pageInUse == page.page3Part1 {
            
            changeTextBoxToRight(textEnglish[5])

        }
        else if pageInUse == page.page3Part2 {
            
            changeTextBoxToRight(textEnglish[6])
            moveFromBaseImageThreeToFour()

        }
        else if pageInUse == page.page4Part1 {
            
            changeTextBoxToRight(textEnglish[7])

        }
        else if pageInUse == page.page4Part2 {
           
            changeTextBoxToRight(textEnglish[8])
            moveFromBaseImageFourToFive()

        }
        else if pageInUse == page.page5Part1 {
            changeTextBoxToRight(textEnglish[9])

            
        }
        else if pageInUse == page.page5Part2 {
           
            changeTextBoxToRight(textEnglish[10])
            moveFromBaseImageFiveToSix()

        }
        else if pageInUse == page.page6Part1 {
            
            changeTextBoxToRight(textEnglish[11])

        }
        else if pageInUse == page.page6Part2 {
            
            changeTextBoxToRight(textEnglish[12])
            moveFromBaseImageSixToSeven()

        }
        else if pageInUse == page.page7Part1 {
            changeTextBoxToRight(textEnglish[13])

            
        }
        else if pageInUse == page.page7Part2 {
           
            changeTextBoxToRight(textEnglish[14])
            moveFromBaseImageSevenToEight()

            
        }
        else if pageInUse == page.page8Part1 {
            changeTextBoxToRight(textEnglish[15])

            
        }
        else if pageInUse == page.page8Part2 {
           
            changeTextBoxToRight(textEnglish[16])
            moveFromBaseImageEightToNine()

        }
        else if pageInUse == page.page9Part1 {
            let moveTextBoxToSidePart1 = SKAction.moveByX(2*self.size.width/100, y: 0, duration: 0.10)
            let moveTextBoxToSidePart2 = SKAction.moveToX(-self.size.width/2, duration: 0.10)
            textBox.runAction(SKAction.sequence([moveTextBoxToSidePart1,moveTextBoxToSidePart2,SKAction.removeFromParent()]))
            moveFromBaseImageNineToTen()
            
        }
        
        
        moveToNextPageInUse()
        
        
    }
    
    func moveToNextPageInUse() {
        
        if pageInUse == page.titlePage || pageInUse == page.miniGamesPortalPage  {
            pageInUse = page.page1Part1
        }
        else if pageInUse == page.page1Part1 {
            pageInUse = page.page1Part2
        }
        else if pageInUse == page.page1Part2 {
            pageInUse = page.page2Part1
        }
        else if pageInUse == page.page2Part1 {
            pageInUse = page.page2Part2
        }
        else if pageInUse == page.page2Part2 {
            pageInUse = page.page3Part1
        }
        else if pageInUse == page.page3Part1 {
            pageInUse = page.page3Part2
        }
        else if pageInUse == page.page3Part2 {
            pageInUse = page.page4Part1
        }
        else if pageInUse == page.page4Part1 {
            pageInUse = page.page4Part2
        }
        else if pageInUse == page.page4Part2 {
            pageInUse = page.page5Part1
        }
        else if pageInUse == page.page5Part1 {
            pageInUse = page.page5Part2
        }
        else if pageInUse == page.page5Part2 {
            pageInUse = page.page6Part1
        }
        else if pageInUse == page.page6Part1 {
            pageInUse = page.page6Part2
        }
        else if pageInUse == page.page6Part2 {
            pageInUse = page.page7Part1
        }
        else if pageInUse == page.page7Part1 {
            pageInUse = page.page7Part2
        }
        else if pageInUse == page.page7Part2 {
            pageInUse = page.page8Part1
        }
        else if pageInUse == page.page8Part1 {
            pageInUse = page.page8Part2
        }
        else if pageInUse == page.page8Part2 {
            pageInUse = page.page9Part1
        }
        else if pageInUse == page.page9Part1 {
            pageInUse = page.creditsPage
        }
    }
    
    func moveToPreviousPage() {
        
        
        if pageInUse == page.page1Part1 {
            MusicPlayer.sharedInstance().fadeOut()
            _ = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: #selector(MainMenuScene.bkMusic), userInfo: nil, repeats: false)
            removeTextBoxToLeft()
            removeArrows()
            removeIconTab()
            returnTheMainMenuObjects()
            moveFromBaseImageOneToZero()
            tapDir.hidden = true
            comeDir.hidden = false
            
        }
        else if pageInUse == page.page1Part2 {
            changeTextBoxToLeft(textEnglish[0])

            
        }
        else if pageInUse == page.page2Part1 {
            
            changeTextBoxToLeft(textEnglish[1])
            moveFromBaseImageTwoToOne()

        }
        else if pageInUse == page.page2Part2 {
            changeTextBoxToLeft(textEnglish[2])

            
        }
        else if pageInUse == page.page3Part1 {
            
            changeTextBoxToLeft(textEnglish[3])
            moveFromBaseImageThreeToTwo()

        }
        else if pageInUse == page.page3Part2 {
            changeTextBoxToLeft(textEnglish[4])

            
        }
        else if pageInUse == page.page4Part1 {
            
            changeTextBoxToLeft(textEnglish[5])
            moveFromBaseImageFourToThree()

        }
        else if pageInUse == page.page4Part2 {
            
            changeTextBoxToLeft(textEnglish[6])

        }
        else if pageInUse == page.page5Part1 {
            
            changeTextBoxToLeft(textEnglish[7])
            moveFromBaseImageFiveToFour()

        }
        else if pageInUse == page.page5Part2 {
            
            changeTextBoxToLeft(textEnglish[8])

        }
        else if pageInUse == page.page6Part1 {
           
            changeTextBoxToLeft(textEnglish[9])
            moveFromBaseImageSixToFive()

        }
        else if pageInUse == page.page6Part2 {
            changeTextBoxToLeft(textEnglish[10])

            
        }
        else if pageInUse == page.page7Part1 {
           
            changeTextBoxToLeft(textEnglish[11])
            moveFromBaseImageSevenToSix()

        }
        else if pageInUse == page.page7Part2 {
            changeTextBoxToLeft(textEnglish[12])

            
        }
        else if pageInUse == page.page8Part1 {
            
            changeTextBoxToLeft(textEnglish[13])
            moveFromBaseImageEightToSeven()

            
        }
        else if pageInUse == page.page8Part2 {
            
            changeTextBoxToLeft(textEnglish[14])

        }
        else if pageInUse == page.page9Part1 {
            
            changeTextBoxToLeft(textEnglish[15])
            moveFromBaseImageNineToEight()

        }
       
        else if pageInUse == page.creditsPage {
            
            addTextBoxFromLeft(textEnglish[16])
            moveFromBaseImageTenToNine()
            
        }
        
        moveToPreviousPageInUse()
    }
    
    func moveToPreviousPageInUse() {
        
        
        if pageInUse == page.page1Part1 {
            pageInUse = page.titlePage
        }
        else if pageInUse == page.page1Part2 {
            pageInUse = page.page1Part1
        }
        else if pageInUse == page.page2Part1 {
            pageInUse = page.page1Part2
        }
        else if pageInUse == page.page2Part2 {
            pageInUse = page.page2Part1
        }
        else if pageInUse == page.page3Part1 {
            pageInUse = page.page2Part2
        }
        else if pageInUse == page.page3Part2 {
            pageInUse = page.page3Part1
        }
        else if pageInUse == page.page4Part1 {
            pageInUse = page.page3Part2
        }
        else if pageInUse == page.page4Part2 {
            pageInUse = page.page4Part1
        }
        else if pageInUse == page.page5Part1 {
            pageInUse = page.page4Part2
        }
        else if pageInUse == page.page5Part2 {
            pageInUse = page.page5Part1
        }
        else if pageInUse == page.page6Part1 {
            pageInUse = page.page5Part2
        }
        else if pageInUse == page.page6Part2 {
            pageInUse = page.page6Part1
        }
        else if pageInUse == page.page7Part1 {
            pageInUse = page.page6Part2
        }
        else if pageInUse == page.page7Part2 {
            pageInUse = page.page7Part1
        }
        else if pageInUse == page.page8Part1 {
            pageInUse = page.page7Part2
        }
        else if pageInUse == page.page8Part2 {
            pageInUse = page.page8Part1
        }
        else if pageInUse == page.page9Part1 {
            pageInUse = page.page8Part2
        }
        else if pageInUse == page.creditsPage {
            pageInUse = page.page9Part1
        }
        
    }
    
    func addTextBoxFromRight(textBoxName: String) {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            textBox = SKSpriteNode(imageNamed: textBoxName + "iPadPro")
        default:
            textBox = SKSpriteNode(imageNamed: textBoxName)

        }
        textBox.position = CGPointMake(327*self.size.width/2048 + self.size.width/2, 768*self.size.height/1536)
        let pos1: CGPoint = CGPointMake(327*self.size.width/2048 , 768*self.size.height/1536)
        addChild(textBox)
        textBox.zPosition = 3
        
        let moveTextBoxToCentrePart1 = SKAction.moveByX(-51*self.size.width/100, y: 0, duration: 0.25)
        let moveTextBoxToCentrePart2 = SKAction.moveTo(pos1, duration: 0.25)
        textBox.runAction(SKAction.sequence([moveTextBoxToCentrePart1,moveTextBoxToCentrePart2]))
    }
    
    func changeTextBoxToRight(textBoxName: String) {

        let moveTextBoxToSidePart1 = SKAction.moveByX(2*self.size.width/100, y: 0, duration: 0.10)
        let moveTextBoxToSidePart2 = SKAction.moveToX(-self.size.width/2, duration: 0.10)
        textBox.runAction(SKAction.sequence([moveTextBoxToSidePart1,moveTextBoxToSidePart2,SKAction.removeFromParent()]))
        addTextBoxFromRight(textBoxName)
    }
    
    func addTextBoxFromLeft(textBoxName: String) {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            textBox = SKSpriteNode(imageNamed: textBoxName + "iPadPro")
        default:
            textBox = SKSpriteNode(imageNamed: textBoxName)
            
        }
        textBox.position = CGPointMake(327*self.size.width/2048 - self.size.width/2, 768*self.size.height/1536)
        let pos1: CGPoint = CGPointMake(327*self.size.width/2048 , 768*self.size.height/1536)
        addChild(textBox)
        textBox.zPosition = 3
        
    
        let moveTextBoxToCentrePart1 = SKAction.moveByX(51*self.size.width/100, y: 0, duration: 0.25)
        let moveTextBoxToCentrePart2 = SKAction.moveTo(pos1, duration: 0.25)
        textBox.runAction(SKAction.sequence([moveTextBoxToCentrePart1,moveTextBoxToCentrePart2]))
    }
    
    func changeTextBoxToLeft(textBoxName: String) {
        let moveTextBoxToSidePart1 = SKAction.moveByX(-2*self.size.width/100, y: 0, duration: 0.10)
        let moveTextBoxToSidePart2 = SKAction.moveToX(3*self.size.width/2, duration: 0.10)
        textBox.runAction(SKAction.sequence([moveTextBoxToSidePart1,moveTextBoxToSidePart2,SKAction.removeFromParent()]))
        addTextBoxFromLeft(textBoxName)
    }
    
    func removeTextBoxToLeft() {
        let moveTextBoxToSidePart1 = SKAction.moveByX(-2*self.size.width/100, y: 0, duration: 0.10)
        let moveTextBoxToSidePart2 = SKAction.moveToX(3*self.size.width/2, duration: 0.10)
        textBox.runAction(SKAction.sequence([moveTextBoxToSidePart1,moveTextBoxToSidePart2,SKAction.removeFromParent()]))
    }
    
    func addArrows() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            fowardButton = SKSpriteNode(imageNamed: "fowardButtoniPadPro")
            backButton = SKSpriteNode(imageNamed: "backButtoniPadPro")
        default:
            fowardButton = SKSpriteNode(imageNamed: "fowardButton")
            backButton = SKSpriteNode(imageNamed: "backButton")
            
        }
        backButton.position = CGPointMake(75*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)
        let bfinalPos: CGPoint = CGPointMake(75*self.size.width/2048, 1456*self.size.height/1536 )
        fowardButton.position = CGPointMake(585*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)
        let ffinalPos: CGPoint = CGPointMake(585*self.size.width/2048, 1456*self.size.height/1536 )

        for object in [fowardButton,backButton] {
            addChild(object)
            object.zPosition = 3
        }
        let fButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let fButtonMove2 = SKAction.moveTo(ffinalPos, duration: 0.20)
        let bButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let bButtonMove2 = SKAction.moveTo(bfinalPos, duration: 0.20)
        fowardButton.runAction(SKAction.sequence([fButtonMove1,fButtonMove2]))
        backButton.runAction(SKAction.sequence([bButtonMove1,bButtonMove2]))


    }
    
    func removeArrows() {
        let moveDown = SKAction.moveByX(0, y: -2*self.size.height/100, duration: 0.20)
        let moveUp = SKAction.moveByX(0, y: 50*self.size.height/100, duration: 0.20)
        fowardButton.runAction(SKAction.sequence([moveDown,moveUp,SKAction.removeFromParent()]))
        backButton.runAction(SKAction.sequence([moveDown,moveUp,SKAction.removeFromParent()]))

    }
    
    func returnTheMainMenuObjects() {
        
        for object in [introReadButton,introSettingsButton,playGamesButton,websiteButton,aboutUsButton] {
            object.runAction(SKAction.fadeInWithDuration(0.01))
            object.position.x = -self.size.width/2
            let moveObjectToCentrePart1 = SKAction.moveToX(330*self.size.width/2048  , duration: 0.25)
            let moveObjectToCentrePart2 = SKAction.moveToX(327*self.size.width/2048  , duration: 0.25)
            addChild(object)
            object.runAction(SKAction.sequence([moveObjectToCentrePart1,moveObjectToCentrePart2]))
        }
       

        for object in [titleSeahorse,titlePaddy,titleFish,titleSnail,titleJellyfish] {
            object.hidden = false
            addChild(object)
            object.runAction(SKAction.sequence([SKAction.waitForDuration(0.25),SKAction.fadeInWithDuration(0.25)]))
        }
        if pageInUse == page.introSettingsPage || pageInUse == page.aboutUsPage  {
            pageInUse = page.titlePage
        } else if pageInUse == page.miniGamesPortalPage {
            titlePart1.position = CGPointMake(1050*self.size.width/2048, 1354*self.size.height/1536 + self.size.height/2)
            frontBall.position = CGPointMake(1535*self.size.width/2048, 928*self.size.height/1536)
            for object in [titlePart1,titlePart2,titlePart3,frontBall,crab,crabLeft,crabRight] {
                object.hidden = false
                addChild(object)
                object.runAction(SKAction.sequence([SKAction.waitForDuration(0.25),SKAction.fadeInWithDuration(0.25)]))
            }
            
            titlePageAnimations()
            pageInUse = page.titlePage

        }
        else {
            titlePart1.position = CGPointMake(1050*self.size.width/2048, 1354*self.size.height/1536 + self.size.height/2)
            frontBall.position = CGPointMake(1535*self.size.width/2048, 928*self.size.height/1536)
        for object in [titlePart1,titlePart2,titlePart3,frontBall,crab,crabLeft,crabRight] {
            object.hidden = false
            addChild(object)
            object.runAction(SKAction.sequence([SKAction.waitForDuration(0.25),SKAction.fadeInWithDuration(0.25)]))
        }
            
            titlePageAnimations()
        }
        

        
        

        

    }

    
    
    func addIconTab() {
        
        if music == "on" {
            volumeString = "volumeOn"
        }
        else  {
            volumeString = "volumeOff"
        }
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            homeButton = SKSpriteNode(imageNamed: "homeButtoniPadPro")
            settingsButton = SKSpriteNode(imageNamed: "settingsButtoniPadPro")
            volumeButton = SKSpriteNode(imageNamed: volumeString + "ButtoniPadPro")
        default:
            homeButton = SKSpriteNode(imageNamed: "homeButton")
            settingsButton = SKSpriteNode(imageNamed: "settingsButton")
            volumeButton = SKSpriteNode(imageNamed: volumeString + "Button")
            
        }
        

        homeButton.position = CGPointMake(202*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)
        settingsButton.position = CGPointMake(330*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)
        volumeButton.position = CGPointMake(457*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)

        let homeButtonfinalPos: CGPoint = CGPointMake(202*self.size.width/2048, 1456*self.size.height/1536 )
        let settingsButtonfinalPos: CGPoint = CGPointMake(330*self.size.width/2048, 1456*self.size.height/1536 )
        let volumeButtonfinalPos: CGPoint = CGPointMake(457*self.size.width/2048, 1456*self.size.height/1536 )

        for object in [homeButton,settingsButton,volumeButton] {
            addChild(object)
            object.zPosition = 3
        }
        
        let homeButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let homeButtonMove2 = SKAction.moveTo(homeButtonfinalPos, duration: 0.20)
        let settingsButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let settingsButtonMove2 = SKAction.moveTo(settingsButtonfinalPos, duration: 0.20)
        let volumeButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let volumeButtonMove2 = SKAction.moveTo(volumeButtonfinalPos, duration: 0.20)
        
        homeButton.runAction(SKAction.sequence([homeButtonMove1,homeButtonMove2]))
        settingsButton.runAction(SKAction.sequence([settingsButtonMove1,settingsButtonMove2]))
        volumeButton.runAction(SKAction.sequence([volumeButtonMove1,volumeButtonMove2]))

    }
    
    func removeIconTab() {
        
        let moveDown = SKAction.moveByX(0, y: -2*self.size.height/100, duration: 0.20)
        let moveUp = SKAction.moveByX(0, y: 50*self.size.height/100, duration: 0.20)
        for object in [homeButton,settingsButton,volumeButton] {
            object.runAction(SKAction.sequence([moveDown,moveUp,SKAction.removeFromParent()]))
        }
        
    }
    
    func showSettings() {
        for label in [musicLabel,effectsLabel] {
            label.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.45),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
    }
    
    func changeVolume() {
        
    }
    
     func moveFromBaseImageGamesToOne() {
        for object in [titleSnail,titlePaddy,titleFish,titleSeahorse,titleJellyfish,kickupsButton,raceButton,paintButton,countButton,popButton,spotButton] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.20)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageOneiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageOne"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            pageOneStarfish = SKSpriteNode(imageNamed: "pageOneStarfishiPadPro")
            pageOneClamOne = SKSpriteNode(imageNamed: "pageOneClamiPadPro")
            pageOneClamTwo = SKSpriteNode(imageNamed: "pageOneClamiPadPro")
            pageOneClamThree = SKSpriteNode(imageNamed: "pageOneClamiPadPro")
            pageOneFlorryOne = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageOneFlorryOneWings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
            pageOneFlorryTwo = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageOneFlorryTwoWings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
            pageOneFlorryThree = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageOneWaterMask = SKSpriteNode(imageNamed: "pageOneWaterMaskiPadPro")
        default:
            pageOneStarfish = SKSpriteNode(imageNamed: "pageOneStarfish")
            pageOneClamOne = SKSpriteNode(imageNamed: "pageOneClam")
            pageOneClamTwo = SKSpriteNode(imageNamed: "pageOneClam")
            pageOneClamThree = SKSpriteNode(imageNamed: "pageOneClam")
            pageOneFlorryOne = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageOneFlorryOneWings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
            pageOneFlorryTwo = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageOneFlorryTwoWings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
            pageOneFlorryThree = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageOneWaterMask = SKSpriteNode(imageNamed: "pageOneWaterMask")
        }
        
        for object in ["pageOneBirdOne","pageOneBirdTwo"] {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            switch screenSize.height {
            case 1366:
                loadPageOneObjectAtlasiPadPro(object)
            default:
                loadPageOneObjectAtlasiPad(object)
            }
        }
        
        
        pageOneStarfish.position = CGPointMake(785*self.size.width/2048, 606*self.size.height/1536)
        pageOneClamOne.position = CGPointMake(745*self.size.width/2048, 233*self.size.height/1536)
        pageOneClamTwo.position = CGPointMake(691*self.size.width/2048, 424*self.size.height/1536)
        pageOneClamThree.position = CGPointMake(721*self.size.width/2048, 460*self.size.height/1536)
        pageOneFlorryOne.position = CGPointMake(878*self.size.width/2048, 865*self.size.height/1536)
        pageOneFlorryOneWings.position = CGPointMake(834*self.size.width/2048, 854*self.size.height/1536)
        pageOneFlorryTwo.position = CGPointMake(1228*self.size.width/2048, 471*self.size.height/1536)
        pageOneFlorryTwoWings.position = CGPointMake(1181*self.size.width/2048, 460*self.size.height/1536)
        pageOneFlorryThree.position = CGPointMake(1774*self.size.width/2048, 308*self.size.height/1536)
        pageOneWaterMask.position = CGPointMake(1649*self.size.width/2048, 336*self.size.height/1536)
        
        pageOneClamTwo.zRotation = 3.14
        pageOneClamThree.zRotation = 1.57
        pageOneFlorryThree.zRotation = -0.7
        pageOneFlorryOneWings.anchorPoint = CGPointMake(0, 0)
        pageOneFlorryTwoWings.anchorPoint = CGPointMake(0, 0)
        
        for object in [pageOneStarfish,pageOneClamOne,pageOneClamTwo,pageOneClamThree,pageOneFlorryOne,pageOneFlorryOneWings,pageOneFlorryTwo,pageOneFlorryTwoWings,pageOneFlorryThree,pageOneWaterMask] {
            object.zPosition = 5
            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
    }
    
    func moveFromBaseImageZeroToOne() {
        
        for object in [titlePart1,titlePart2,titlePart3,frontBall,crab,crabLeft,crabRight,titleBird1,titleSnail,titlePaddy,titleFish,titleSeahorse,titleJellyfish] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(MainMenuScene.removeTitleActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.20)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageOneiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageOne"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
         pageOneStarfish = SKSpriteNode(imageNamed: "pageOneStarfishiPadPro")
         pageOneClamOne = SKSpriteNode(imageNamed: "pageOneClamiPadPro")
         pageOneClamTwo = SKSpriteNode(imageNamed: "pageOneClamiPadPro")
         pageOneClamThree = SKSpriteNode(imageNamed: "pageOneClamiPadPro")
         pageOneFlorryOne = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
         pageOneFlorryOneWings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
         pageOneFlorryTwo = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
         pageOneFlorryTwoWings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
         pageOneFlorryThree = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
         pageOneWaterMask = SKSpriteNode(imageNamed: "pageOneWaterMaskiPadPro")
        default:
         pageOneStarfish = SKSpriteNode(imageNamed: "pageOneStarfish")
         pageOneClamOne = SKSpriteNode(imageNamed: "pageOneClam")
         pageOneClamTwo = SKSpriteNode(imageNamed: "pageOneClam")
         pageOneClamThree = SKSpriteNode(imageNamed: "pageOneClam")
         pageOneFlorryOne = SKSpriteNode(imageNamed: "pageOneFlorry")
         pageOneFlorryOneWings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
         pageOneFlorryTwo = SKSpriteNode(imageNamed: "pageOneFlorry")
         pageOneFlorryTwoWings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
         pageOneFlorryThree = SKSpriteNode(imageNamed: "pageOneFlorry")
         pageOneWaterMask = SKSpriteNode(imageNamed: "pageOneWaterMask")
        }
        
        for object in ["pageOneBirdOne","pageOneBirdTwo"] {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            switch screenSize.height {
            case 1366:
                loadPageOneObjectAtlasiPadPro(object)
            default:
                loadPageOneObjectAtlasiPad(object)
            }
        }
        
        
        pageOneStarfish.position = CGPointMake(785*self.size.width/2048, 606*self.size.height/1536)
        pageOneClamOne.position = CGPointMake(745*self.size.width/2048, 233*self.size.height/1536)
        pageOneClamTwo.position = CGPointMake(691*self.size.width/2048, 424*self.size.height/1536)
        pageOneClamThree.position = CGPointMake(721*self.size.width/2048, 460*self.size.height/1536)
        pageOneFlorryOne.position = CGPointMake(878*self.size.width/2048, 865*self.size.height/1536)
        pageOneFlorryOneWings.position = CGPointMake(834*self.size.width/2048, 854*self.size.height/1536)
        pageOneFlorryTwo.position = CGPointMake(1228*self.size.width/2048, 471*self.size.height/1536)
        pageOneFlorryTwoWings.position = CGPointMake(1181*self.size.width/2048, 460*self.size.height/1536)
        pageOneFlorryThree.position = CGPointMake(1774*self.size.width/2048, 308*self.size.height/1536)
        pageOneWaterMask.position = CGPointMake(1649*self.size.width/2048, 336*self.size.height/1536)

        pageOneClamTwo.zRotation = 3.14
        pageOneClamThree.zRotation = 1.57
        pageOneFlorryThree.zRotation = -0.7
        pageOneFlorryOneWings.anchorPoint = CGPointMake(0, 0)
        pageOneFlorryTwoWings.anchorPoint = CGPointMake(0, 0)

        for object in [pageOneStarfish,pageOneClamOne,pageOneClamTwo,pageOneClamThree,pageOneFlorryOne,pageOneFlorryOneWings,pageOneFlorryTwo,pageOneFlorryTwoWings,pageOneFlorryThree,pageOneWaterMask] {
            object.zPosition = 5
            addChild(object)

            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        
    }
    
    func removeTitleActions() {
        for object in [titlePart1,titlePart2,titlePart3,frontBall,crab,crabLeft,crabRight,titleBird1] {
            object.hidden = true
            object.removeAllActions()
        }
    }
    
    func removePageOneActions() {
        for object in [pageOneStarfish,pageOneClamOne,pageOneClamTwo,pageOneClamThree,pageOneBirdOne,pageOneBirdTwo,pageOneFlorryOne,pageOneFlorryOneWings,pageOneFlorryTwo,pageOneFlorryTwoWings,pageOneFlorryThree,pageOneWaterMask] {
            object.hidden = true

           object.removeAllActions()
            
        }
    }
    
    func moveFromBaseImageTwoToZero() {
      
        for object in [pageTwoBall,pageTwoClam1,pageTwoClam2,pageTwoClam3,pageTwoClam4,pageTwoLighthouse,pageTwoCloud,pageTwoSun,pageTwoCrabBody,pageTwoCrabPincer1,pageTwoCrabPincer2,pageTwoCrabPincer3,pageTwoCrabEyebrows,pageTwoGrass,pageTwoSizzle,pageTwoSnail,pageTwoSnailWhite,pageTwoCornerCloud,pageTwoEyes,pageTwoLighthouseYellowWindow1,pageTwoLighthouseYellowWindow2,pageTwoLighthouseYellowWindow3] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageTwoActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
    }
    
    func removePageTwoActions() {
      for object in [pageTwoBall,pageTwoClam1,pageTwoClam2,pageTwoClam3,pageTwoClam4,pageTwoLighthouse,pageTwoCloud,pageTwoSun,pageTwoCrabBody,pageTwoCrabPincer1,pageTwoCrabPincer2,pageTwoCrabPincer3,pageTwoCrabEyebrows,pageTwoGrass,pageTwoSizzle,pageTwoSnail,pageTwoSnailWhite,pageTwoCornerCloud,pageTwoEyes,pageTwoLighthouseYellowWindow1,pageTwoLighthouseYellowWindow2,pageTwoLighthouseYellowWindow3] {
        object.hidden = true

        object.removeAllActions()
        }
    
    }
    
    func moveFromBaseImageThreeToZero() {
        
        for object in [pageThreeSun,pageThreeClam,pageThreeGrass1,pageThreeGrass2,pageThreeCrabBody,pageThreeCrabPincer1,pageThreeCrabPincer2,pageThreeCrabPincer3,pageThreeBall,pageThreeCloud,pageThreeStarfishInBucketBody,pageThreeBucketHandle,pageThreeStarfishEyes,pageThreeBird,pageThreeRocks,pageThreeSand] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageThreeActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
    }
    
    func removePageThreeActions() {
    
        for object in [pageThreeSun,pageThreeClam,pageThreeGrass1,pageThreeGrass2,pageThreeCrabBody,pageThreeCrabPincer1,pageThreeCrabPincer2,pageThreeCrabPincer3,pageThreeBall,pageThreeCloud,pageThreeStarfishInBucketBody,pageThreeBucketHandle,pageThreeStarfishEyes,pageThreeBird,pageThreeRocks,pageThreeSand] {
            object.hidden = true

            object.removeAllActions()
        }
    
    }
    
    
    
    func moveFromBaseImageFourToZero() {
        
        for object in [pageFourMattHand,pageFourMarcoHand,pageFourBird1,pageFourBird2,pageFourCloud,pageFourCrabBody,pageFourCrabPincer1,pageFourCrabPincer2,pageFourCrabPincer3,pageFourCrabPincer4,pageFourCrabLeftClaw,pageFourCrabRightClaw,pageFourStarfish,pageFourClam1,pageFourClam2,pageFourClam3,pageFourClam4,pageFourClam5,pageFourRock] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageFourActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
    }
    
    func removePageFourActions() {
    
        for object in [pageFourMattHand,pageFourMarcoHand,pageFourBird1,pageFourBird2,pageFourCloud,pageFourCrabBody,pageFourCrabPincer1,pageFourCrabPincer2,pageFourCrabPincer3,pageFourCrabPincer4,pageFourCrabLeftClaw,pageFourCrabRightClaw,pageFourStarfish,pageFourClam1,pageFourClam2,pageFourClam3,pageFourClam4,pageFourClam5,pageFourRock] {
            object.hidden = true

            object.removeAllActions()
        }
    }
    
    func moveFromBaseImageFiveToZero() {
        
        for object in [pageFiveLeftShed,pageFiveRightShed,pageFiveBird,pageFiveLeftBoot,pageFiveRightBoot,pageFiveCrabBody,pageFiveCrabRightClaw,pageFiveStarfish,pageFiveMarcoLeg,pageFiveThump,pageFiveMattLeftHand,pageFiveMattRightHand,pageFiveRock,pageFiveBall] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageFiveActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
    }
    
    func removePageFiveActions() {
    
    
    for object in [pageFiveLeftShed,pageFiveRightShed,pageFiveBird,pageFiveLeftBoot,pageFiveRightBoot,pageFiveCrabBody,pageFiveCrabRightClaw,pageFiveStarfish,pageFiveMarcoLeg,pageFiveThump,pageFiveMattLeftHand,pageFiveMattRightHand,pageFiveRock,pageFiveBall] {
        object.hidden = true

        object.removeAllActions()
        }
    }
    
    func moveFromBaseImageSixToZero() {
        
        for object in [pageSixSnail,pageSixSun,pageSixBoot1,pageSixBoot2,pageSixSpider,pageSixCrabPincer1,pageSixCrabPincer2,pageSixCrabPincer3,pageSixCrabEyebrows,pageSixBall,pageSixThumpText,pageSixThumpImage,pageSixStarfish,pageSixClam1,pageSixClam2,pageSixClam3] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageSixActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
    }
    
    func removePageSixActions() {
    
        for object in [pageSixSnail,pageSixSun,pageSixBoot1,pageSixBoot2,pageSixSpider,pageSixCrabPincer1,pageSixCrabPincer2,pageSixCrabPincer3,pageSixCrabEyebrows,pageSixBall,pageSixThumpText,pageSixThumpImage,pageSixStarfish,pageSixClam1,pageSixClam2,pageSixClam3] {
            object.hidden = true

            object.removeAllActions()
        }
    
    }
    
    func moveFromBaseImageSevenToZero() {
        
        for object in [pageSevenBall,pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4,pageSevenEvieArm,pageSevenOlly,pageSevenPicture,pageSevenBlock1,pageSevenBlock2,pageSevenBlock3,pageSevenBlock4,pageSevenBlock5,pageSevenBlock6,pageSevenBlock7,pageSevenBlock8,pageSevenEvieMask] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageSevenActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
    }
    
    func removePageSevenActions() {
    
    for object in [pageSevenBall,pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4,pageSevenEvieArm,pageSevenOlly,pageSevenPicture,pageSevenBlock1,pageSevenBlock2,pageSevenBlock3,pageSevenBlock4,pageSevenBlock5,pageSevenBlock6,pageSevenBlock7,pageSevenBlock8,pageSevenEvieMask] {
        object.hidden = true

        object.removeAllActions()
        }
            
        
        
    }
    
    func moveFromBaseImageEightToZero() {
        
        for object in [pageEightFlorry1,pageEightFlorry1Wings,pageEightFlorry2,pageEightFlorry2Wings,pageEightBootSet1,pageEightBootSet2,pageEightPaddy,pageEightSeahorse,pageEightWheel,pageEightGreenPlant,pageEightRedOrangePlant,pageEightStarfish,pageEightJellyfish,pageEightRocks] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageEightActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
    }
    
    func removePageEightActions() {
    
    for object in [pageEightFlorry1,pageEightFlorry1Wings,pageEightFlorry2,pageEightFlorry2Wings,pageEightBootSet1,pageEightBootSet2,pageEightPaddy,pageEightSeahorse,pageEightWheel,pageEightGreenPlant,pageEightRedOrangePlant,pageEightStarfish,pageEightJellyfish,pageEightRocks] {
        object.hidden = true

        object.removeAllActions()
        }
    
    }
    
    func moveFromBaseImageNineToZero() {
        
        for object in [pageNineWorm,pageNineStarfish,pageNineJellyfish,pageNinePaddy,pageNineLizard,pageNineClam1,pageNineClam2,pageNineClam3,pageNineRedGreenPlant,pageNineSeahorse,pageNineFlorry,pageNineFlorryWings] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageNineActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
    }
    
    func removePageNineActions() {
    
    for object in [pageNineWorm,pageNineStarfish,pageNineJellyfish,pageNinePaddy,pageNineLizard,pageNineClam1,pageNineClam2,pageNineClam3,pageNineRedGreenPlant,pageNineSeahorse,pageNineFlorry,pageNineFlorryWings] {
        object.hidden = true

        object.removeAllActions()
        }
    
    }



    func moveFromBaseImageTenToZero() {
        for object in [pageTenFurtherInfo] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        let arrowFadeIn = SKAction.fadeInWithDuration(0)
        fowardButton.runAction(arrowFadeIn)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
    }




    
    func moveFromBaseImageOneToZero() {
        //only delete the objects used on page one, no need to load the home page objects as they are loaded in the 'return main objs ' in the 'move to pre page' func
        for object in [pageOneStarfish,pageOneClamOne,pageOneClamTwo,pageOneClamThree,pageOneBirdOne,pageOneBirdTwo,pageOneFlorryOne,pageOneFlorryOneWings,pageOneFlorryTwo,pageOneFlorryTwoWings,pageOneFlorryThree,pageOneWaterMask] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageOneActions), userInfo: nil, repeats: false)
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImageiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "baseTitleImage"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
    }
    
    func moveFromBaseImageOneToTwo() {
        for object in [pageOneStarfish,pageOneClamOne,pageOneClamTwo,pageOneClamThree,pageOneBirdOne,pageOneBirdTwo,pageOneFlorryOne,pageOneFlorryOneWings,pageOneFlorryTwo,pageOneFlorryTwoWings,pageOneFlorryThree,pageOneWaterMask] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            //object.hidden = true
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.20, target: self, selector: #selector(MainMenuScene.removePageOneActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageTwoiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageTwo"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            pageTwoBall = SKSpriteNode(imageNamed: "frontBalliPadPro")
            pageTwoClam1 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageTwoClam2 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageTwoClam3 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageTwoClam4 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageTwoLighthouse = SKSpriteNode(imageNamed: "pageTwoLighthouseiPadPro")
            pageTwoCloud = SKSpriteNode(imageNamed: "pageTwoCloudiPadPro")
            pageTwoSun = SKSpriteNode(imageNamed: "pageTwoSuniPadPro")
            pageTwoCrabBody = SKSpriteNode(imageNamed: "pageTwoCrabBodyiPadPro")
            pageTwoCrabPincer1 = SKSpriteNode(imageNamed: "pageTwoCrabPincer1iPadPro")
            pageTwoCrabPincer2 = SKSpriteNode(imageNamed: "pageTwoCrabPincer2iPadPro")
            pageTwoCrabPincer3 = SKSpriteNode(imageNamed: "pageTwoCrabPincer3iPadPro")
            pageTwoCrabEyebrows = SKSpriteNode(imageNamed: "pageTwoCrabEyebrowsiPadPro")
            pageTwoGrass = SKSpriteNode(imageNamed: "pageTwoGrassiPadPro")
            pageTwoSnail = SKSpriteNode(imageNamed: "pageTwoSnailiPadPro")
            pageTwoSnailWhite = SKSpriteNode(imageNamed: "pageTwoSnailWhiteiPadPro")
            pageTwoCornerCloud = SKSpriteNode(imageNamed: "pageTwoCornerCloudiPadPro")
            pageTwoSizzle = SKSpriteNode(imageNamed: "pageTwoSizzleiPadPro")
            pageTwoEyes = SKSpriteNode(imageNamed: "pageTwoEyesiPadPro")
            pageTwoLighthouseYellowWindow1 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindowiPadPro")
            pageTwoLighthouseYellowWindow2 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindowiPadPro")
             pageTwoLighthouseYellowWindow3 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindowiPadPro")

        default:
            pageTwoBall = SKSpriteNode(imageNamed: "frontBall")
            pageTwoClam1 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageTwoClam2 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageTwoClam3 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageTwoClam4 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageTwoLighthouse = SKSpriteNode(imageNamed: "pageTwoLighthouse")
            pageTwoCloud = SKSpriteNode(imageNamed: "pageTwoCloud")
            pageTwoSun = SKSpriteNode(imageNamed: "pageTwoSun")
            pageTwoCrabBody = SKSpriteNode(imageNamed: "pageTwoCrabBody")
            pageTwoCrabPincer1 = SKSpriteNode(imageNamed: "pageTwoCrabPincer1")
            pageTwoCrabPincer2 = SKSpriteNode(imageNamed: "pageTwoCrabPincer2")
            pageTwoCrabPincer3 = SKSpriteNode(imageNamed: "pageTwoCrabPincer3")
            pageTwoCrabEyebrows = SKSpriteNode(imageNamed: "pageTwoCrabEyebrows")
            pageTwoGrass = SKSpriteNode(imageNamed: "pageTwoGrass")
            pageTwoSnail = SKSpriteNode(imageNamed: "pageTwoSnail")
            pageTwoSnailWhite = SKSpriteNode(imageNamed: "pageTwoSnailWhite")
            pageTwoCornerCloud = SKSpriteNode(imageNamed: "pageTwoCornerCloud")
            pageTwoSizzle = SKSpriteNode(imageNamed: "pageTwoSizzle")
            pageTwoEyes = SKSpriteNode(imageNamed: "pageTwoEyes")
            pageTwoLighthouseYellowWindow1 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindow")
            pageTwoLighthouseYellowWindow2 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindow")
            pageTwoLighthouseYellowWindow3 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindow")
        }
        
        
        
        pageTwoBall.position = CGPointMake(1202*self.size.width/2048, 483*self.size.height/1536)
        pageTwoClam1.position = CGPointMake(865*self.size.width/2048, 575*self.size.height/1536)
        pageTwoClam2.position = CGPointMake(1017*self.size.width/2048, 259*self.size.height/1536)
        pageTwoClam3.position = CGPointMake(1615*self.size.width/2048, 276*self.size.height/1536)
        pageTwoClam4.position = CGPointMake(1700*self.size.width/2048, 319*self.size.height/1536)
        pageTwoLighthouse.position = CGPointMake(785*self.size.width/2048, 1264*self.size.height/1536)
        pageTwoCloud.position = CGPointMake(1493*self.size.width/2048, 1400*self.size.height/1536)
        pageTwoSun.position = CGPointMake(1829*self.size.width/2048, 1424*self.size.height/1536)
        pageTwoCrabBody.position = CGPointMake(1029*self.size.width/2048, 831*self.size.height/1536)
        pageTwoCrabPincer1.position = CGPointMake(834*self.size.width/2048, 809*self.size.height/1536)
        pageTwoCrabPincer2.position = CGPointMake(862*self.size.width/2048, 794*self.size.height/1536)
        pageTwoCrabPincer3.position = CGPointMake(910*self.size.width/2048, 785*self.size.height/1536)
        pageTwoCrabEyebrows.position = CGPointMake(1031*self.size.width/2048, 982*self.size.height/1536)
        pageTwoGrass.position = CGPointMake(741*self.size.width/2048, 494*self.size.height/1536)
        pageTwoSnail.position = CGPointMake(1940*self.size.width/2048, 324*self.size.height/1536)
        pageTwoSnailWhite.position = CGPointMake(1955*self.size.width/2048, 260*self.size.height/1536)
        pageTwoCornerCloud.position = CGPointMake(1829*self.size.width/2048, 1376*self.size.height/1536)
        pageTwoSizzle.position = CGPointMake(1669*self.size.width/2048, 926*self.size.height/1536)
        pageTwoEyes.position = CGPointMake(784*self.size.width/2048, 386*self.size.height/1536)
        pageTwoLighthouseYellowWindow1.position = CGPointMake(779*self.size.width/2048, 1312*self.size.height/1536)
        pageTwoLighthouseYellowWindow2.position = CGPointMake(779*self.size.width/2048, 1270*self.size.height/1536)
        pageTwoLighthouseYellowWindow3.position = CGPointMake(784*self.size.width/2048, 1192*self.size.height/1536)
        
        pageTwoBall.xScale = 181/240
        pageTwoBall.yScale = 161/216
        pageTwoClam2.xScale = 110/128
        pageTwoClam2.yScale = 104/138
        pageTwoClam2.zRotation = 1.57
        pageTwoClam3.xScale = 138/128
        pageTwoClam3.yScale = 136/138
        pageTwoClam3.zRotation = 1.57
        pageTwoClam4.xScale = 71/128
        pageTwoClam4.yScale = 72/138
        for object in [pageTwoBall,pageTwoClam1,pageTwoClam2,pageTwoClam3,pageTwoClam4,pageTwoLighthouse,pageTwoCloud,pageTwoSun,pageTwoCrabBody,pageTwoCrabPincer1,pageTwoCrabPincer2,pageTwoCrabPincer3,pageTwoCrabEyebrows,pageTwoGrass,pageTwoSnail,pageTwoSnailWhite,pageTwoCornerCloud,pageTwoEyes] {
            object.zPosition = 5
            addChild(object)

            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        for object in [pageTwoSizzle,pageTwoLighthouseYellowWindow1,pageTwoLighthouseYellowWindow2,pageTwoLighthouseYellowWindow3] {
            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0)
                ]))
        }
        pageTwoEyes.zPosition = 6
        pageTwoSnail.zPosition = 6

        pageTwoLighthouseYellowWindow1.zPosition = 6
        pageTwoLighthouseYellowWindow2.zPosition = 6
        pageTwoLighthouseYellowWindow3.zPosition = 6
        pageTwoSizzle.zPosition = 6

        pageTwoCornerCloud.zPosition = 6
        pageTwoBall.zPosition = 7

        
    }
    
    func moveFromBaseImageTwoToOne() {
        
        for object in [pageTwoBall,pageTwoClam1,pageTwoClam2,pageTwoClam3,pageTwoClam4,pageTwoLighthouse,pageTwoCloud,pageTwoSun,pageTwoCrabBody,pageTwoCrabPincer1,pageTwoCrabPincer2,pageTwoCrabPincer3,pageTwoCrabEyebrows,pageTwoGrass,pageTwoSizzle,pageTwoSnail,pageTwoSnailWhite,pageTwoCornerCloud,pageTwoEyes,pageTwoLighthouseYellowWindow1,pageTwoLighthouseYellowWindow2,pageTwoLighthouseYellowWindow3] {
            let fadeOut = SKAction.fadeOutWithDuration(0.10)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageTwoActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageOneiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageOne"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            pageOneStarfish = SKSpriteNode(imageNamed: "pageOneStarfishiPadPro")
            pageOneClamOne = SKSpriteNode(imageNamed: "pageOneClamiPadPro")
            pageOneClamTwo = SKSpriteNode(imageNamed: "pageOneClamiPadPro")
            pageOneClamThree = SKSpriteNode(imageNamed: "pageOneClamiPadPro")
            pageOneFlorryOne = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageOneFlorryOneWings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
            pageOneFlorryTwo = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageOneFlorryTwoWings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
            pageOneFlorryThree = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageOneWaterMask = SKSpriteNode(imageNamed: "pageOneWaterMaskiPadPro")
        default:
            pageOneStarfish = SKSpriteNode(imageNamed: "pageOneStarfish")
            pageOneClamOne = SKSpriteNode(imageNamed: "pageOneClam")
            pageOneClamTwo = SKSpriteNode(imageNamed: "pageOneClam")
            pageOneClamThree = SKSpriteNode(imageNamed: "pageOneClam")
            pageOneFlorryOne = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageOneFlorryOneWings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
            pageOneFlorryTwo = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageOneFlorryTwoWings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
            pageOneFlorryThree = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageOneWaterMask = SKSpriteNode(imageNamed: "pageOneWaterMask")
        }
        
        for object in ["pageOneBirdOne","pageOneBirdTwo"] {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            switch screenSize.height {
            case 1366:
                loadPageOneObjectAtlasiPadPro(object)
            default:
                loadPageOneObjectAtlasiPad(object)
            }
        }
        
        
        pageOneStarfish.position = CGPointMake(785*self.size.width/2048, 606*self.size.height/1536)
        pageOneClamOne.position = CGPointMake(745*self.size.width/2048, 233*self.size.height/1536)
        pageOneClamTwo.position = CGPointMake(691*self.size.width/2048, 424*self.size.height/1536)
        pageOneClamThree.position = CGPointMake(721*self.size.width/2048, 460*self.size.height/1536)
        pageOneFlorryOne.position = CGPointMake(878*self.size.width/2048, 865*self.size.height/1536)
        pageOneFlorryOneWings.position = CGPointMake(834*self.size.width/2048, 856*self.size.height/1536)
        pageOneFlorryTwo.position = CGPointMake(1228*self.size.width/2048, 471*self.size.height/1536)
        pageOneFlorryTwoWings.position = CGPointMake(1181*self.size.width/2048, 463*self.size.height/1536)
        pageOneFlorryThree.position = CGPointMake(1774*self.size.width/2048, 308*self.size.height/1536)
        pageOneWaterMask.position = CGPointMake(1649*self.size.width/2048, 336*self.size.height/1536)
        
        pageOneClamTwo.zRotation = 3.14
        pageOneClamThree.zRotation = 1.57
        pageOneFlorryThree.zRotation = -0.7
        pageOneFlorryOneWings.anchorPoint = CGPointMake(0, 0)
        pageOneFlorryTwoWings.anchorPoint = CGPointMake(0, 0)
        
        for object in [pageOneStarfish,pageOneClamOne,pageOneClamTwo,pageOneClamThree,pageOneFlorryOne,pageOneFlorryOneWings,pageOneFlorryTwo,pageOneFlorryTwoWings,pageOneFlorryThree,pageOneWaterMask] {
            object.zPosition = 5
            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        
    }
    
    func moveFromBaseImageTwoToThree() {
        
        for object in [pageTwoBall,pageTwoClam1,pageTwoClam2,pageTwoClam3,pageTwoClam4,pageTwoLighthouse,pageTwoCloud,pageTwoSun,pageTwoCrabBody,pageTwoCrabPincer1,pageTwoCrabPincer2,pageTwoCrabPincer3,pageTwoCrabEyebrows,pageTwoGrass,pageTwoSizzle,pageTwoSnail,pageTwoSnailWhite,pageTwoCornerCloud,pageTwoEyes,pageTwoLighthouseYellowWindow1,pageTwoLighthouseYellowWindow2,pageTwoLighthouseYellowWindow3] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageTwoActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageThreeiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageThree"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            pageThreeSun = SKSpriteNode(imageNamed: "pageThreeSunYellowiPadPro")
            pageThreeClam = SKSpriteNode(imageNamed: "pageThreeClamiPadPro")
            pageThreeGrass1 = SKSpriteNode(imageNamed: "pageThreeGrass1iPadPro")
            pageThreeGrass2 = SKSpriteNode(imageNamed: "pageThreeGrass2iPadPro")
            pageThreeCrabBody = SKSpriteNode(imageNamed: "pageThreeCrabBodyiPadPro")
            pageThreeCrabPincer1 = SKSpriteNode(imageNamed: "pageThreeCrabPincer1iPadPro")
            pageThreeCrabPincer2 = SKSpriteNode(imageNamed: "pageThreeCrabPincer2iPadPro")
            pageThreeCrabPincer3 = SKSpriteNode(imageNamed: "pageThreeCrabPincer3iPadPro")
            pageThreeBall = SKSpriteNode(imageNamed: "pageThreeBalliPadPro")
            pageThreeCloud = SKSpriteNode(imageNamed: "pageThreeCloudiPadPro")
            pageThreeStarfishInBucketBody = SKSpriteNode(imageNamed: "pageThreeStarfishInBucketBodyiPadPro")
            pageThreeBucketHandle = SKSpriteNode(imageNamed: "pageThreeBucketHandleiPadPro")
            pageThreeStarfishEyes = SKSpriteNode(imageNamed: "pageThreeStarfishEyesiPadPro")
            pageThreeBird = SKSpriteNode(imageNamed: "pageThreeBirdiPadPro")
            pageThreeSand = SKSpriteNode(imageNamed: "pageThreeSandiPadPro")

            pageThreeRocks = SKSpriteNode(imageNamed: "pageThreeRocksiPadPro")

        default:
            pageThreeSun = SKSpriteNode(imageNamed: "pageThreeSunYellow")
            pageThreeClam = SKSpriteNode(imageNamed: "pageThreeClam")
            pageThreeGrass1 = SKSpriteNode(imageNamed: "pageThreeGrass1")
            pageThreeGrass2 = SKSpriteNode(imageNamed: "pageThreeGrass2")
            pageThreeCrabBody = SKSpriteNode(imageNamed: "pageThreeCrabBody")
            pageThreeCrabPincer1 = SKSpriteNode(imageNamed: "pageThreeCrabPincer1")
            pageThreeCrabPincer2 = SKSpriteNode(imageNamed: "pageThreeCrabPincer2")
            pageThreeCrabPincer3 = SKSpriteNode(imageNamed: "pageThreeCrabPincer3")
            pageThreeBall = SKSpriteNode(imageNamed: "pageThreeBall")
            pageThreeCloud = SKSpriteNode(imageNamed: "pageThreeCloud")
            pageThreeStarfishInBucketBody = SKSpriteNode(imageNamed: "pageThreeStarfishInBucketBody")
            pageThreeBucketHandle = SKSpriteNode(imageNamed: "pageThreeBucketHandle")
            pageThreeStarfishEyes = SKSpriteNode(imageNamed: "pageThreeStarfishEyes")
            pageThreeBird = SKSpriteNode(imageNamed: "pageThreeBird")
            pageThreeRocks = SKSpriteNode(imageNamed: "pageThreeRocks")
            pageThreeSand = SKSpriteNode(imageNamed: "pageThreeSand")

            
        }
        
         pageThreeCloud.position = CGPointMake(1830*self.size.width/2048, 1220*self.size.height/1536)
         pageThreeSun.position = CGPointMake(1580*self.size.width/2048, 1386*self.size.height/1536)
         pageThreeClam.position = CGPointMake(1072*self.size.width/2048, 322*self.size.height/1536)
         pageThreeGrass1.position = CGPointMake(1815*self.size.width/2048, 409*self.size.height/1536)
         pageThreeGrass2.position = CGPointMake(1911*self.size.width/2048, 878*self.size.height/1536)
         pageThreeCrabBody.position = CGPointMake(1704*self.size.width/2048, 745*self.size.height/1536)
         pageThreeCrabPincer1.position = CGPointMake(1795*self.size.width/2048, 635*self.size.height/1536)
         pageThreeCrabPincer2.position = CGPointMake(1825*self.size.width/2048, 630*self.size.height/1536)
         pageThreeCrabPincer3.position = CGPointMake(1843*self.size.width/2048, 624*self.size.height/1536)
         pageThreeBall.position = CGPointMake(1771*self.size.width/2048, 522*self.size.height/1536)
         pageThreeStarfishInBucketBody.position = CGPointMake(832*self.size.width/2048, 336*self.size.height/1536)
         pageThreeBucketHandle.position = CGPointMake(850*self.size.width/2048, 303*self.size.height/1536)
         pageThreeStarfishEyes.position = CGPointMake(881*self.size.width/2048, 361*self.size.height/1536)
         pageThreeBird.position = CGPointMake(1450*self.size.width/2048, 356*self.size.height/1536)
         pageThreeRocks.position = CGPointMake(1956*self.size.width/2048, 488*self.size.height/1536)
         pageThreeSand.position = CGPointMake(1546*self.size.width/2048, 931*self.size.height/1536)

        
        pageThreeBucketHandle.anchorPoint = CGPointMake(1, 0)
        pageThreeBird.anchorPoint = CGPointMake(0.43, 0.14)
      


        
        
        for object in [pageThreeSun,pageThreeClam,pageThreeGrass1,pageThreeGrass2,pageThreeCrabBody,pageThreeCrabPincer1,pageThreeCrabPincer2,pageThreeCrabPincer3,pageThreeBall,pageThreeCloud,pageThreeStarfishInBucketBody,pageThreeBucketHandle,pageThreeStarfishEyes,pageThreeBird,pageThreeRocks,pageThreeSand] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageThreeBucketHandle.zPosition = 7
        pageThreeCrabBody.zPosition = 7
        pageThreeCrabPincer1.zPosition = 8
        pageThreeCrabPincer2.zPosition = 8
        pageThreeCrabPincer3.zPosition = 8
        pageThreeGrass1.zPosition = 8
        pageThreeSand.zPosition = 6
        
        
    }
    
    func moveFromBaseImageThreeToTwo() {
        
        for object in [pageThreeSun,pageThreeClam,pageThreeGrass1,pageThreeGrass2,pageThreeCrabBody,pageThreeCrabPincer1,pageThreeCrabPincer2,pageThreeCrabPincer3,pageThreeBall,pageThreeCloud,pageThreeStarfishInBucketBody,pageThreeBucketHandle,pageThreeStarfishEyes,pageThreeBird,pageThreeRocks,pageThreeSand] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageThreeActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageTwoiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageTwo"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            pageTwoBall = SKSpriteNode(imageNamed: "frontBalliPadPro")
            pageTwoClam1 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageTwoClam2 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageTwoClam3 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageTwoClam4 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageTwoLighthouse = SKSpriteNode(imageNamed: "pageTwoLighthouseiPadPro")
            pageTwoCloud = SKSpriteNode(imageNamed: "pageTwoCloudiPadPro")
            pageTwoSun = SKSpriteNode(imageNamed: "pageTwoSuniPadPro")
            pageTwoCrabBody = SKSpriteNode(imageNamed: "pageTwoCrabBodyiPadPro")
            pageTwoCrabPincer1 = SKSpriteNode(imageNamed: "pageTwoCrabPincer1iPadPro")
            pageTwoCrabPincer2 = SKSpriteNode(imageNamed: "pageTwoCrabPincer2iPadPro")
            pageTwoCrabPincer3 = SKSpriteNode(imageNamed: "pageTwoCrabPincer3iPadPro")
            pageTwoCrabEyebrows = SKSpriteNode(imageNamed: "pageTwoCrabEyebrowsiPadPro")
            pageTwoGrass = SKSpriteNode(imageNamed: "pageTwoGrassiPadPro")
            pageTwoSnail = SKSpriteNode(imageNamed: "pageTwoSnailiPadPro")
            pageTwoSnailWhite = SKSpriteNode(imageNamed: "pageTwoSnailWhiteiPadPro")
            pageTwoCornerCloud = SKSpriteNode(imageNamed: "pageTwoCornerCloudiPadPro")
            pageTwoSizzle = SKSpriteNode(imageNamed: "pageTwoSizzleiPadPro")
            pageTwoEyes = SKSpriteNode(imageNamed: "pageTwoEyesiPadPro")
            pageTwoLighthouseYellowWindow1 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindowiPadPro")
            pageTwoLighthouseYellowWindow2 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindowiPadPro")
            pageTwoLighthouseYellowWindow3 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindowiPadPro")
        default:
            pageTwoBall = SKSpriteNode(imageNamed: "frontBall")
            pageTwoClam1 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageTwoClam2 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageTwoClam3 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageTwoClam4 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageTwoLighthouse = SKSpriteNode(imageNamed: "pageTwoLighthouse")
            pageTwoCloud = SKSpriteNode(imageNamed: "pageTwoCloud")
            pageTwoSun = SKSpriteNode(imageNamed: "pageTwoSun")
            pageTwoCrabBody = SKSpriteNode(imageNamed: "pageTwoCrabBody")
            pageTwoCrabPincer1 = SKSpriteNode(imageNamed: "pageTwoCrabPincer1")
            pageTwoCrabPincer2 = SKSpriteNode(imageNamed: "pageTwoCrabPincer2")
            pageTwoCrabPincer3 = SKSpriteNode(imageNamed: "pageTwoCrabPincer3")
            pageTwoCrabEyebrows = SKSpriteNode(imageNamed: "pageTwoCrabEyebrows")
            pageTwoGrass = SKSpriteNode(imageNamed: "pageTwoGrass")
            pageTwoSnail = SKSpriteNode(imageNamed: "pageTwoSnail")
            pageTwoSnailWhite = SKSpriteNode(imageNamed: "pageTwoSnailWhite")
            pageTwoCornerCloud = SKSpriteNode(imageNamed: "pageTwoCornerCloud")
            pageTwoSizzle = SKSpriteNode(imageNamed: "pageTwoSizzle")
            pageTwoEyes = SKSpriteNode(imageNamed: "pageTwoEyes")
            pageTwoLighthouseYellowWindow1 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindow")
            pageTwoLighthouseYellowWindow2 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindow")
            pageTwoLighthouseYellowWindow3 = SKSpriteNode(imageNamed: "pageTwoLighthouseYellowWindow")
            
        }
        
        
        
        pageTwoBall.position = CGPointMake(1202*self.size.width/2048, 483*self.size.height/1536)
        pageTwoClam1.position = CGPointMake(865*self.size.width/2048, 575*self.size.height/1536)
        pageTwoClam2.position = CGPointMake(1017*self.size.width/2048, 259*self.size.height/1536)
        pageTwoClam3.position = CGPointMake(1615*self.size.width/2048, 276*self.size.height/1536)
        pageTwoClam4.position = CGPointMake(1700*self.size.width/2048, 319*self.size.height/1536)
        pageTwoLighthouse.position = CGPointMake(785*self.size.width/2048, 1264*self.size.height/1536)
        pageTwoCloud.position = CGPointMake(1493*self.size.width/2048, 1400*self.size.height/1536)
        pageTwoSun.position = CGPointMake(1829*self.size.width/2048, 1424*self.size.height/1536)
        pageTwoCrabBody.position = CGPointMake(1029*self.size.width/2048, 831*self.size.height/1536)
        pageTwoCrabPincer1.position = CGPointMake(834*self.size.width/2048, 809*self.size.height/1536)
        pageTwoCrabPincer2.position = CGPointMake(862*self.size.width/2048, 794*self.size.height/1536)
        pageTwoCrabPincer3.position = CGPointMake(910*self.size.width/2048, 785*self.size.height/1536)
        pageTwoCrabEyebrows.position = CGPointMake(1031*self.size.width/2048, 982*self.size.height/1536)
        pageTwoGrass.position = CGPointMake(741*self.size.width/2048, 494*self.size.height/1536)
        pageTwoSnail.position = CGPointMake(1940*self.size.width/2048, 324*self.size.height/1536)
        pageTwoSnailWhite.position = CGPointMake(1955*self.size.width/2048, 260*self.size.height/1536)
        pageTwoCornerCloud.position = CGPointMake(1829*self.size.width/2048, 1376*self.size.height/1536)
        pageTwoSizzle.position = CGPointMake(1669*self.size.width/2048, 926*self.size.height/1536)
        pageTwoEyes.position = CGPointMake(784*self.size.width/2048, 386*self.size.height/1536)
        pageTwoLighthouseYellowWindow1.position = CGPointMake(779*self.size.width/2048, 1312*self.size.height/1536)
        pageTwoLighthouseYellowWindow2.position = CGPointMake(779*self.size.width/2048, 1270*self.size.height/1536)
        pageTwoLighthouseYellowWindow3.position = CGPointMake(784*self.size.width/2048, 1192*self.size.height/1536)
        
        pageTwoBall.xScale = 181/240
        pageTwoBall.yScale = 161/216
        pageTwoClam2.xScale = 110/128
        pageTwoClam2.yScale = 104/138
        pageTwoClam2.zRotation = 1.57
        pageTwoClam3.xScale = 138/128
        pageTwoClam3.yScale = 136/138
        pageTwoClam3.zRotation = 1.57
        pageTwoClam4.xScale = 71/128
        pageTwoClam4.yScale = 72/138

        for object in [pageTwoBall,pageTwoClam1,pageTwoClam2,pageTwoClam3,pageTwoClam4,pageTwoLighthouse,pageTwoCloud,pageTwoSun,pageTwoCrabBody,pageTwoCrabPincer1,pageTwoCrabPincer2,pageTwoCrabPincer3,pageTwoCrabEyebrows,pageTwoGrass,pageTwoSnail,pageTwoSnailWhite,pageTwoCornerCloud,pageTwoEyes] {
            object.zPosition = 5
            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        
        for object in [pageTwoSizzle,pageTwoLighthouseYellowWindow1,pageTwoLighthouseYellowWindow2,pageTwoLighthouseYellowWindow3] {
            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0)
                
                ]))
        }
        pageTwoEyes.zPosition = 6

        pageTwoEyes.zPosition = 6
        pageTwoSnail.zPosition = 6

        pageTwoLighthouseYellowWindow1.zPosition = 6
        pageTwoLighthouseYellowWindow2.zPosition = 6
        pageTwoLighthouseYellowWindow3.zPosition = 6
        pageTwoSizzle.zPosition = 6

        pageTwoCornerCloud.zPosition = 6
        pageTwoBall.zPosition = 7

    }
    
    func moveFromBaseImageThreeToFour() {
        
        for object in [pageThreeSun,pageThreeClam,pageThreeGrass1,pageThreeGrass2,pageThreeCrabBody,pageThreeCrabPincer1,pageThreeCrabPincer2,pageThreeCrabPincer3,pageThreeBall,pageThreeCloud,pageThreeStarfishInBucketBody,pageThreeBucketHandle,pageThreeStarfishEyes,pageThreeBird,pageThreeRocks,pageThreeSand] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageThreeActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageFouriPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageFour"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            pageFourMattHand = SKSpriteNode(imageNamed: "pageFourMattHandiPadPro")
            pageFourMarcoHand = SKSpriteNode(imageNamed: "pageFourMarcoHandiPadPro")
            pageFourCloud = SKSpriteNode(imageNamed: "pageThreeCloudiPadPro")
            pageFourCrabBody = SKSpriteNode(imageNamed: "pageFourCrabBodyiPadPro")
            pageFourCrabPincer1 = SKSpriteNode(imageNamed: "pageFourCrabPincer1iPadPro")
            pageFourCrabPincer2 = SKSpriteNode(imageNamed: "pageFourCrabPincer2iPadPro")
            pageFourCrabPincer3 = SKSpriteNode(imageNamed: "pageFourCrabPincer3iPadPro")
            pageFourCrabPincer4 = SKSpriteNode(imageNamed: "pageFourCrabPincer4iPadPro")
            pageFourCrabLeftClaw = SKSpriteNode(imageNamed: "pageFourCrabLeftClawiPadPro")
            pageFourCrabRightClaw = SKSpriteNode(imageNamed: "pageFourCrabRightClawiPadPro")
            pageFourStarfish = SKSpriteNode(imageNamed: "pageFourStarfishiPadPro")
            pageFourClam1 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourClam2 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourClam3 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourClam4 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourClam5 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourRock = SKSpriteNode(imageNamed: "pageFourRockiPadPro")

        default:
            pageFourMattHand = SKSpriteNode(imageNamed: "pageFourMattHand")
            pageFourMarcoHand = SKSpriteNode(imageNamed: "pageFourMarcoHand")
            pageFourCloud = SKSpriteNode(imageNamed: "pageThreeCloud")
            pageFourCrabBody = SKSpriteNode(imageNamed: "pageFourCrabBody")
            pageFourCrabPincer1 = SKSpriteNode(imageNamed: "pageFourCrabPincer1")
            pageFourCrabPincer2 = SKSpriteNode(imageNamed: "pageFourCrabPincer2")
            pageFourCrabPincer3 = SKSpriteNode(imageNamed: "pageFourCrabPincer3")
            pageFourCrabPincer4 = SKSpriteNode(imageNamed: "pageFourCrabPincer4")
            pageFourCrabLeftClaw = SKSpriteNode(imageNamed: "pageFourCrabLeftClaw")
            pageFourCrabRightClaw = SKSpriteNode(imageNamed: "pageFourCrabRightClaw")
            pageFourStarfish = SKSpriteNode(imageNamed: "pageFourStarfish")
            pageFourClam1 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourClam2 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourClam3 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourClam4 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourClam5 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourRock = SKSpriteNode(imageNamed: "pageFourRock")

            
        }
        
        for object in ["pageFourBird1","pageFourBird2"] {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            switch screenSize.height {
            case 1366:
                loadPageFourObjectAtlasiPadPro(object)
            default:
                loadPageFourObjectAtlasiPad(object)
            }
        }
        
        
        pageFourMattHand.position = CGPointMake(1352*self.size.width/2048, 1284*self.size.height/1536)
        pageFourMarcoHand.position = CGPointMake(1627*self.size.width/2048, 1188*self.size.height/1536)
        pageFourCloud.position = CGPointMake(840*self.size.width/2048, 1367*self.size.height/1536)
        pageFourCrabBody.position = CGPointMake(1768*self.size.width/2048, 860*self.size.height/1536)
        pageFourCrabPincer1.position = CGPointMake(1650*self.size.width/2048, 780*self.size.height/1536)
        pageFourCrabPincer2.position = CGPointMake(1695*self.size.width/2048, 770*self.size.height/1536)
        pageFourCrabPincer3.position = CGPointMake(1745*self.size.width/2048, 758*self.size.height/1536)
        pageFourCrabPincer4.position = CGPointMake(1893*self.size.width/2048, 825*self.size.height/1536)
        pageFourCrabLeftClaw.position = CGPointMake(1668*self.size.width/2048, 843*self.size.height/1536)
        pageFourCrabRightClaw.position = CGPointMake(1798*self.size.width/2048, 884*self.size.height/1536)
        pageFourStarfish.position = CGPointMake(1511*self.size.width/2048, 579*self.size.height/1536)
        pageFourClam1.position = CGPointMake(742*self.size.width/2048, 431*self.size.height/1536)
        pageFourClam2.position = CGPointMake(984*self.size.width/2048, 463*self.size.height/1536)
        pageFourClam3.position = CGPointMake(1178*self.size.width/2048, 320*self.size.height/1536)
        pageFourClam4.position = CGPointMake(1831*self.size.width/2048, 371*self.size.height/1536)
        pageFourClam5.position = CGPointMake(1920*self.size.width/2048, 415*self.size.height/1536)
        pageFourRock.position = CGPointMake(1682*self.size.width/2048, 557*self.size.height/1536)
        
        pageFourClam1.xScale = 81/128
        pageFourClam1.yScale = 84/138
        pageFourClam2.xScale = 194/128
        pageFourClam2.yScale = 183/138
        pageFourClam2.zRotation = 1.57
        pageFourClam4.xScale = 99/128
        pageFourClam4.yScale = 98/138
        pageFourClam4.zRotation = 1.57
        pageFourClam5.xScale = 99/128
        pageFourClam5.yScale = 98/138
        pageFourClam5.zRotation = 3.14
        pageFourMattHand.anchorPoint = CGPointMake(0.60, 0.07)
        pageFourMarcoHand.anchorPoint = CGPointMake(0.16, 0.07)
        pageFourCrabLeftClaw.anchorPoint = CGPointMake(0.91, 0.55)
        pageFourCrabRightClaw.anchorPoint = CGPointMake(0.17, 0.08)

        
        for object in [pageFourMattHand,pageFourMarcoHand,pageFourCloud,pageFourCrabBody,pageFourCrabPincer1,pageFourCrabPincer2,pageFourCrabPincer3,pageFourCrabPincer4,pageFourCrabLeftClaw,pageFourCrabRightClaw,pageFourStarfish,pageFourClam1,pageFourClam2,pageFourClam3,pageFourClam4,pageFourClam5,pageFourRock] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageFourCrabBody.zPosition = 6
        pageFourCrabLeftClaw.zPosition = 7
        pageFourCrabPincer1.zPosition = 7
        pageFourCrabPincer2.zPosition = 7
        pageFourCrabPincer3.zPosition = 7
        pageFourStarfish.zPosition = 6
        pageFourRock.zPosition = 7


        
    }
    
    func moveFromBaseImageFourToThree() {
        
        for object in [pageFourMattHand,pageFourMarcoHand,pageFourBird1,pageFourBird2,pageFourCloud,pageFourCrabBody,pageFourCrabPincer1,pageFourCrabPincer2,pageFourCrabPincer3,pageFourCrabPincer4,pageFourCrabLeftClaw,pageFourCrabRightClaw,pageFourStarfish,pageFourClam1,pageFourClam2,pageFourClam3,pageFourClam4,pageFourClam5,pageFourRock] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageFourActions), userInfo: nil, repeats: false)
        
        
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageThreeiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageThree"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            pageThreeSun = SKSpriteNode(imageNamed: "pageThreeSunYellowiPadPro")
            pageThreeClam = SKSpriteNode(imageNamed: "pageThreeClamiPadPro")
            pageThreeGrass1 = SKSpriteNode(imageNamed: "pageThreeGrass1iPadPro")
            pageThreeGrass2 = SKSpriteNode(imageNamed: "pageThreeGrass2iPadPro")
            pageThreeCrabBody = SKSpriteNode(imageNamed: "pageThreeCrabBodyiPadPro")
            pageThreeCrabPincer1 = SKSpriteNode(imageNamed: "pageThreeCrabPincer1iPadPro")
            pageThreeCrabPincer2 = SKSpriteNode(imageNamed: "pageThreeCrabPincer2iPadPro")
            pageThreeCrabPincer3 = SKSpriteNode(imageNamed: "pageThreeCrabPincer3iPadPro")
            pageThreeBall = SKSpriteNode(imageNamed: "pageThreeBalliPadPro")
            pageThreeCloud = SKSpriteNode(imageNamed: "pageThreeCloudiPadPro")
            pageThreeStarfishInBucketBody = SKSpriteNode(imageNamed: "pageThreeStarfishInBucketBodyiPadPro")
            pageThreeBucketHandle = SKSpriteNode(imageNamed: "pageThreeBucketHandleiPadPro")
            pageThreeStarfishEyes = SKSpriteNode(imageNamed: "pageThreeStarfishEyesiPadPro")
            pageThreeBird = SKSpriteNode(imageNamed: "pageThreeBirdiPadPro")
            pageThreeSand = SKSpriteNode(imageNamed: "pageThreeSandiPadPro")
            
            pageThreeRocks = SKSpriteNode(imageNamed: "pageThreeRocksiPadPro")
            
        default:
            pageThreeSun = SKSpriteNode(imageNamed: "pageThreeSunYellow")
            pageThreeClam = SKSpriteNode(imageNamed: "pageThreeClam")
            pageThreeGrass1 = SKSpriteNode(imageNamed: "pageThreeGrass1")
            pageThreeGrass2 = SKSpriteNode(imageNamed: "pageThreeGrass2")
            pageThreeCrabBody = SKSpriteNode(imageNamed: "pageThreeCrabBody")
            pageThreeCrabPincer1 = SKSpriteNode(imageNamed: "pageThreeCrabPincer1")
            pageThreeCrabPincer2 = SKSpriteNode(imageNamed: "pageThreeCrabPincer2")
            pageThreeCrabPincer3 = SKSpriteNode(imageNamed: "pageThreeCrabPincer3")
            pageThreeBall = SKSpriteNode(imageNamed: "pageThreeBall")
            pageThreeCloud = SKSpriteNode(imageNamed: "pageThreeCloud")
            pageThreeStarfishInBucketBody = SKSpriteNode(imageNamed: "pageThreeStarfishInBucketBody")
            pageThreeBucketHandle = SKSpriteNode(imageNamed: "pageThreeBucketHandle")
            pageThreeStarfishEyes = SKSpriteNode(imageNamed: "pageThreeStarfishEyes")
            pageThreeBird = SKSpriteNode(imageNamed: "pageThreeBird")
            pageThreeRocks = SKSpriteNode(imageNamed: "pageThreeRocks")
            pageThreeSand = SKSpriteNode(imageNamed: "pageThreeSand")
            
            
        }
        
        pageThreeCloud.position = CGPointMake(1830*self.size.width/2048, 1220*self.size.height/1536)
        pageThreeSun.position = CGPointMake(1580*self.size.width/2048, 1386*self.size.height/1536)
        pageThreeClam.position = CGPointMake(1072*self.size.width/2048, 322*self.size.height/1536)
        pageThreeGrass1.position = CGPointMake(1815*self.size.width/2048, 409*self.size.height/1536)
        pageThreeGrass2.position = CGPointMake(1911*self.size.width/2048, 878*self.size.height/1536)
        pageThreeCrabBody.position = CGPointMake(1704*self.size.width/2048, 745*self.size.height/1536)
        pageThreeCrabPincer1.position = CGPointMake(1795*self.size.width/2048, 635*self.size.height/1536)
        pageThreeCrabPincer2.position = CGPointMake(1825*self.size.width/2048, 630*self.size.height/1536)
        pageThreeCrabPincer3.position = CGPointMake(1843*self.size.width/2048, 624*self.size.height/1536)
        pageThreeBall.position = CGPointMake(1771*self.size.width/2048, 522*self.size.height/1536)
        pageThreeStarfishInBucketBody.position = CGPointMake(832*self.size.width/2048, 336*self.size.height/1536)
        pageThreeBucketHandle.position = CGPointMake(850*self.size.width/2048, 303*self.size.height/1536)
        pageThreeStarfishEyes.position = CGPointMake(881*self.size.width/2048, 361*self.size.height/1536)
        pageThreeBird.position = CGPointMake(1450*self.size.width/2048, 356*self.size.height/1536)
        pageThreeRocks.position = CGPointMake(1956*self.size.width/2048, 488*self.size.height/1536)
        pageThreeSand.position = CGPointMake(1546*self.size.width/2048, 931*self.size.height/1536)
        
        
        pageThreeBucketHandle.anchorPoint = CGPointMake(1, 0)
        pageThreeBird.anchorPoint = CGPointMake(0.43, 0.14)
        
        
        
        
        
        for object in [pageThreeSun,pageThreeClam,pageThreeGrass1,pageThreeGrass2,pageThreeCrabBody,pageThreeCrabPincer1,pageThreeCrabPincer2,pageThreeCrabPincer3,pageThreeBall,pageThreeCloud,pageThreeStarfishInBucketBody,pageThreeBucketHandle,pageThreeStarfishEyes,pageThreeBird,pageThreeRocks,pageThreeSand] {
            object.zPosition = 5
            
            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageThreeBucketHandle.zPosition = 7
        pageThreeCrabBody.zPosition = 7
        pageThreeCrabPincer1.zPosition = 8
        pageThreeCrabPincer2.zPosition = 8
        pageThreeCrabPincer3.zPosition = 8
        pageThreeGrass1.zPosition = 8
        pageThreeSand.zPosition = 6
    }
    
    func moveFromBaseImageFourToFive() {
        
        for object in [pageFourMattHand,pageFourMarcoHand,pageFourBird1,pageFourBird2,pageFourCloud,pageFourCrabBody,pageFourCrabPincer1,pageFourCrabPincer2,pageFourCrabPincer3,pageFourCrabPincer4,pageFourCrabLeftClaw,pageFourCrabRightClaw,pageFourStarfish,pageFourClam1,pageFourClam2,pageFourClam3,pageFourClam4,pageFourClam5,pageFourRock] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageFourActions), userInfo: nil, repeats: false)
        
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageFiveiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageFive"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            pageFiveLeftShed = SKSpriteNode(imageNamed: "pageFiveLeftShedYellowiPadPro")
            pageFiveRightShed = SKSpriteNode(imageNamed: "pageFiveRightShedRediPadPro")
            pageFiveLeftBoot = SKSpriteNode(imageNamed: "pageFiveLeftBootBlueiPadPro")
            pageFiveRightBoot = SKSpriteNode(imageNamed: "pageFiveRightBootGreeniPadPro")
            pageFiveCrabBody = SKSpriteNode(imageNamed: "pageFiveCrabBodyiPadPro")
            pageFiveCrabRightClaw = SKSpriteNode(imageNamed: "pageFiveCrabRightClawiPadPro")
            pageFiveStarfish = SKSpriteNode(imageNamed: "pageFiveStarfishiPadPro")
            pageFiveMarcoLeg = SKSpriteNode(imageNamed: "pageFiveMarcoLegiPadPro")
            pageFiveThump = SKSpriteNode(imageNamed: "pageFiveThumpiPadPro")
            pageFiveMattLeftHand = SKSpriteNode(imageNamed: "pageFiveMattLeftHandiPadPro")
            pageFiveMattRightHand = SKSpriteNode(imageNamed: "pageFiveMattRightHandiPadPro")
            pageFiveRock = SKSpriteNode(imageNamed: "pageFiveRockGreeniPadPro")
            pageFiveBall = SKSpriteNode(imageNamed: "pageFiveBalliPadPro")
        default:
            pageFiveLeftShed = SKSpriteNode(imageNamed: "pageFiveLeftShedYellow")
            pageFiveRightShed = SKSpriteNode(imageNamed: "pageFiveRightShedRed")
            pageFiveLeftBoot = SKSpriteNode(imageNamed: "pageFiveLeftBootBlue")
            pageFiveRightBoot = SKSpriteNode(imageNamed: "pageFiveRightBootGreen")
            pageFiveCrabBody = SKSpriteNode(imageNamed: "pageFiveCrabBody")
            pageFiveCrabRightClaw = SKSpriteNode(imageNamed: "pageFiveCrabRightClaw")
            pageFiveStarfish = SKSpriteNode(imageNamed: "pageFiveStarfish")
            pageFiveMarcoLeg = SKSpriteNode(imageNamed: "pageFiveMarcoLeg")
            pageFiveThump = SKSpriteNode(imageNamed: "pageFiveThump")
            pageFiveMattLeftHand = SKSpriteNode(imageNamed: "pageFiveMattLeftHand")
            pageFiveMattRightHand = SKSpriteNode(imageNamed: "pageFiveMattRightHand")
            pageFiveRock = SKSpriteNode(imageNamed: "pageFiveRockGreen")
            pageFiveBall = SKSpriteNode(imageNamed: "pageFiveBall")

            
        }
        
        for object in ["pageFiveBird"] {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            switch screenSize.height {
            case 1366:
                loadPageFiveObjectAtlasiPadPro(object)
            default:
                loadPageFiveObjectAtlasiPad(object)
            }
        }
        
        
        
        pageFiveLeftShed.position = CGPointMake(745*self.size.width/2048, 1149*self.size.height/1536)
        pageFiveRightShed.position = CGPointMake(870*self.size.width/2048, 1135*self.size.height/1536)
        pageFiveLeftBoot.position = CGPointMake(1062*self.size.width/2048, 642*self.size.height/1536)
        pageFiveRightBoot.position = CGPointMake(1620*self.size.width/2048, 1078*self.size.height/1536)
        pageFiveCrabBody.position = CGPointMake(879*self.size.width/2048, 578*self.size.height/1536)
        pageFiveCrabRightClaw.position = CGPointMake(986*self.size.width/2048, 504*self.size.height/1536)
        pageFiveStarfish.position = CGPointMake(1366*self.size.width/2048, 432*self.size.height/1536)
        pageFiveMarcoLeg.position = CGPointMake(1669*self.size.width/2048, 565*self.size.height/1536)
        pageFiveThump.position = CGPointMake(1477*self.size.width/2048, 606*self.size.height/1536)
        pageFiveMattLeftHand.position = CGPointMake(1782*self.size.width/2048, 1098*self.size.height/1536)
        pageFiveMattRightHand.position = CGPointMake(1942*self.size.width/2048, 1098*self.size.height/1536)
        pageFiveRock.position = CGPointMake(1188*self.size.width/2048, 436*self.size.height/1536)
        pageFiveBall.position = CGPointMake(1490*self.size.width/2048, 587*self.size.height/1536)
        
        pageFiveCrabRightClaw.anchorPoint = CGPointMake(0.11, 0.36)
        pageFiveMarcoLeg.anchorPoint = CGPointMake(0.84, 0.73)
        pageFiveMattLeftHand.anchorPoint = CGPointMake(0.676, 0.155)
        pageFiveMattRightHand.anchorPoint = CGPointMake(0.257, 0.162)
        p5lsc = 0
        p5rsc = 0
        p5lbc = 0
        p5rbc = 0
        pageFiveThump.alpha = 0
        pageFiveThump.setScale(0.1)

        for object in [pageFiveLeftShed,pageFiveRightShed,pageFiveLeftBoot,pageFiveRightBoot,pageFiveCrabBody,pageFiveCrabRightClaw,pageFiveStarfish,pageFiveMarcoLeg,pageFiveThump,pageFiveMattLeftHand,pageFiveMattRightHand,pageFiveRock,pageFiveBall] {
            
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
    pageFiveCrabBody.zPosition = 6
        
    }
    
    func moveFromBaseImageFiveToFour() {
        
        for object in [pageFiveLeftShed,pageFiveRightShed,pageFiveBird,pageFiveLeftBoot,pageFiveRightBoot,pageFiveCrabBody,pageFiveCrabRightClaw,pageFiveStarfish,pageFiveMarcoLeg,pageFiveThump,pageFiveMattLeftHand,pageFiveMattRightHand,pageFiveRock,pageFiveBall] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageFiveActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageFouriPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageFour"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        switch screenSize.height {
        case 1366:
            pageFourMattHand = SKSpriteNode(imageNamed: "pageFourMattHandiPadPro")
            pageFourMarcoHand = SKSpriteNode(imageNamed: "pageFourMarcoHandiPadPro")
            pageFourCloud = SKSpriteNode(imageNamed: "pageThreeCloudiPadPro")
            pageFourCrabBody = SKSpriteNode(imageNamed: "pageFourCrabBodyiPadPro")
            pageFourCrabPincer1 = SKSpriteNode(imageNamed: "pageFourCrabPincer1iPadPro")
            pageFourCrabPincer2 = SKSpriteNode(imageNamed: "pageFourCrabPincer2iPadPro")
            pageFourCrabPincer3 = SKSpriteNode(imageNamed: "pageFourCrabPincer3iPadPro")
            pageFourCrabPincer4 = SKSpriteNode(imageNamed: "pageFourCrabPincer4iPadPro")
            pageFourCrabLeftClaw = SKSpriteNode(imageNamed: "pageFourCrabLeftClawiPadPro")
            pageFourCrabRightClaw = SKSpriteNode(imageNamed: "pageFourCrabRightClawiPadPro")
            pageFourStarfish = SKSpriteNode(imageNamed: "pageFourStarfishiPadPro")
            pageFourClam1 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourClam2 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourClam3 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourClam4 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourClam5 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageFourRock = SKSpriteNode(imageNamed: "pageFourRockiPadPro")
            
        default:
            pageFourMattHand = SKSpriteNode(imageNamed: "pageFourMattHand")
            pageFourMarcoHand = SKSpriteNode(imageNamed: "pageFourMarcoHand")
            pageFourCloud = SKSpriteNode(imageNamed: "pageThreeCloud")
            pageFourCrabBody = SKSpriteNode(imageNamed: "pageFourCrabBody")
            pageFourCrabPincer1 = SKSpriteNode(imageNamed: "pageFourCrabPincer1")
            pageFourCrabPincer2 = SKSpriteNode(imageNamed: "pageFourCrabPincer2")
            pageFourCrabPincer3 = SKSpriteNode(imageNamed: "pageFourCrabPincer3")
            pageFourCrabPincer4 = SKSpriteNode(imageNamed: "pageFourCrabPincer4")
            pageFourCrabLeftClaw = SKSpriteNode(imageNamed: "pageFourCrabLeftClaw")
            pageFourCrabRightClaw = SKSpriteNode(imageNamed: "pageFourCrabRightClaw")
            pageFourStarfish = SKSpriteNode(imageNamed: "pageFourStarfish")
            pageFourClam1 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourClam2 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourClam3 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourClam4 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourClam5 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageFourRock = SKSpriteNode(imageNamed: "pageFourRock")
            
            
        }
        
        for object in ["pageFourBird1","pageFourBird2"] {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            switch screenSize.height {
            case 1366:
                loadPageFourObjectAtlasiPadPro(object)
            default:
                loadPageFourObjectAtlasiPad(object)
            }
        }
        
        
        pageFourMattHand.position = CGPointMake(1352*self.size.width/2048, 1284*self.size.height/1536)
        pageFourMarcoHand.position = CGPointMake(1627*self.size.width/2048, 1188*self.size.height/1536)
        pageFourCloud.position = CGPointMake(840*self.size.width/2048, 1367*self.size.height/1536)
        pageFourCrabBody.position = CGPointMake(1768*self.size.width/2048, 860*self.size.height/1536)
        pageFourCrabPincer1.position = CGPointMake(1650*self.size.width/2048, 780*self.size.height/1536)
        pageFourCrabPincer2.position = CGPointMake(1695*self.size.width/2048, 770*self.size.height/1536)
        pageFourCrabPincer3.position = CGPointMake(1745*self.size.width/2048, 758*self.size.height/1536)
        pageFourCrabPincer4.position = CGPointMake(1893*self.size.width/2048, 825*self.size.height/1536)
        pageFourCrabLeftClaw.position = CGPointMake(1668*self.size.width/2048, 843*self.size.height/1536)
        pageFourCrabRightClaw.position = CGPointMake(1798*self.size.width/2048, 884*self.size.height/1536)
        pageFourStarfish.position = CGPointMake(1511*self.size.width/2048, 579*self.size.height/1536)
        pageFourClam1.position = CGPointMake(742*self.size.width/2048, 431*self.size.height/1536)
        pageFourClam2.position = CGPointMake(984*self.size.width/2048, 463*self.size.height/1536)
        pageFourClam3.position = CGPointMake(1178*self.size.width/2048, 320*self.size.height/1536)
        pageFourClam4.position = CGPointMake(1831*self.size.width/2048, 371*self.size.height/1536)
        pageFourClam5.position = CGPointMake(1920*self.size.width/2048, 415*self.size.height/1536)
        pageFourRock.position = CGPointMake(1682*self.size.width/2048, 557*self.size.height/1536)
        
        pageFourClam1.xScale = 81/128
        pageFourClam1.yScale = 84/138
        pageFourClam2.xScale = 194/128
        pageFourClam2.yScale = 183/138
        pageFourClam2.zRotation = 1.57
        pageFourClam4.xScale = 99/128
        pageFourClam4.yScale = 98/138
        pageFourClam4.zRotation = 1.57
        pageFourClam5.xScale = 99/128
        pageFourClam5.yScale = 98/138
        pageFourClam5.zRotation = 3.14
        pageFourMattHand.anchorPoint = CGPointMake(0.60, 0.07)
        pageFourMarcoHand.anchorPoint = CGPointMake(0.16, 0.07)
        pageFourCrabLeftClaw.anchorPoint = CGPointMake(0.91, 0.55)
        pageFourCrabRightClaw.anchorPoint = CGPointMake(0.17, 0.08)
        
        
        for object in [pageFourMattHand,pageFourMarcoHand,pageFourCloud,pageFourCrabBody,pageFourCrabPincer1,pageFourCrabPincer2,pageFourCrabPincer3,pageFourCrabPincer4,pageFourCrabLeftClaw,pageFourCrabRightClaw,pageFourStarfish,pageFourClam1,pageFourClam2,pageFourClam3,pageFourClam4,pageFourClam5,pageFourRock] {
            object.zPosition = 5
            
            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageFourCrabBody.zPosition = 6
        pageFourCrabLeftClaw.zPosition = 7
        pageFourCrabPincer1.zPosition = 7
        pageFourCrabPincer2.zPosition = 7
        pageFourCrabPincer3.zPosition = 7
        pageFourStarfish.zPosition = 6
        pageFourRock.zPosition = 7
    
    }
    
    func moveFromBaseImageFiveToSix() {
        
        for object in [pageFiveLeftShed,pageFiveRightShed,pageFiveBird,pageFiveLeftBoot,pageFiveRightBoot,pageFiveCrabBody,pageFiveCrabRightClaw,pageFiveStarfish,pageFiveMarcoLeg,pageFiveThump,pageFiveMattLeftHand,pageFiveMattRightHand,pageFiveRock,pageFiveBall] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageFiveActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageSixiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageSix"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        
        
        switch screenSize.height {
        case 1366:
            pageSixSnail = SKSpriteNode(imageNamed: "pageTwoSnailiPadPro")
       //     pageSixSnailWhite = SKSpriteNode(imageNamed: "pageSixSnailWhiteiPadPro")
            pageSixSun = SKSpriteNode(imageNamed: "pageSixSuniPadPro")
            pageSixBoot1 = SKSpriteNode(imageNamed: "pageSixBoot1BlueiPadPro")
            pageSixBoot2 = SKSpriteNode(imageNamed: "pageSixBoot2BlueiPadPro")
      //      pageSixBoot3 = SKSpriteNode(imageNamed: "pageSixBoot3iPadPro")
     //       pageSixBoot4 = SKSpriteNode(imageNamed: "pageSixBoot4iPadPro")
            pageSixSpider = SKSpriteNode(imageNamed: "pageSixSpideriPadPro")
      //      pageSixSpiderWeb = SKSpriteNode(imageNamed: "pageSixSpiderWebiPadPro")
            pageSixCrabPincer1 = SKSpriteNode(imageNamed: "pageSixCrabPincer1iPadPro")
            pageSixCrabPincer2 = SKSpriteNode(imageNamed: "pageSixCrabPincer2iPadPro")
            pageSixCrabPincer3 = SKSpriteNode(imageNamed: "pageSixCrabPincer3iPadPro")
            pageSixCrabEyebrows = SKSpriteNode(imageNamed: "pageSixCrabEyebrowsiPadPro")
            pageSixBall = SKSpriteNode(imageNamed: "pageFiveBalliPadPro")
            pageSixThumpText = SKSpriteNode(imageNamed: "pageSixThumpTextiPadPro")
            pageSixThumpImage = SKSpriteNode(imageNamed: "pageSixThumpImageiPadPro")
            pageSixStarfish = SKSpriteNode(imageNamed: "pageSixStarfishiPadPro")
    //        pageSixGrass1 = SKSpriteNode(imageNamed: "pageSixGrass1iPadPro")
     //       pageSixGrass2 = SKSpriteNode(imageNamed: "pageSixGrass2iPadPro")
            pageSixClam1 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageSixClam2 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageSixClam3 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
        default:
            pageSixSnail = SKSpriteNode(imageNamed: "pageTwoSnail")
      //      pageSixSnailWhite = SKSpriteNode(imageNamed: "pageSixSnailWhite")
            pageSixSun = SKSpriteNode(imageNamed: "pageSixSun")
            pageSixBoot1 = SKSpriteNode(imageNamed: "pageSixBoot1Blue")
            pageSixBoot2 = SKSpriteNode(imageNamed: "pageSixBoot2Blue")
       //     pageSixBoot3 = SKSpriteNode(imageNamed: "pageSixBoot3")
       //     pageSixBoot4 = SKSpriteNode(imageNamed: "pageSixBoot4")
            pageSixSpider = SKSpriteNode(imageNamed: "pageSixSpider")
       //     pageSixSpiderWeb = SKSpriteNode(imageNamed: "pageSixSpiderWeb")
            pageSixCrabPincer1 = SKSpriteNode(imageNamed: "pageSixCrabPincer1")
            pageSixCrabPincer2 = SKSpriteNode(imageNamed: "pageSixCrabPincer2")
            pageSixCrabPincer3 = SKSpriteNode(imageNamed: "pageSixCrabPincer3")
            pageSixCrabEyebrows = SKSpriteNode(imageNamed: "pageSixCrabEyebrows")
            pageSixBall = SKSpriteNode(imageNamed: "pageFiveBall")
            pageSixThumpText = SKSpriteNode(imageNamed: "pageSixThumpText")
            pageSixThumpImage = SKSpriteNode(imageNamed: "pageSixThumpImage")
            pageSixStarfish = SKSpriteNode(imageNamed: "pageSixStarfish")
      //      pageSixGrass1 = SKSpriteNode(imageNamed: "pageSixGrass1")
      ///      pageSixGrass2 = SKSpriteNode(imageNamed: "pageSixGrass2")
            pageSixClam1 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageSixClam2 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageSixClam3 = SKSpriteNode(imageNamed: "pageTwoClam")

            
        }
        
        
        
        pageSixSnail.position = CGPointMake(827*self.size.width/2048, 321*self.size.height/1536)
        pageSixSun.position = CGPointMake(1049*self.size.width/2048, 1387*self.size.height/1536)
        pageSixBoot1.position = CGPointMake(845*self.size.width/2048, 632*self.size.height/1536)
        pageSixBoot2.position = CGPointMake(1594*self.size.width/2048, 733*self.size.height/1536)
        pageSixSpider.position = CGPointMake(1707*self.size.width/2048, 489*self.size.height/1536)
        pageSixCrabPincer1.position = CGPointMake(1980*self.size.width/2048, 621*self.size.height/1536)
        pageSixCrabPincer2.position = CGPointMake(2002*self.size.width/2048, 635*self.size.height/1536)
        pageSixCrabPincer3.position = CGPointMake(2014*self.size.width/2048, 634*self.size.height/1536)
        pageSixCrabEyebrows.position = CGPointMake(1907*self.size.width/2048, 797*self.size.height/1536)
        pageSixBall.position = CGPointMake(1574*self.size.width/2048, 573*self.size.height/1536)
        pageSixThumpText.position = CGPointMake(1420*self.size.width/2048, 1325*self.size.height/1536)
        pageSixThumpImage.position = CGPointMake(1447*self.size.width/2048, 1169*self.size.height/1536)
        pageSixStarfish.position = CGPointMake(1419*self.size.width/2048, 454*self.size.height/1536)
        pageSixClam1.position = CGPointMake(701*self.size.width/2048, 293*self.size.height/1536)
        pageSixClam2.position = CGPointMake(1266*self.size.width/2048, 254*self.size.height/1536)
        pageSixClam3.position = CGPointMake(1705*self.size.width/2048, 324*self.size.height/1536)
        
        pageSixSnail.xScale = -1.0
        pageSixClam1.xScale = 104/128
        pageSixClam1.yScale = 102/138
        pageSixClam2.zRotation = 1.57
        pageSixClam3.xScale = 170/128
        pageSixClam3.yScale = 184/138
        p6b1 = 0
        p6b2 = 0
        pageSixSpider.anchorPoint = CGPointMake(0.54, 0.88)
        pageSixThumpText.alpha = 0
        pageSixThumpText.setScale(0.01)
        pageSixThumpImage.alpha = 0
        pageSixThumpImage.setScale(0.01)
        for object in [pageSixSnail,pageSixSun,pageSixBoot1,pageSixBoot2,pageSixSpider,pageSixCrabPincer1,pageSixCrabPincer2,pageSixCrabPincer3,pageSixCrabEyebrows,pageSixBall,pageSixThumpText,pageSixThumpImage,pageSixStarfish,pageSixClam1,pageSixClam2,pageSixClam3] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageSixBoot1.hidden = true
        pageSixBoot2.hidden = true

        
    }
    
    func moveFromBaseImageSixToFive() {
        
        for object in [pageSixSnail,pageSixSun,pageSixBoot1,pageSixBoot2,pageSixSpider,pageSixCrabPincer1,pageSixCrabPincer2,pageSixCrabPincer3,pageSixCrabEyebrows,pageSixBall,pageSixThumpText,pageSixThumpImage,pageSixStarfish,pageSixClam1,pageSixClam2,pageSixClam3] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageSixActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageFiveiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageFive"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        
        switch screenSize.height {
        case 1366:
            pageFiveLeftShed = SKSpriteNode(imageNamed: "pageFiveLeftShedYellowiPadPro")
            pageFiveRightShed = SKSpriteNode(imageNamed: "pageFiveRightShedRediPadPro")
            pageFiveLeftBoot = SKSpriteNode(imageNamed: "pageFiveLeftBootBlueiPadPro")
            pageFiveRightBoot = SKSpriteNode(imageNamed: "pageFiveRightBootGreeniPadPro")
            pageFiveCrabBody = SKSpriteNode(imageNamed: "pageFiveCrabBodyiPadPro")
            pageFiveCrabRightClaw = SKSpriteNode(imageNamed: "pageFiveCrabRightClawiPadPro")
            pageFiveStarfish = SKSpriteNode(imageNamed: "pageFiveStarfishiPadPro")
            pageFiveMarcoLeg = SKSpriteNode(imageNamed: "pageFiveMarcoLegiPadPro")
            pageFiveThump = SKSpriteNode(imageNamed: "pageFiveThumpiPadPro")
            pageFiveMattLeftHand = SKSpriteNode(imageNamed: "pageFiveMattLeftHandiPadPro")
            pageFiveMattRightHand = SKSpriteNode(imageNamed: "pageFiveMattRightHandiPadPro")
            pageFiveRock = SKSpriteNode(imageNamed: "pageFiveRockGreeniPadPro")
            pageFiveBall = SKSpriteNode(imageNamed: "pageFiveBalliPadPro")
        default:
            pageFiveLeftShed = SKSpriteNode(imageNamed: "pageFiveLeftShedYellow")
            pageFiveRightShed = SKSpriteNode(imageNamed: "pageFiveRightShedRed")
            pageFiveLeftBoot = SKSpriteNode(imageNamed: "pageFiveLeftBootBlue")
            pageFiveRightBoot = SKSpriteNode(imageNamed: "pageFiveRightBootGreen")
            pageFiveCrabBody = SKSpriteNode(imageNamed: "pageFiveCrabBody")
            pageFiveCrabRightClaw = SKSpriteNode(imageNamed: "pageFiveCrabRightClaw")
            pageFiveStarfish = SKSpriteNode(imageNamed: "pageFiveStarfish")
            pageFiveMarcoLeg = SKSpriteNode(imageNamed: "pageFiveMarcoLeg")
            pageFiveThump = SKSpriteNode(imageNamed: "pageFiveThump")
            pageFiveMattLeftHand = SKSpriteNode(imageNamed: "pageFiveMattLeftHand")
            pageFiveMattRightHand = SKSpriteNode(imageNamed: "pageFiveMattRightHand")
            pageFiveRock = SKSpriteNode(imageNamed: "pageFiveRockGreen")
            pageFiveBall = SKSpriteNode(imageNamed: "pageFiveBall")
            
        }
        
        for object in ["pageFiveBird"] {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            switch screenSize.height {
            case 1366:
                loadPageFiveObjectAtlasiPadPro(object)
            default:
                loadPageFiveObjectAtlasiPad(object)
            }
        }
        
        
        
        pageFiveLeftShed.position = CGPointMake(745*self.size.width/2048, 1149*self.size.height/1536)
        pageFiveRightShed.position = CGPointMake(870*self.size.width/2048, 1135*self.size.height/1536)
        pageFiveLeftBoot.position = CGPointMake(1062*self.size.width/2048, 642*self.size.height/1536)
        pageFiveRightBoot.position = CGPointMake(1620*self.size.width/2048, 1078*self.size.height/1536)
        pageFiveCrabBody.position = CGPointMake(879*self.size.width/2048, 578*self.size.height/1536)
        pageFiveCrabRightClaw.position = CGPointMake(986*self.size.width/2048, 504*self.size.height/1536)
        pageFiveStarfish.position = CGPointMake(1366*self.size.width/2048, 432*self.size.height/1536)
        pageFiveMarcoLeg.position = CGPointMake(1669*self.size.width/2048, 565*self.size.height/1536)
        pageFiveThump.position = CGPointMake(1477*self.size.width/2048, 606*self.size.height/1536)
        pageFiveMattLeftHand.position = CGPointMake(1782*self.size.width/2048, 1098*self.size.height/1536)
        pageFiveMattRightHand.position = CGPointMake(1942*self.size.width/2048, 1098*self.size.height/1536)
        pageFiveRock.position = CGPointMake(1188*self.size.width/2048, 436*self.size.height/1536)
        pageFiveBall.position = CGPointMake(1490*self.size.width/2048, 587*self.size.height/1536)
        
        pageFiveCrabRightClaw.anchorPoint = CGPointMake(0.11, 0.36)
        pageFiveMarcoLeg.anchorPoint = CGPointMake(0.84, 0.73)
        pageFiveMattLeftHand.anchorPoint = CGPointMake(0.676, 0.155)
        pageFiveMattRightHand.anchorPoint = CGPointMake(0.257, 0.162)
        p5lsc = 0
        p5rsc = 0
        p5lbc = 0
        p5rbc = 0
        pageFiveThump.alpha = 0
        pageFiveThump.setScale(0.1)
        for object in [pageFiveLeftShed,pageFiveRightShed,pageFiveLeftBoot,pageFiveRightBoot,pageFiveCrabBody,pageFiveCrabRightClaw,pageFiveStarfish,pageFiveMarcoLeg,pageFiveThump,pageFiveMattLeftHand,pageFiveMattRightHand,pageFiveRock,pageFiveBall] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }

        
    }
    
    func moveFromBaseImageSixToSeven() {
        
        for object in [pageSixSnail,pageSixSun,pageSixBoot1,pageSixBoot2,pageSixSpider,pageSixCrabPincer1,pageSixCrabPincer2,pageSixCrabPincer3,pageSixCrabEyebrows,pageSixBall,pageSixThumpText,pageSixThumpImage,pageSixStarfish,pageSixClam1,pageSixClam2,pageSixClam3] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageSixActions), userInfo: nil, repeats: false)
        
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageSeveniPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageSeven"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        
        
        switch screenSize.height {
        case 1366:
            pageSevenBall = SKSpriteNode(imageNamed: "pageSevenBalliPadPro")
            pageSevenLeaf1 = SKSpriteNode(imageNamed: "pageSevenLeafiPadPro")
            pageSevenLeaf2 = SKSpriteNode(imageNamed: "pageSevenLeafiPadPro")
            pageSevenLeaf3 = SKSpriteNode(imageNamed: "pageSevenLeafiPadPro")
            pageSevenLeaf4 = SKSpriteNode(imageNamed: "pageSevenLeafiPadPro")
            pageSevenEvieArm = SKSpriteNode(imageNamed: "pageSevenEvieArmiPadPro")
            pageSevenEvieMask = SKSpriteNode(imageNamed: "pageSevenEvieMaskiPadPro")

            pageSevenOlly = SKSpriteNode(imageNamed: "pageSevenOllyiPadPro")
         //   pageSevenVase = SKSpriteNode(imageNamed: "pageSevenVaseiPadPro")
            pageSevenPicture = SKSpriteNode(imageNamed: "pageSevenPictureBlackiPadPro")
         //   pageSevenMattArm = SKSpriteNode(imageNamed: "pageSevenMattArmiPadPro")
         //   pageSevenMarcoArm = SKSpriteNode(imageNamed: "pageSevenMarcoArmiPadPro")
            pageSevenBlock1 = SKSpriteNode(imageNamed: "pageSevenBlock1iPadPro")
            pageSevenBlock2 = SKSpriteNode(imageNamed: "pageSevenBlock1iPadPro")
            pageSevenBlock3 = SKSpriteNode(imageNamed: "pageSevenBlock1iPadPro")
            pageSevenBlock4 = SKSpriteNode(imageNamed: "pageSevenBlock2iPadPro")
            pageSevenBlock5 = SKSpriteNode(imageNamed: "pageSevenBlock3iPadPro")
            pageSevenBlock6 = SKSpriteNode(imageNamed: "pageSevenBlock3iPadPro")
            pageSevenBlock7 = SKSpriteNode(imageNamed: "pageSevenBlock2iPadPro")
            pageSevenBlock8 = SKSpriteNode(imageNamed: "pageSevenBlock2iPadPro")
        default:
            pageSevenBall = SKSpriteNode(imageNamed: "pageSevenBall")
            pageSevenLeaf1 = SKSpriteNode(imageNamed: "pageSevenLeaf")
            pageSevenLeaf2 = SKSpriteNode(imageNamed: "pageSevenLeaf")
            pageSevenLeaf3 = SKSpriteNode(imageNamed: "pageSevenLeaf")
            pageSevenLeaf4 = SKSpriteNode(imageNamed: "pageSevenLeaf")
            pageSevenEvieArm = SKSpriteNode(imageNamed: "pageSevenEvieArm")
            pageSevenEvieMask = SKSpriteNode(imageNamed: "pageSevenEvieMask")

            pageSevenOlly = SKSpriteNode(imageNamed: "pageSevenOlly")
          //  pageSevenVase = SKSpriteNode(imageNamed: "pageSevenVase")
            pageSevenPicture = SKSpriteNode(imageNamed: "pageSevenPictureBlack")
           // pageSevenMattArm = SKSpriteNode(imageNamed: "pageSevenMattArm")
           // pageSevenMarcoArm = SKSpriteNode(imageNamed: "pageSevenMarcoArm")
            pageSevenBlock1 = SKSpriteNode(imageNamed: "pageSevenBlock1")
            pageSevenBlock2 = SKSpriteNode(imageNamed: "pageSevenBlock1")
            pageSevenBlock3 = SKSpriteNode(imageNamed: "pageSevenBlock1")
            pageSevenBlock4 = SKSpriteNode(imageNamed: "pageSevenBlock2")
            pageSevenBlock5 = SKSpriteNode(imageNamed: "pageSevenBlock3")
            pageSevenBlock6 = SKSpriteNode(imageNamed: "pageSevenBlock3")
            pageSevenBlock7 = SKSpriteNode(imageNamed: "pageSevenBlock2")
            pageSevenBlock8 = SKSpriteNode(imageNamed: "pageSevenBlock2")

        }
        
        pageSevenBall.position = CGPointMake(854*self.size.width/2048, 490*self.size.height/1536)
        pageSevenEvieArm.position = CGPointMake(1633*self.size.width/2048, 377*self.size.height/1536)
        pageSevenEvieMask.position = CGPointMake(1538*self.size.width/2048, 351*self.size.height/1536)

        pageSevenOlly.position = CGPointMake(1909*self.size.width/2048, 657*self.size.height/1536)
        pageSevenPicture.position = CGPointMake(1523*self.size.width/2048, 1331*self.size.height/1536)
        pageSevenBlock1.position = CGPointMake(1062*self.size.width/2048, 286*self.size.height/1536)
        pageSevenBlock2.position = CGPointMake(1089*self.size.width/2048, 337*self.size.height/1536)
        pageSevenBlock3.position = CGPointMake(1153*self.size.width/2048, 290*self.size.height/1536)
        pageSevenBlock4.position = CGPointMake(1760*self.size.width/2048, 429*self.size.height/1536)
        pageSevenBlock5.position = CGPointMake(1708*self.size.width/2048, 372*self.size.height/1536)
        pageSevenBlock6.position = CGPointMake(1765*self.size.width/2048, 319*self.size.height/1536)
        pageSevenBlock7.position = CGPointMake(1736*self.size.width/2048, 255*self.size.height/1536)
        pageSevenBlock8.position = CGPointMake(1791*self.size.width/2048, 280*self.size.height/1536)
        pageSevenLeaf1.position = CGPointMake(1195*self.size.width/2048, 1355*self.size.height/1536)
        pageSevenLeaf2.position = CGPointMake(1250*self.size.width/2048, 1345*self.size.height/1536)
        pageSevenLeaf3.position = CGPointMake(1210*self.size.width/2048, 1330*self.size.height/1536)
        pageSevenLeaf4.position = CGPointMake(1210*self.size.width/2048, 1293*self.size.height/1536)
        
        pageSevenLeaf2.xScale = -1.0
        pageSevenLeaf4.xScale = -1.0

        
        pageSevenBlock5.xScale = -1.0
        pageSevenBlock7.xScale = -1.0
        pageSevenBlock8.xScale = -1.0
        p7p = 0
        p7b5 = 1


        for object in [pageSevenBall,pageSevenEvieArm,pageSevenOlly,pageSevenPicture,pageSevenBlock1,pageSevenBlock2,pageSevenBlock3,pageSevenBlock4,pageSevenBlock5,pageSevenBlock6,pageSevenBlock7,pageSevenBlock8,pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4,pageSevenEvieMask] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        for object in [pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4]{
            object.runAction(SKAction.fadeOutWithDuration(0))
        }
    
        
        pageSevenEvieArm.zPosition = 9
        pageSevenEvieMask.zPosition = 10
        pageSevenBlock2.zPosition = 7
        pageSevenBlock3.zPosition = 6
        
        pageSevenBlock4.zPosition = 9
        pageSevenBlock5.zPosition = 8
        pageSevenBlock6.zPosition = 7
        pageSevenBlock7.zPosition = 6
        pageSevenBlock8.zPosition = 5

    }
    
    func moveFromBaseImageSevenToSix() {
        
        for object in [pageSevenBall,pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4,pageSevenEvieArm,pageSevenOlly,pageSevenPicture,pageSevenBlock1,pageSevenBlock2,pageSevenBlock3,pageSevenBlock4,pageSevenBlock5,pageSevenBlock6,pageSevenBlock7,pageSevenBlock8,pageSevenEvieMask] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageSevenActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageSixiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageSix"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        
        switch screenSize.height {
        case 1366:
            pageSixSnail = SKSpriteNode(imageNamed: "pageTwoSnailiPadPro")
            //     pageSixSnailWhite = SKSpriteNode(imageNamed: "pageSixSnailWhiteiPadPro")
            pageSixSun = SKSpriteNode(imageNamed: "pageSixSuniPadPro")
            pageSixBoot1 = SKSpriteNode(imageNamed: "pageSixBoot1BlueiPadPro")
            pageSixBoot2 = SKSpriteNode(imageNamed: "pageSixBoot2BlueiPadPro")
            //      pageSixBoot3 = SKSpriteNode(imageNamed: "pageSixBoot3iPadPro")
            //       pageSixBoot4 = SKSpriteNode(imageNamed: "pageSixBoot4iPadPro")
            pageSixSpider = SKSpriteNode(imageNamed: "pageSixSpideriPadPro")
            //      pageSixSpiderWeb = SKSpriteNode(imageNamed: "pageSixSpiderWebiPadPro")
            pageSixCrabPincer1 = SKSpriteNode(imageNamed: "pageSixCrabPincer1iPadPro")
            pageSixCrabPincer2 = SKSpriteNode(imageNamed: "pageSixCrabPincer2iPadPro")
            pageSixCrabPincer3 = SKSpriteNode(imageNamed: "pageSixCrabPincer3iPadPro")
            pageSixCrabEyebrows = SKSpriteNode(imageNamed: "pageSixCrabEyebrowsiPadPro")
            pageSixBall = SKSpriteNode(imageNamed: "pageFiveBalliPadPro")
            pageSixThumpText = SKSpriteNode(imageNamed: "pageSixThumpTextiPadPro")
            pageSixThumpImage = SKSpriteNode(imageNamed: "pageSixThumpImageiPadPro")
            pageSixStarfish = SKSpriteNode(imageNamed: "pageSixStarfishiPadPro")
            //        pageSixGrass1 = SKSpriteNode(imageNamed: "pageSixGrass1iPadPro")
            //       pageSixGrass2 = SKSpriteNode(imageNamed: "pageSixGrass2iPadPro")
            pageSixClam1 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageSixClam2 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageSixClam3 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
        default:
            pageSixSnail = SKSpriteNode(imageNamed: "pageTwoSnail")
            //      pageSixSnailWhite = SKSpriteNode(imageNamed: "pageSixSnailWhite")
            pageSixSun = SKSpriteNode(imageNamed: "pageSixSun")
            pageSixBoot1 = SKSpriteNode(imageNamed: "pageSixBoot1Blue")
            pageSixBoot2 = SKSpriteNode(imageNamed: "pageSixBoot2Blue")
            //     pageSixBoot3 = SKSpriteNode(imageNamed: "pageSixBoot3")
            //     pageSixBoot4 = SKSpriteNode(imageNamed: "pageSixBoot4")
            pageSixSpider = SKSpriteNode(imageNamed: "pageSixSpider")
            //     pageSixSpiderWeb = SKSpriteNode(imageNamed: "pageSixSpiderWeb")
            pageSixCrabPincer1 = SKSpriteNode(imageNamed: "pageSixCrabPincer1")
            pageSixCrabPincer2 = SKSpriteNode(imageNamed: "pageSixCrabPincer2")
            pageSixCrabPincer3 = SKSpriteNode(imageNamed: "pageSixCrabPincer3")
            pageSixCrabEyebrows = SKSpriteNode(imageNamed: "pageSixCrabEyebrows")
            pageSixBall = SKSpriteNode(imageNamed: "pageFiveBall")
            pageSixThumpText = SKSpriteNode(imageNamed: "pageSixThumpText")
            pageSixThumpImage = SKSpriteNode(imageNamed: "pageSixThumpImage")
            pageSixStarfish = SKSpriteNode(imageNamed: "pageSixStarfish")
            //      pageSixGrass1 = SKSpriteNode(imageNamed: "pageSixGrass1")
            ///      pageSixGrass2 = SKSpriteNode(imageNamed: "pageSixGrass2")
            pageSixClam1 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageSixClam2 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageSixClam3 = SKSpriteNode(imageNamed: "pageTwoClam")
            
            
        }
        
        
        
        pageSixSnail.position = CGPointMake(827*self.size.width/2048, 321*self.size.height/1536)
        pageSixSun.position = CGPointMake(1049*self.size.width/2048, 1387*self.size.height/1536)
        pageSixBoot1.position = CGPointMake(845*self.size.width/2048, 632*self.size.height/1536)
        pageSixBoot2.position = CGPointMake(1594*self.size.width/2048, 733*self.size.height/1536)
        pageSixSpider.position = CGPointMake(1707*self.size.width/2048, 489*self.size.height/1536)
        pageSixCrabPincer1.position = CGPointMake(1980*self.size.width/2048, 621*self.size.height/1536)
        pageSixCrabPincer2.position = CGPointMake(2002*self.size.width/2048, 635*self.size.height/1536)
        pageSixCrabPincer3.position = CGPointMake(2014*self.size.width/2048, 634*self.size.height/1536)
        pageSixCrabEyebrows.position = CGPointMake(1907*self.size.width/2048, 797*self.size.height/1536)
        pageSixBall.position = CGPointMake(1574*self.size.width/2048, 573*self.size.height/1536)
        pageSixThumpText.position = CGPointMake(1420*self.size.width/2048, 1325*self.size.height/1536)
        pageSixThumpImage.position = CGPointMake(1447*self.size.width/2048, 1169*self.size.height/1536)
        pageSixStarfish.position = CGPointMake(1419*self.size.width/2048, 454*self.size.height/1536)
        pageSixClam1.position = CGPointMake(701*self.size.width/2048, 293*self.size.height/1536)
        pageSixClam2.position = CGPointMake(1266*self.size.width/2048, 254*self.size.height/1536)
        pageSixClam3.position = CGPointMake(1705*self.size.width/2048, 324*self.size.height/1536)
        pageSixSnail.xScale = -1.0
        pageSixClam1.xScale = 104/128
        pageSixClam1.yScale = 102/138
        pageSixClam2.zRotation = 1.57
        pageSixClam3.xScale = 170/128
        pageSixClam3.yScale = 184/138
        p6b1 = 0
        p6b2 = 0
        pageSixSpider.anchorPoint = CGPointMake(0.54, 0.88)
        pageSixThumpText.alpha = 0
        pageSixThumpText.setScale(0.01)
        pageSixThumpImage.alpha = 0
        pageSixThumpImage.setScale(0.01)
        for object in [pageSixSnail,pageSixSun,pageSixBoot1,pageSixBoot2,pageSixSpider,pageSixCrabPincer1,pageSixCrabPincer2,pageSixCrabPincer3,pageSixCrabEyebrows,pageSixBall,pageSixThumpText,pageSixThumpImage,pageSixStarfish,pageSixClam1,pageSixClam2,pageSixClam3] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageSixBoot1.hidden = true
        pageSixBoot2.hidden = true
    }
    
    func moveFromBaseImageSevenToEight() {
        
        for object in [pageSevenBall,pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4,pageSevenEvieArm,pageSevenOlly,pageSevenPicture,pageSevenBlock1,pageSevenBlock2,pageSevenBlock3,pageSevenBlock4,pageSevenBlock5,pageSevenBlock6,pageSevenBlock7,pageSevenBlock8,pageSevenEvieMask] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageSevenActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageEightiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageEight"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        
        switch screenSize.height {
        case 1366:
            pageEightFlorry1 = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageEightFlorry1Wings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
            pageEightFlorry2 = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageEightFlorry2Wings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
           
            pageEightBootSet1 = SKSpriteNode(imageNamed: "pageEightBootSet1iPadPro")
            pageEightBootSet2 = SKSpriteNode(imageNamed: "pageEightBootSet2iPadPro")
            pageEightPaddy = SKSpriteNode(imageNamed: "titlePaddyiPadPro")
            pageEightSeahorse = SKSpriteNode(imageNamed: "titleSeahorseiPadPro")
            pageEightWheel = SKSpriteNode(imageNamed: "pageEightWheeliPadPro")
            pageEightGreenPlant = SKSpriteNode(imageNamed: "pageEightGreenPlantiPadPro")
            pageEightRedOrangePlant = SKSpriteNode(imageNamed: "pageEightROPlantiPadPro")
            pageEightStarfish = SKSpriteNode(imageNamed: "pageEightStarfishiPadPro")
          //  pageEightBubble1 = SKSpriteNode(imageNamed: "pageEightBubble1iPadPro")
          //  pageEightBubble2 = SKSpriteNode(imageNamed: "pageEightBubble2iPadPro")
          //  pageEightBubble3 = SKSpriteNode(imageNamed: "pageEightBubble3iPadPro")
            pageEightJellyfish = SKSpriteNode(imageNamed: "titleJellyfishiPadPro")
            pageEightRocks = SKSpriteNode(imageNamed: "pageEightRocksiPadPro")

        default:
            pageEightFlorry1 = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageEightFlorry1Wings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
            pageEightFlorry2 = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageEightFlorry2Wings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
           
            pageEightBootSet1 = SKSpriteNode(imageNamed: "pageEightBootSet1")
            pageEightBootSet2 = SKSpriteNode(imageNamed: "pageEightBootSet2")
            pageEightPaddy = SKSpriteNode(imageNamed: "titlePaddy")
            pageEightSeahorse = SKSpriteNode(imageNamed: "titleSeahorse")
            pageEightWheel = SKSpriteNode(imageNamed: "pageEightWheel")
            pageEightGreenPlant = SKSpriteNode(imageNamed: "pageEightGreenPlant")
            pageEightRedOrangePlant = SKSpriteNode(imageNamed: "pageEightROPlant")
            pageEightStarfish = SKSpriteNode(imageNamed: "pageEightStarfish")
          //  pageEightBubble1 = SKSpriteNode(imageNamed: "pageEightBubble1")
          //  pageEightBubble2 = SKSpriteNode(imageNamed: "pageEightBubble2")
          //  pageEightBubble3 = SKSpriteNode(imageNamed: "pageEightBubble3")
            pageEightJellyfish = SKSpriteNode(imageNamed: "titleJellyfish")
            pageEightRocks = SKSpriteNode(imageNamed: "pageEightRocks")


            
        }
        
        pageEightFlorry1.position = CGPointMake(880*self.size.width/2048, 1214*self.size.height/1536)
        pageEightFlorry1Wings.position = CGPointMake(918*self.size.width/2048, 1200*self.size.height/1536)
        pageEightFlorry2.position = CGPointMake(1248*self.size.width/2048, 1330*self.size.height/1536)
        pageEightFlorry2Wings.position = CGPointMake(1287*self.size.width/2048, 1320*self.size.height/1536)
        pageEightBootSet1.position = CGPointMake(1196*self.size.width/2048, 776*self.size.height/1536)
        pageEightBootSet2.position = CGPointMake(1522*self.size.width/2048, 811*self.size.height/1536)
        pageEightPaddy.position = CGPointMake(793*self.size.width/2048, 682*self.size.height/1536)
        pageEightSeahorse.position = CGPointMake(1200*self.size.width/2048, 300*self.size.height/1536)
        pageEightWheel.position = CGPointMake(922*self.size.width/2048, 355*self.size.height/1536)
        pageEightGreenPlant.position = CGPointMake(1373*self.size.width/2048, 422*self.size.height/1536)
        pageEightRedOrangePlant.position = CGPointMake(1736*self.size.width/2048, 502*self.size.height/1536)
        pageEightStarfish.position = CGPointMake(1858*self.size.width/2048, 438*self.size.height/1536)
        pageEightJellyfish.position = CGPointMake(1879*self.size.width/2048, 1292*self.size.height/1536)
        pageEightRocks.position = CGPointMake(927*self.size.width/2048, 284*self.size.height/1536)
        
        pageEightWheel.anchorPoint = CGPointMake(0.48, 0.49)
        pageEightFlorry1.xScale = -1.0
        pageEightFlorry1Wings.xScale = -1.0
        pageEightFlorry2.xScale = -1.0
        pageEightFlorry2Wings.xScale = -1.0
        pageEightFlorry1Wings.anchorPoint = CGPointMake(0, 0)
        pageEightFlorry2Wings.anchorPoint = CGPointMake(0, 0)
        p8RO = 0
        p8G = 0
        p8BS1 = 0
        p8BS2 = 0
        pageEightSeahorse.xScale = -1.0
        pageEightPaddy.xScale = -1.0

        for object in [pageEightFlorry1,pageEightFlorry1Wings,pageEightFlorry2,pageEightFlorry2Wings,pageEightBootSet1,pageEightBootSet2,pageEightPaddy,pageEightSeahorse,pageEightWheel,pageEightGreenPlant,pageEightRedOrangePlant,pageEightStarfish,pageEightRocks,pageEightJellyfish] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageEightSeahorse.zPosition = 7
    }
    
    func moveFromBaseImageEightToSeven() {
        
        for object in [pageEightFlorry1,pageEightFlorry1Wings,pageEightFlorry2,pageEightFlorry2Wings,pageEightBootSet1,pageEightBootSet2,pageEightPaddy,pageEightSeahorse,pageEightWheel,pageEightGreenPlant,pageEightRedOrangePlant,pageEightStarfish,pageEightJellyfish,pageEightRocks] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageEightActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageSeveniPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageSeven"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        
        switch screenSize.height {
        case 1366:
            pageSevenBall = SKSpriteNode(imageNamed: "pageSevenBalliPadPro")
            pageSevenLeaf1 = SKSpriteNode(imageNamed: "pageSevenLeafiPadPro")
            pageSevenLeaf2 = SKSpriteNode(imageNamed: "pageSevenLeafiPadPro")
            pageSevenLeaf3 = SKSpriteNode(imageNamed: "pageSevenLeafiPadPro")
            pageSevenLeaf4 = SKSpriteNode(imageNamed: "pageSevenLeafiPadPro")
            pageSevenEvieArm = SKSpriteNode(imageNamed: "pageSevenEvieArmiPadPro")
            pageSevenOlly = SKSpriteNode(imageNamed: "pageSevenOllyiPadPro")
            //   pageSevenVase = SKSpriteNode(imageNamed: "pageSevenVaseiPadPro")
            pageSevenPicture = SKSpriteNode(imageNamed: "pageSevenPictureBlackiPadPro")
            //   pageSevenMattArm = SKSpriteNode(imageNamed: "pageSevenMattArmiPadPro")
            //   pageSevenMarcoArm = SKSpriteNode(imageNamed: "pageSevenMarcoArmiPadPro")
            pageSevenBlock1 = SKSpriteNode(imageNamed: "pageSevenBlock1iPadPro")
            pageSevenBlock2 = SKSpriteNode(imageNamed: "pageSevenBlock1iPadPro")
            pageSevenBlock3 = SKSpriteNode(imageNamed: "pageSevenBlock1iPadPro")
            pageSevenBlock4 = SKSpriteNode(imageNamed: "pageSevenBlock2iPadPro")
            pageSevenBlock5 = SKSpriteNode(imageNamed: "pageSevenBlock3iPadPro")
            pageSevenBlock6 = SKSpriteNode(imageNamed: "pageSevenBlock3iPadPro")
            pageSevenBlock7 = SKSpriteNode(imageNamed: "pageSevenBlock2iPadPro")
            pageSevenBlock8 = SKSpriteNode(imageNamed: "pageSevenBlock2iPadPro")
            pageSevenEvieMask = SKSpriteNode(imageNamed: "pageSevenEvieMaskiPadPro")
            
        default:
            pageSevenBall = SKSpriteNode(imageNamed: "pageSevenBall")
            pageSevenLeaf1 = SKSpriteNode(imageNamed: "pageSevenLeaf")
            pageSevenLeaf2 = SKSpriteNode(imageNamed: "pageSevenLeaf")
            pageSevenLeaf3 = SKSpriteNode(imageNamed: "pageSevenLeaf")
            pageSevenLeaf4 = SKSpriteNode(imageNamed: "pageSevenLeaf")
            pageSevenEvieArm = SKSpriteNode(imageNamed: "pageSevenEvieArm")
            pageSevenOlly = SKSpriteNode(imageNamed: "pageSevenOlly")
            //  pageSevenVase = SKSpriteNode(imageNamed: "pageSevenVase")
            pageSevenPicture = SKSpriteNode(imageNamed: "pageSevenPictureBlack")
            // pageSevenMattArm = SKSpriteNode(imageNamed: "pageSevenMattArm")
            // pageSevenMarcoArm = SKSpriteNode(imageNamed: "pageSevenMarcoArm")
            pageSevenBlock1 = SKSpriteNode(imageNamed: "pageSevenBlock1")
            pageSevenBlock2 = SKSpriteNode(imageNamed: "pageSevenBlock1")
            pageSevenBlock3 = SKSpriteNode(imageNamed: "pageSevenBlock1")
            pageSevenBlock4 = SKSpriteNode(imageNamed: "pageSevenBlock2")
            pageSevenBlock5 = SKSpriteNode(imageNamed: "pageSevenBlock3")
            pageSevenBlock6 = SKSpriteNode(imageNamed: "pageSevenBlock3")
            pageSevenBlock7 = SKSpriteNode(imageNamed: "pageSevenBlock2")
            pageSevenBlock8 = SKSpriteNode(imageNamed: "pageSevenBlock2")
            pageSevenEvieMask = SKSpriteNode(imageNamed: "pageSevenEvieMask")
        }
        
        pageSevenBall.position = CGPointMake(854*self.size.width/2048, 490*self.size.height/1536)
        pageSevenEvieArm.position = CGPointMake(1633*self.size.width/2048, 377*self.size.height/1536)
        pageSevenEvieMask.position = CGPointMake(1538*self.size.width/2048, 351*self.size.height/1536)

        pageSevenOlly.position = CGPointMake(1909*self.size.width/2048, 657*self.size.height/1536)
        pageSevenPicture.position = CGPointMake(1523*self.size.width/2048, 1331*self.size.height/1536)
        pageSevenBlock1.position = CGPointMake(1062*self.size.width/2048, 286*self.size.height/1536)
        pageSevenBlock2.position = CGPointMake(1089*self.size.width/2048, 337*self.size.height/1536)
        pageSevenBlock3.position = CGPointMake(1153*self.size.width/2048, 290*self.size.height/1536)
        pageSevenBlock4.position = CGPointMake(1760*self.size.width/2048, 429*self.size.height/1536)
        pageSevenBlock5.position = CGPointMake(1708*self.size.width/2048, 372*self.size.height/1536)
        pageSevenBlock6.position = CGPointMake(1765*self.size.width/2048, 319*self.size.height/1536)
        pageSevenBlock7.position = CGPointMake(1736*self.size.width/2048, 255*self.size.height/1536)
        pageSevenBlock8.position = CGPointMake(1791*self.size.width/2048, 280*self.size.height/1536)
        pageSevenLeaf1.position = CGPointMake(1195*self.size.width/2048, 1355*self.size.height/1536)
        pageSevenLeaf2.position = CGPointMake(1250*self.size.width/2048, 1345*self.size.height/1536)
        pageSevenLeaf3.position = CGPointMake(1210*self.size.width/2048, 1330*self.size.height/1536)
        pageSevenLeaf4.position = CGPointMake(1210*self.size.width/2048, 1293*self.size.height/1536)
        
        pageSevenLeaf2.xScale = -1.0
        pageSevenLeaf4.xScale = -1.0
        
        pageSevenBlock5.xScale = -1.0
        pageSevenBlock7.xScale = -1.0
        pageSevenBlock8.xScale = -1.0
        p7p = 0
        p7b5 = 1
        
        for object in [pageSevenBall,pageSevenEvieArm,pageSevenOlly,pageSevenPicture,pageSevenBlock1,pageSevenBlock2,pageSevenBlock3,pageSevenBlock4,pageSevenBlock5,pageSevenBlock6,pageSevenBlock7,pageSevenBlock8,pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4,pageSevenEvieMask] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        for object in [pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4]{
            object.runAction(SKAction.fadeOutWithDuration(0))
        }
        pageSevenEvieArm.zPosition = 9
        pageSevenEvieMask.zPosition = 10
        pageSevenBlock2.zPosition = 7
        pageSevenBlock3.zPosition = 6
        pageSevenBlock4.zPosition = 9
        pageSevenBlock5.zPosition = 8
        pageSevenBlock6.zPosition = 7
        pageSevenBlock7.zPosition = 6
        pageSevenBlock8.zPosition = 5
        
    }
    
    func moveFromBaseImageEightToNine() {
        
        for object in [pageEightFlorry1,pageEightFlorry1Wings,pageEightFlorry2,pageEightFlorry2Wings,pageEightBootSet1,pageEightBootSet2,pageEightPaddy,pageEightSeahorse,pageEightWheel,pageEightGreenPlant,pageEightRedOrangePlant,pageEightStarfish,pageEightJellyfish,pageEightRocks] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageEightActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageNineiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageNine"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        
        switch screenSize.height {
        case 1366:
            pageNineWorm = SKSpriteNode(imageNamed: "pageNineWormiPadPro")
            pageNineStarfish = SKSpriteNode(imageNamed: "pageEightStarfishiPadPro")
            pageNineJellyfish = SKSpriteNode(imageNamed: "titleJellyfishiPadPro")
            pageNinePaddy = SKSpriteNode(imageNamed: "titlePaddyiPadPro")
            pageNineLizard = SKSpriteNode(imageNamed: "pageNineLizardGreeniPadPro")
            pageNineClam1 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageNineClam2 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageNineClam3 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageNineRedGreenPlant = SKSpriteNode(imageNamed: "pageNineRGPlantiPadPro")
            pageNineSeahorse = SKSpriteNode(imageNamed: "titleSeahorseiPadPro")
            pageNineFlorry = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageNineFlorryWings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
            
        
        default:
            pageNineWorm = SKSpriteNode(imageNamed: "pageNineWorm")
            pageNineStarfish = SKSpriteNode(imageNamed: "pageEightStarfish")
            pageNineJellyfish = SKSpriteNode(imageNamed: "titleJellyfish")
            pageNinePaddy = SKSpriteNode(imageNamed: "titlePaddy")
            pageNineLizard = SKSpriteNode(imageNamed: "pageNineLizardGreen")
            pageNineClam1 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageNineClam2 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageNineClam3 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageNineRedGreenPlant = SKSpriteNode(imageNamed: "pageNineRGPlant")
            pageNineSeahorse = SKSpriteNode(imageNamed: "titleSeahorse")
            pageNineFlorry = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageNineFlorryWings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
          

            
        }
        
        
        pageNineWorm.position = CGPointMake(1884*self.size.width/2048, 1283*self.size.height/1536)
        pageNineStarfish.position = CGPointMake(791*self.size.width/2048, 569*self.size.height/1536)
        pageNineJellyfish.position = CGPointMake(916*self.size.width/2048, 1391*self.size.height/1536)
        pageNinePaddy.position = CGPointMake(813*self.size.width/2048, 736*self.size.height/1536)
        pageNineLizard.position = CGPointMake(1292*self.size.width/2048, 360*self.size.height/1536)
        pageNineClam1.position = CGPointMake(731*self.size.width/2048, 403*self.size.height/1536)
        pageNineClam2.position = CGPointMake(924*self.size.width/2048, 310*self.size.height/1536)
        pageNineClam3.position = CGPointMake(1147*self.size.width/2048, 235*self.size.height/1536)
     //   pageNinePinkReef.position = CGPointMake(793*self.size.width/2048, 682*self.size.height/1536)
        pageNineRedGreenPlant.position = CGPointMake(991*self.size.width/2048, 390*self.size.height/1536)
        pageNineSeahorse.position = CGPointMake(1917*self.size.width/2048, 328*self.size.height/1536)
        pageNineFlorry.position = CGPointMake(1671*self.size.width/2048, 1183*self.size.height/1536)
        pageNineFlorryWings.position = CGPointMake(1652*self.size.width/2048, 1180*self.size.height/1536)

        pageNineClam1.xScale = 104/128
        pageNineClam1.yScale = 102/138
        pageNineClam2.xScale = 83/128
        pageNineClam2.yScale = 92/138
        pageNineClam2.zRotation = 3.14
        pageNineClam3.xScale = 83/128
        pageNineClam3.yScale = 92/138
        pageNineClam3.zRotation = 1.57
        
        pageNineFlorryWings.anchorPoint = CGPointMake(0.12, 0.074)
        p9RG = 0
        p9L = 0
        pageNinePaddy.xScale = -1.0
        pageNineStarfish.xScale = -1.0

        
        for object in [pageNineWorm,pageNineStarfish,pageNineJellyfish,pageNinePaddy,pageNineLizard,pageNineClam1,pageNineClam2,pageNineClam3,pageNineRedGreenPlant,pageNineSeahorse,pageNineFlorry,pageNineFlorryWings] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageNineStarfish.zPosition = 7
        
    }
    
    func moveFromBaseImageNineToEight() {
        
        for object in [pageNineWorm,pageNineStarfish,pageNineJellyfish,pageNinePaddy,pageNineLizard,pageNineClam1,pageNineClam2,pageNineClam3,pageNineRedGreenPlant,pageNineSeahorse,pageNineFlorry,pageNineFlorryWings] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageNineActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageEightiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageEight"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        
        
        
        switch screenSize.height {
        case 1366:
            pageEightFlorry1 = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageEightFlorry1Wings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
            pageEightFlorry2 = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageEightFlorry2Wings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
            
            pageEightBootSet1 = SKSpriteNode(imageNamed: "pageEightBootSet1iPadPro")
            pageEightBootSet2 = SKSpriteNode(imageNamed: "pageEightBootSet2iPadPro")
            pageEightPaddy = SKSpriteNode(imageNamed: "titlePaddyiPadPro")
            pageEightSeahorse = SKSpriteNode(imageNamed: "titleSeahorseiPadPro")
            pageEightWheel = SKSpriteNode(imageNamed: "pageEightWheeliPadPro")
            pageEightGreenPlant = SKSpriteNode(imageNamed: "pageEightGreenPlantiPadPro")
            pageEightRedOrangePlant = SKSpriteNode(imageNamed: "pageEightROPlantiPadPro")
            pageEightStarfish = SKSpriteNode(imageNamed: "pageEightStarfishiPadPro")
            //  pageEightBubble1 = SKSpriteNode(imageNamed: "pageEightBubble1iPadPro")
            //  pageEightBubble2 = SKSpriteNode(imageNamed: "pageEightBubble2iPadPro")
            //  pageEightBubble3 = SKSpriteNode(imageNamed: "pageEightBubble3iPadPro")
            pageEightJellyfish = SKSpriteNode(imageNamed: "titleJellyfishiPadPro")
            pageEightRocks = SKSpriteNode(imageNamed: "pageEightRocksiPadPro")

        default:
            pageEightFlorry1 = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageEightFlorry1Wings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
            pageEightFlorry2 = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageEightFlorry2Wings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
            
            pageEightBootSet1 = SKSpriteNode(imageNamed: "pageEightBootSet1")
            pageEightBootSet2 = SKSpriteNode(imageNamed: "pageEightBootSet2")
            pageEightPaddy = SKSpriteNode(imageNamed: "titlePaddy")
            pageEightSeahorse = SKSpriteNode(imageNamed: "titleSeahorse")
            pageEightWheel = SKSpriteNode(imageNamed: "pageEightWheel")
            pageEightGreenPlant = SKSpriteNode(imageNamed: "pageEightGreenPlant")
            pageEightRedOrangePlant = SKSpriteNode(imageNamed: "pageEightROPlant")
            pageEightStarfish = SKSpriteNode(imageNamed: "pageEightStarfish")
            //  pageEightBubble1 = SKSpriteNode(imageNamed: "pageEightBubble1")
            //  pageEightBubble2 = SKSpriteNode(imageNamed: "pageEightBubble2")
            //  pageEightBubble3 = SKSpriteNode(imageNamed: "pageEightBubble3")
            pageEightJellyfish = SKSpriteNode(imageNamed: "titleJellyfish")
            pageEightRocks = SKSpriteNode(imageNamed: "pageEightRocks")

            
            
        }
        
        pageEightFlorry1.position = CGPointMake(880*self.size.width/2048, 1214*self.size.height/1536)
        pageEightFlorry1Wings.position = CGPointMake(918*self.size.width/2048, 1200*self.size.height/1536)
        pageEightFlorry2.position = CGPointMake(1248*self.size.width/2048, 1330*self.size.height/1536)
        pageEightFlorry2Wings.position = CGPointMake(1287*self.size.width/2048, 1320*self.size.height/1536)
        pageEightBootSet1.position = CGPointMake(1196*self.size.width/2048, 776*self.size.height/1536)
        pageEightBootSet2.position = CGPointMake(1522*self.size.width/2048, 811*self.size.height/1536)
        pageEightPaddy.position = CGPointMake(793*self.size.width/2048, 682*self.size.height/1536)
        pageEightSeahorse.position = CGPointMake(1200*self.size.width/2048, 300*self.size.height/1536)
        pageEightWheel.position = CGPointMake(922*self.size.width/2048, 355*self.size.height/1536)
        pageEightGreenPlant.position = CGPointMake(1373*self.size.width/2048, 422*self.size.height/1536)
        pageEightRedOrangePlant.position = CGPointMake(1736*self.size.width/2048, 502*self.size.height/1536)
        pageEightStarfish.position = CGPointMake(1858*self.size.width/2048, 438*self.size.height/1536)
        pageEightJellyfish.position = CGPointMake(1879*self.size.width/2048, 1292*self.size.height/1536)
        pageEightRocks.position = CGPointMake(927*self.size.width/2048, 284*self.size.height/1536)
        
        pageEightWheel.anchorPoint = CGPointMake(0.48, 0.49)
        pageEightFlorry1.xScale = -1.0
        pageEightFlorry1Wings.xScale = -1.0
        pageEightFlorry2.xScale = -1.0
        pageEightFlorry2Wings.xScale = -1.0
        pageEightFlorry1Wings.anchorPoint = CGPointMake(0, 0)
        pageEightFlorry2Wings.anchorPoint = CGPointMake(0, 0)
        pageEightSeahorse.xScale = -1.0
        pageEightPaddy.xScale = -1.0

        p8RO = 0
        p8G = 0
        p8BS1 = 0
        p8BS2 = 0
        for object in [pageEightFlorry1,pageEightFlorry1Wings,pageEightFlorry2,pageEightFlorry2Wings,pageEightBootSet1,pageEightBootSet2,pageEightPaddy,pageEightSeahorse,pageEightWheel,pageEightGreenPlant,pageEightRedOrangePlant,pageEightStarfish,pageEightRocks,pageEightJellyfish] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageEightSeahorse.zPosition = 7

    }
    
    func moveFromBaseImageNineToTen() {
        
        for object in [pageNineWorm,pageNineStarfish,pageNineJellyfish,pageNinePaddy,pageNineLizard,pageNineClam1,pageNineClam2,pageNineClam3,pageNineRedGreenPlant,pageNineSeahorse,pageNineFlorry,pageNineFlorryWings] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(MainMenuScene.removePageNineActions), userInfo: nil, repeats: false)
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageTeniPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageTen"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        let arrowFadeOut = SKAction.fadeOutWithDuration(0.3)
        fowardButton.runAction(arrowFadeOut)
        
        
        
        switch screenSize.height {
        case 1366:
            pageTenFurtherInfo = SKSpriteNode(imageNamed: "furtherInfoiPadPro")
          
        default:
            pageTenFurtherInfo = SKSpriteNode(imageNamed: "furtherInfo")
           
        }
        
        pageTenFurtherInfo.position = CGPointMake(327*self.size.width/2048, 768*self.size.height/1536)
       
        for object in [pageTenFurtherInfo] {
            object.zPosition = 5
            addChild(object)
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }

    }
    
    func moveFromBaseImageTenToNine() {
        
        for object in [pageTenFurtherInfo] {
            let fadeOut = SKAction.fadeOutWithDuration(0.1)
            object.runAction(SKAction.sequence([fadeOut,SKAction.removeFromParent()]))
            
        }
        
        let baseFadeOut = SKAction.fadeOutWithDuration(0.25)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        switch screenSize.height {
        case 1366:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageNineiPadPro"))
        default:
            changeBase = SKAction.setTexture(SKTexture(imageNamed: "imageNine"))
        }
        let baseFadeIn = SKAction.fadeInWithDuration(0.25)
        
        pageBase.runAction(SKAction.sequence([baseFadeOut,changeBase,baseFadeIn]))
        let arrowFadeIn = SKAction.fadeInWithDuration(0.3)
        fowardButton.runAction(arrowFadeIn)
        
        
        switch screenSize.height {
        case 1366:
            pageNineWorm = SKSpriteNode(imageNamed: "pageNineWormiPadPro")
            pageNineStarfish = SKSpriteNode(imageNamed: "pageEightStarfishiPadPro")
            pageNineJellyfish = SKSpriteNode(imageNamed: "titleJellyfishiPadPro")
            pageNinePaddy = SKSpriteNode(imageNamed: "titlePaddyiPadPro")
            pageNineLizard = SKSpriteNode(imageNamed: "pageNineLizardGreeniPadPro")
            pageNineClam1 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageNineClam2 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageNineClam3 = SKSpriteNode(imageNamed: "pageTwoClamiPadPro")
            pageNineRedGreenPlant = SKSpriteNode(imageNamed: "pageNineRGPlantiPadPro")
            pageNineSeahorse = SKSpriteNode(imageNamed: "titleSeahorseiPadPro")
            pageNineFlorry = SKSpriteNode(imageNamed: "pageOneFlorryiPadPro")
            pageNineFlorryWings = SKSpriteNode(imageNamed: "pageOneFlorryWingsiPadPro")
            
            
        default:
            pageNineWorm = SKSpriteNode(imageNamed: "pageNineWorm")
            pageNineStarfish = SKSpriteNode(imageNamed: "pageEightStarfish")
            pageNineJellyfish = SKSpriteNode(imageNamed: "titleJellyfish")
            pageNinePaddy = SKSpriteNode(imageNamed: "titlePaddy")
            pageNineLizard = SKSpriteNode(imageNamed: "pageNineLizardGreen")
            pageNineClam1 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageNineClam2 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageNineClam3 = SKSpriteNode(imageNamed: "pageTwoClam")
            pageNineRedGreenPlant = SKSpriteNode(imageNamed: "pageNineRGPlant")
            pageNineSeahorse = SKSpriteNode(imageNamed: "titleSeahorse")
            pageNineFlorry = SKSpriteNode(imageNamed: "pageOneFlorry")
            pageNineFlorryWings = SKSpriteNode(imageNamed: "pageOneFlorryWings")
            
            
            
        }
        
        
        pageNineWorm.position = CGPointMake(1884*self.size.width/2048, 1283*self.size.height/1536)
        pageNineStarfish.position = CGPointMake(791*self.size.width/2048, 569*self.size.height/1536)
        pageNineJellyfish.position = CGPointMake(916*self.size.width/2048, 1391*self.size.height/1536)
        pageNinePaddy.position = CGPointMake(813*self.size.width/2048, 736*self.size.height/1536)
        pageNineLizard.position = CGPointMake(1292*self.size.width/2048, 360*self.size.height/1536)
        pageNineClam1.position = CGPointMake(731*self.size.width/2048, 403*self.size.height/1536)
        pageNineClam2.position = CGPointMake(924*self.size.width/2048, 310*self.size.height/1536)
        pageNineClam3.position = CGPointMake(1147*self.size.width/2048, 235*self.size.height/1536)
        //   pageNinePinkReef.position = CGPointMake(793*self.size.width/2048, 682*self.size.height/1536)
        pageNineRedGreenPlant.position = CGPointMake(991*self.size.width/2048, 390*self.size.height/1536)
        pageNineSeahorse.position = CGPointMake(1917*self.size.width/2048, 328*self.size.height/1536)
        pageNineFlorry.position = CGPointMake(1671*self.size.width/2048, 1183*self.size.height/1536)
        pageNineFlorryWings.position = CGPointMake(1652*self.size.width/2048, 1180*self.size.height/1536)
        
        pageNineClam1.xScale = 104/128
        pageNineClam1.yScale = 102/138
        pageNineClam2.xScale = 83/128
        pageNineClam2.yScale = 92/138
        pageNineClam2.zRotation = 3.14
        pageNineClam3.xScale = 83/128
        pageNineClam3.yScale = 92/138
        pageNineClam3.zRotation = 1.57
       
        pageNineFlorryWings.anchorPoint = CGPointMake(0.12, 0.074)
        p9RG = 0
        p9L = 0
        pageNinePaddy.xScale = -1.0
        pageNineStarfish.xScale = -1.0

        
        for object in [pageNineWorm,pageNineStarfish,pageNineJellyfish,pageNinePaddy,pageNineLizard,pageNineClam1,pageNineClam2,pageNineClam3,pageNineRedGreenPlant,pageNineSeahorse,pageNineFlorry,pageNineFlorryWings] {
            object.zPosition = 5

            addChild(object)
            
            object.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        pageNineStarfish.zPosition = 7


    }
    
    
    
    
    
    
    func loadTitlePageObjectAtlasiPad(objectName: String) {
        
        
        let animatedAtlas = SKTextureAtlas(named: objectName + "Images")
        var frames = [SKTexture]()
        let numImages = animatedAtlas.textureNames.count
        
       // for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages {
            let textureName = objectName + "Part\(i)"
            frames.append(animatedAtlas.textureNamed(textureName))
        }
        
       
       
        
        if objectName == "titleBird1" {
            titleBird1MovingFrames = frames
            let firstFrame = titleBird1MovingFrames[0]
            titleBird1 = SKSpriteNode(texture: firstFrame)
            titleBird1.position = CGPointMake(1050*self.size.width/2048, 3*self.size.height/2)
            addChild(titleBird1)
            titleBird1.zPosition = 5
        }
        
        
        else {
            print("object does not exist")
        }
        
    }
    
    func loadTitlePageObjectAtlasiPadPro(objectName: String) {
        let animatedAtlas = SKTextureAtlas(named: objectName + "ImagesiPadPro")
        var frames = [SKTexture]()
        let numImages = animatedAtlas.textureNames.count
        
       // for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages {

            let textureName = objectName + "Part\(i)iPadPro"
            frames.append(animatedAtlas.textureNamed(textureName))
        }
        
       
       
        if objectName == "titleBird1" {
            titleBird1MovingFrames = frames
            let firstFrame = titleBird1MovingFrames[0]
            titleBird1 = SKSpriteNode(texture: firstFrame)
            titleBird1.position = CGPointMake(1050*self.size.width/2048, 3*self.size.height/2)
            addChild(titleBird1)
            titleBird1.zPosition = 5

        }
            
        else {
            print("object does not exist")
        }
    }
    
    func loadPageOneObjectAtlasiPad(objectName: String)    {
       
        
        let animatedAtlas = SKTextureAtlas(named: "titleBird1Images")
        var frames = [SKTexture]()
        let numImages = animatedAtlas.textureNames.count
        
       // for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages {

            let textureName = "titleBird1Part\(i)"
            frames.append(animatedAtlas.textureNamed(textureName))
        }
        
        if objectName == "pageOneBirdOne" {
            pageOneBirdOneMovingFrames = frames
            let firstFrame = pageOneBirdOneMovingFrames[0]
            pageOneBirdOne = SKSpriteNode(texture: firstFrame)
            pageOneBirdOne.position = CGPointMake(1177*self.size.width/2048, 1456*self.size.height/1536)
            addChild(pageOneBirdOne)
            pageOneBirdOne.zPosition = 5
            pageOneBirdOne.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        else if objectName == "pageOneBirdTwo" {
            pageOneBirdTwoMovingFrames = frames
            let firstFrame = pageOneBirdTwoMovingFrames[0]
            pageOneBirdTwo = SKSpriteNode(texture: firstFrame)
            pageOneBirdTwo.xScale = -1.0
            pageOneBirdTwo.position = CGPointMake(1898*self.size.width/2048, 1654*self.size.height/1536)
            pageOneBirdTwo.zPosition = 5
            addChild(pageOneBirdTwo)
            pageOneBirdTwo.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
            
       else {
            print("object does not exist")
        }
        
        
    }
    
    
    func loadPageOneObjectAtlasiPadPro(objectName: String)    {
        
        
        let animatedAtlas = SKTextureAtlas(named: "titleBird1ImagesiPadPro")
        var frames = [SKTexture]()
        let numImages = animatedAtlas.textureNames.count
        
        //for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages {

            let textureName = "titleBird1Part\(i)iPadPro"
            frames.append(animatedAtlas.textureNamed(textureName))
        }
        
        if objectName == "pageOneBirdOne" {
            pageOneBirdOneMovingFrames = frames
            let firstFrame = pageOneBirdOneMovingFrames[0]
            pageOneBirdOne = SKSpriteNode(texture: firstFrame)
            pageOneBirdOne.position = CGPointMake(1177*self.size.width/2048, 1456*self.size.height/1536)
            addChild(pageOneBirdOne)
            pageOneBirdOne.zPosition = 5
            pageOneBirdOne.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        else if objectName == "pageOneBirdTwo" {
            pageOneBirdTwoMovingFrames = frames
            let firstFrame = pageOneBirdTwoMovingFrames[0]
            pageOneBirdTwo = SKSpriteNode(texture: firstFrame)
            pageOneBirdTwo.zRotation = 3.14
            pageOneBirdTwo.position = CGPointMake(1898*self.size.width/2048, 1654*self.size.height/1536)
            pageOneBirdTwo.zPosition = 5
            addChild(pageOneBirdTwo)
            pageOneBirdTwo.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
            
        else {
            print("object does not exist")
        }

        
    }
    
    func loadPageFourObjectAtlasiPad(objectName: String)    {
        
        let animatedAtlas = SKTextureAtlas(named: "titleBird1Images")
        var frames = [SKTexture]()
        let numImages = animatedAtlas.textureNames.count
        
        //for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages {

            let textureName = "titleBird1Part\(i)"
            frames.append(animatedAtlas.textureNamed(textureName))
        }
        
        if objectName == "pageFourBird1" {
            
            pageFourBird1Animation = frames
            let firstFrame = pageFourBird1Animation[0]
            pageFourBird1 = SKSpriteNode(texture: firstFrame)
            pageFourBird1.position = CGPointMake(1231*self.size.width/2048, 1508*self.size.height/1536)
            pageFourBird1.xScale = -55/200
            pageFourBird1.yScale = 31/99
            pageFourBird1.zRotation = 0.18
            addChild(pageFourBird1)
            pageFourBird1.zPosition = 8
            pageFourBird1.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        else if objectName == "pageFourBird2" {
            pageFourBird2Animation = frames
            let firstFrame = pageFourBird2Animation[0]
            pageFourBird2 = SKSpriteNode(texture: firstFrame)
            pageFourBird2.position = CGPointMake(1264*self.size.width/2048, 1488*self.size.height/1536)
            pageFourBird2.xScale = -36/200
            pageFourBird2.yScale = 14/99
            pageFourBird2.zPosition = 8
            addChild(pageFourBird2)
            pageFourBird2.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
            
        else {
            print("object does not exist")
        }

    }
    
    func loadPageFourObjectAtlasiPadPro(objectName: String)    {
        let animatedAtlas = SKTextureAtlas(named: "titleBird1ImagesiPadPro")
        var frames = [SKTexture]()
        let numImages = animatedAtlas.textureNames.count
        
      //  for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages {

            let textureName = "titleBird1Part\(i)iPadPro"
            frames.append(animatedAtlas.textureNamed(textureName))
        }
        
        if objectName == "pageFourBird1" {
            pageFourBird1Animation = frames
            let firstFrame = pageFourBird1Animation[0]
            pageFourBird1 = SKSpriteNode(texture: firstFrame)
            pageFourBird1.position = CGPointMake(1231*self.size.width/2048, 1508*self.size.height/1536)
            pageFourBird1.xScale = -55/200
            pageFourBird1.yScale = 31/99
            pageFourBird1.zRotation = 0.18

            addChild(pageFourBird1)
            pageFourBird1.zPosition = 8
            
            pageFourBird1.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        else if objectName == "pageFourBird2" {
            pageFourBird2Animation = frames
            let firstFrame = pageFourBird2Animation[0]
            pageFourBird2 = SKSpriteNode(texture: firstFrame)
            pageFourBird2.position = CGPointMake(1264*self.size.width/2048, 1488*self.size.height/1536)
            pageFourBird2.xScale = -36/200
            pageFourBird2.yScale = 14/99
            pageFourBird2.zPosition = 8
            addChild(pageFourBird2)
            pageFourBird2.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
            
        else {
            print("object does not exist")
        }
    }
    
    func loadPageFiveObjectAtlasiPad(objectName: String)    {
        let animatedAtlas = SKTextureAtlas(named: "titleBird1Images")
        var frames = [SKTexture]()
        let numImages = animatedAtlas.textureNames.count
        
        //for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages {

            let textureName = "titleBird1Part\(i)"
            frames.append(animatedAtlas.textureNamed(textureName))
        }
        
        if objectName == "pageFiveBird" {
            pageFiveBirdAnimation = frames
            let firstFrame = pageFiveBirdAnimation[0]
            pageFiveBird = SKSpriteNode(texture: firstFrame)
            pageFiveBird.position = CGPointMake(1110*self.size.width/2048, 1473*self.size.height/1536)
            
            addChild(pageFiveBird)
            //pageFiveBird.xScale = -1.0
            pageFiveBird.zPosition = 5
            pageFiveBird.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
            
            
        else {
            print("object does not exist")
        }

    }
    
    func loadPageFiveObjectAtlasiPadPro(objectName: String)    {
        let animatedAtlas = SKTextureAtlas(named: "titleBird1ImagesiPadPro")
        var frames = [SKTexture]()
        let numImages = animatedAtlas.textureNames.count
        
        //for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages {

            let textureName = "titleBird1Part\(i)iPadPro"
            frames.append(animatedAtlas.textureNamed(textureName))
        }
        
        if objectName == "pageFiveBird" {
            pageFiveBirdAnimation = frames
            let firstFrame = pageFiveBirdAnimation[0]
            pageFiveBird = SKSpriteNode(texture: firstFrame)
            pageFiveBird.position = CGPointMake(1110*self.size.width/2048, 1473*self.size.height/1536)
            
            addChild(pageFiveBird)
           // pageFiveBird.xScale = -1.0
            pageFiveBird.zPosition = 5
            pageFiveBird.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
                ]))
        }
        
            
        else {
            print("object does not exist")
        }
    }
    
    
    
    func changeTitleObjectTextures() {
        
        titleBird1.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(titleBird1MovingFrames,
                timePerFrame: 0.1,
                resize: true,
                restore: true)),
            withKey:"titleBird1Moving")
        
        titleBird1.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.moveToY(1500*self.size.height/1536, duration: 1.0),
            SKAction.moveTo(CGPointMake(2151*self.size.width/2048, 1170*self.size.height/1536), duration: 6.0),
           // SKAction.moveTo(CGPointMake(2151*self.size.width/2048, 1280*self.size.height/1536), duration: 2.0),
            SKAction.moveToY(3*self.size.height/2, duration: 1.0),
            SKAction.moveToX(1050*self.size.width/2048, duration: 1.0),
            SKAction.waitForDuration(10.0)
            ])))
        
      /*
        
        titleBird2.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(titleBird2MovingFrames,
                timePerFrame: 0.1,
                resize: true,
                restore: true)),
            withKey:"titleBird2Moving")
        
        titleBird2.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.moveToX(653*self.size.width/2048 - self.size.width/10, duration: 1.0),
            SKAction.moveTo(CGPointMake(3*self.size.width/2 - self.size.width/10, 3*self.size.height/4 + self.size.height/15), duration: 10.0),
            SKAction.fadeOutWithDuration(1.0),
            SKAction.moveTo(CGPointMake(-self.size.width/2 - self.size.width/10, 3*self.size.height/4 + self.size.height/30), duration: 1.0),
            SKAction.waitForDuration(10.0)
            ])))
        
        titleBird2.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.waitForDuration(2.0),
            //SKAction.fadeInWithDuration(1.0),
            SKAction.waitForDuration(20)

            ])) */
        /*
        titleBird3.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(titleBird3MovingFrames,
                timePerFrame: 0.1,
                resize: true,
                restore: true)),
            withKey:"titleBird3Moving")
        
        titleBird3.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.moveToX(653*self.size.width/2048 - self.size.width/20, duration: 1.0),
            SKAction.moveTo(CGPointMake(3*self.size.width/2 - self.size.width/20, 3*self.size.height/4 ), duration: 10.0),
            SKAction.fadeOutWithDuration(1.0),
            SKAction.moveTo(CGPointMake(-self.size.width/2 - self.size.width/20, 3*self.size.height/4 - self.size.height/30), duration: 1.0),
            SKAction.waitForDuration(10.0)
            ])))
        
        titleBird3.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.waitForDuration(1.6),
            SKAction.fadeInWithDuration(1.0),
            SKAction.waitForDuration(20.4)

            ]))) */
        

    }
    
    func changePageOneObjectTextures() {
        if pageOneBirdOne.hasActions() == false {

        pageOneBirdOne.runAction(SKAction.repeatAction(
            SKAction.animateWithTextures(pageOneBirdOneMovingFrames,
                timePerFrame: 0.1,
                resize: true,
                restore: true),
            count:6))
        
        pageOneBirdOne.runAction(SKAction.sequence([
            SKAction.moveTo(CGPointMake(2200*self.size.width/2048, 1126*self.size.height/1536), duration: 5.0),
            SKAction.fadeOutWithDuration(0),
            SKAction.moveTo(CGPointMake(870*self.size.width/2048, 1635*self.size.height/1536), duration: 0.1),
            SKAction.fadeInWithDuration(0),
            SKAction.moveTo(CGPointMake(1177*self.size.width/2048, 1456*self.size.height/1536), duration: 2.0)
            ]))
            
        pageOneBirdTwo.runAction(SKAction.repeatAction(
                SKAction.animateWithTextures(pageOneBirdTwoMovingFrames,
                    timePerFrame: 0.1,
                    resize: true,
                    restore: true),
                count:6))
            
        pageOneBirdTwo.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(500*self.size.width/2048, 1220*self.size.height/1536), duration: 4.0),
                SKAction.moveTo(CGPointMake(1898*self.size.width/2048, 1654*self.size.height/1536), duration: 0.1)
                ]))
        pageOneBirdTwo.runAction(SKAction.sequence([
                SKAction.waitForDuration(3.2),
                SKAction.fadeOutWithDuration(0.3),
                SKAction.waitForDuration(2.0),
                SKAction.fadeInWithDuration(0)
                ]))
            
            
            
            
            
        } else {}
        
        
        
    }
    
   

    func changePageFourObjectTextures() {
        if pageFourBird1.hasActions() == false {
            
            pageFourBird1.runAction(SKAction.repeatAction(
                SKAction.animateWithTextures(pageFourBird1Animation,
                    timePerFrame: 0.1,
                    resize: true,
                    restore: true),
                count:5))
            
            pageFourBird1.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(522*self.size.width/2048, 1395*self.size.height/1536), duration: 5.0),
                SKAction.moveTo(CGPointMake(1231*self.size.width/2048, 1508*self.size.height/1536), duration: 1.0)
                ]))
            pageFourBird1.runAction(SKAction.sequence([
                SKAction.waitForDuration(4.5),
                SKAction.fadeOutWithDuration(0.3),
                SKAction.waitForDuration(1.2),
                SKAction.fadeInWithDuration(0.3)

                ]))
            pageFourBird1.runAction(SKAction.sequence([
                SKAction.scaleXTo(-1, y:1, duration:5.0),
                SKAction.scaleXTo(-55/200, y:31/99, duration:0.1)
                
                ]))
            pageFourBird2.runAction(SKAction.sequence([
                SKAction.scaleXTo(-1, y:1, duration:5.0),
                SKAction.scaleXTo(-36/200, y:14/99, duration:0.1)
                
                ]))
            
            pageFourBird2.runAction(SKAction.repeatAction(
                SKAction.animateWithTextures(pageFourBird2Animation,
                    timePerFrame: 0.1,
                    resize: true,
                    restore: true),
                count:5))
            
            pageFourBird2.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(608*self.size.width/2048, 1335*self.size.height/1536), duration: 5.0),
                SKAction.moveTo(CGPointMake(1264*self.size.width/2048, 1488*self.size.height/1536), duration: 1.0)
                ]))
            
            pageFourBird2.runAction(SKAction.sequence([
                SKAction.waitForDuration(4.5),
                SKAction.fadeOutWithDuration(0.3),
                SKAction.waitForDuration(1.2),
                SKAction.fadeInWithDuration(0.3)
                
                ]))
            
            
            
            
        } else {}
    }

    func changePageFiveObjectTextures() {
        if pageFiveBird.hasActions() == false {
            
            pageFiveBird.runAction(SKAction.repeatAction(
                SKAction.animateWithTextures(pageFiveBirdAnimation,
                    timePerFrame: 0.1,
                    resize: true,
                    restore: true),
                count:5))
            
            pageFiveBird.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(2230*self.size.width/2048, 1340*self.size.height/1536), duration: 5.0),
                SKAction.moveTo(CGPointMake(1110*self.size.width/2048, 1473*self.size.height/1536), duration: 1.0)
                ]))
            
            pageFiveBird.runAction(SKAction.sequence([
                SKAction.waitForDuration(5.0),
                SKAction.fadeOutWithDuration(0.1),
                SKAction.waitForDuration(1.2),
                SKAction.fadeInWithDuration(0.3)
                
                ]))
          
            
            
            
            
        } else {}
    }

    func changePageSixObjectTextures() {}
    
    func changePageSevenObjectTextures() {}

    func changePageEightObjectTextures() {}

    func changePageNineObjectTextures() {}

    //animations
    
    func pageOneStarfishPressed() {
        if pageOneStarfish.hasActions() == false {
            pageOneStarfish.runAction(SKAction.sequence([
                SKAction.moveToY(760*self.size.height/1536, duration: 1.0),
                SKAction.moveToY(606*self.size.height/1536, duration: 1.0),
                ]))
            pageOneStarfish.runAction(SKAction.rotateByAngle(12.56,
                duration:2.0))
        } else{}
       

    }
    
    func pageOneClamOnePressed() {
        if pageOneClamOne.hasActions() == false {
            pageOneClamOne.runAction(SKAction.sequence([
                SKAction.rotateByAngle(1.57, duration:0.5),
                SKAction.rotateByAngle(-3.14, duration:1.0),
                SKAction.rotateByAngle(1.57, duration:0.5)
                ]))
        } else{}
    }
    
    func pageOneClamsTwoThreePressed() {
        if pageOneClamTwo.hasActions() == false {
            pageOneClamTwo.runAction(SKAction.sequence([
                SKAction.moveToY(500*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(424*self.size.height/1536, duration: 0.5)
               
                ]))
            pageOneClamTwo.runAction(SKAction.sequence([
                SKAction.rotateByAngle(1.57, duration:0.5),
                SKAction.rotateByAngle(-1.57, duration:0.5)
                ]))
            pageOneClamThree.runAction(SKAction.sequence([
                SKAction.moveToY(500*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(460*self.size.height/1536, duration: 0.5)
                
                ]))
            pageOneClamThree.runAction(SKAction.sequence([
                SKAction.rotateByAngle(-1.57, duration:0.5),
                SKAction.rotateByAngle(1.57, duration:0.5)
                ]))
        } else{}
    }
    
    func pageOneFlorryOneTwoPressed() {
        if pageOneFlorryOne.hasActions() == false {
            
            let wingsAction = SKAction.repeatAction(SKAction.sequence([
                SKAction.rotateByAngle(-0.39, duration:0.5),
                SKAction.rotateByAngle(0.78, duration:1.0),
                SKAction.rotateByAngle(-0.39, duration:0.5)
                ]), count:3)
            
            let waitAndFadeOne = SKAction.sequence([
                SKAction.waitForDuration(0.7),
                SKAction.fadeOutWithDuration(0.2),
                SKAction.waitForDuration(0.2),
                SKAction.fadeInWithDuration(0)
                ])
            let waitAndFadeTwo = SKAction.sequence([
                SKAction.waitForDuration(1.5),
                SKAction.fadeOutWithDuration(0.2),
                SKAction.waitForDuration(1.4),
                SKAction.fadeInWithDuration(0)
                ])
            
            pageOneFlorryOne.runAction(SKAction.sequence([
                SKAction.moveToX(604*self.size.width/2048, duration: 1.0),
                SKAction.moveToX(2250*self.size.width/2048, duration: 0.1),
                SKAction.moveToX(878*self.size.width/2048, duration: 5.0)

                ]))
            pageOneFlorryOneWings.runAction(SKAction.sequence([
                SKAction.moveToX(604*self.size.width/2048 - 44*self.size.width/2048, duration: 1.0),
                SKAction.moveToX(2250*self.size.width/2048 - 44*self.size.width/2048, duration: 0.1),
                SKAction.moveToX(834*self.size.width/2048, duration: 5.0)
                
                ]))
            pageOneFlorryOne.runAction(waitAndFadeOne)
            pageOneFlorryOneWings.runAction(waitAndFadeOne)
            
            pageOneFlorryTwo.runAction(SKAction.sequence([
                SKAction.moveToX(406*self.size.width/2048, duration: 3.0),
                SKAction.moveToX(2250*self.size.width/2048, duration: 0.1),
                SKAction.moveToX(1228*self.size.width/2048, duration: 3.0)
                
                ]))
            pageOneFlorryTwoWings.runAction(SKAction.sequence([
                SKAction.moveToX(406*self.size.width/2048 - 47*self.size.width/2048, duration: 3.0),
                SKAction.moveToX(2250*self.size.width/2048 - 47*self.size.width/2048, duration: 0.1),
                SKAction.moveToX(1181*self.size.width/2048, duration: 3.0)
                
                ]))
            pageOneFlorryTwo.runAction(waitAndFadeTwo)
            pageOneFlorryTwoWings.runAction(waitAndFadeTwo)
            

            pageOneFlorryOneWings.runAction(wingsAction)
            pageOneFlorryTwoWings.runAction(wingsAction)

            
            
            
        } else{}
    }
    
    func pageOneFlorryThreePressed() {
        if pageOneFlorryThree.hasActions() == false {
            pageOneFlorryThree.runAction(SKAction.sequence([
                SKAction.moveToY(530*self.size.height/1536, duration: 1.0),
                SKAction.moveToY(295*self.size.height/1536, duration: 1.0)
                ]))
            pageOneFlorryThree.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.3),
                SKAction.rotateByAngle(2.0, duration: 1.0),
                SKAction.waitForDuration(0.7),
                SKAction.rotateByAngle(-0.5, duration: 0.2),
                SKAction.fadeOutWithDuration(0),
                SKAction.rotateToAngle(-0.7, duration: 0),
                SKAction.moveTo(CGPointMake(1774*self.size.width/2048, 308*self.size.height/1536), duration:0.5),
                SKAction.fadeInWithDuration(0.5)
                ]))
        } else{}
    }
    
    func pageTwoBallPressed() {
        if pageTwoBall.hasActions() == false {
            pageTwoBall.runAction(SKAction.sequence([
                SKAction.moveToY(1650*self.size.height/1536, duration: 0.5),
                SKAction.moveToX(1648*self.size.width/2048, duration: 0.5),
                SKAction.moveToY(930*self.size.height/1536, duration: 0.5),
                SKAction.moveTo(CGPointMake(2150*self.size.width/2048, 1128*self.size.height/1536), duration: 0.5),
                SKAction.fadeOutWithDuration(0),
                SKAction.moveTo(CGPointMake(1202*self.size.width/2048, 483*self.size.height/1536), duration: 0),
                SKAction.fadeInWithDuration(0.5)
                ]))
            pageTwoSizzle.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.5),
                SKAction.fadeInWithDuration(0.1),
                SKAction.fadeOutWithDuration(0.1),
                SKAction.fadeInWithDuration(0.1),
                SKAction.fadeOutWithDuration(0.1),
                SKAction.fadeInWithDuration(0.1),
                SKAction.fadeOutWithDuration(0.1),
                SKAction.fadeInWithDuration(0.1),
                SKAction.fadeOutWithDuration(0.1),
                SKAction.fadeInWithDuration(0.1),
                SKAction.fadeOutWithDuration(0.1)
                ]))
            
        } else{}
    }
    
    func pageTwoClam1Pressed() {
        if pageTwoClam1.hasActions() == false {
            pageTwoClam1.runAction(SKAction.sequence([
                SKAction.rotateByAngle(1.57, duration:0.5),
                SKAction.rotateByAngle(-3.14, duration:1.0),
                SKAction.rotateByAngle(1.57, duration:0.5)
                ]))
        } else{}
    }
    
    func pageTwoClam2Pressed() {
        if pageTwoClam2.hasActions() == false {
            pageTwoClam2.runAction(SKAction.sequence([
                SKAction.rotateByAngle(1.57, duration:0.5),
                SKAction.rotateByAngle(-1.57, duration:0.5)
                ]))
            pageTwoClam2.runAction(SKAction.sequence([
                SKAction.moveToY(350*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(259*self.size.height/1536, duration: 0.5)
                ]))
        } else{}
    }
    
    func pageTwoClam3Pressed() {
        if pageTwoClam3.hasActions() == false {
            pageTwoClam3.runAction(SKAction.sequence([
                SKAction.rotateByAngle(25.12, duration:2.0)
                ]))
        } else{}
    }
    
    func pageTwoClam4Pressed() {
        if pageTwoClam4.hasActions() == false {
            pageTwoClam4.runAction(SKAction.sequence([
                SKAction.rotateByAngle(6.28, duration:1.0)
                ]))
            pageTwoClam4.runAction(SKAction.sequence([
                SKAction.moveToY(405*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(319*self.size.height/1536, duration: 0.5)
                ]))
            
            
        } else{}
    }
    
    func pageTwoLighthousePressed() {
        if pageTwoLighthouseYellowWindow1.hasActions() == false {
            pageTwoLighthouseYellowWindow1.runAction(SKAction.sequence([
                SKAction.fadeInWithDuration(0),
                SKAction.waitForDuration(0.2),
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.6),
                SKAction.fadeInWithDuration(0),
                SKAction.waitForDuration(0.4),
                SKAction.fadeOutWithDuration(0)
                ]))
            pageTwoLighthouseYellowWindow2.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.2),
                SKAction.fadeInWithDuration(0),
                SKAction.waitForDuration(0.2),
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.4),
                SKAction.fadeInWithDuration(0),
                SKAction.waitForDuration(0.4),
                SKAction.fadeOutWithDuration(0)

                ]))
            pageTwoLighthouseYellowWindow3.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.4),
                SKAction.fadeInWithDuration(0),
                SKAction.waitForDuration(0.2),
                SKAction.fadeOutWithDuration(0),
                SKAction.waitForDuration(0.2),
                SKAction.fadeInWithDuration(0),
                SKAction.waitForDuration(0.4),
                SKAction.fadeOutWithDuration(0)

                ]))
        } else{}
    }
    
    func pageTwoCloudPressed() {
        if pageTwoCloud.hasActions() == false {
            pageTwoCloud.runAction(SKAction.sequence([
                SKAction.moveToX(1000*self.size.width/2048, duration: 10.0),
                SKAction.moveToX(1493*self.size.width/2048, duration: 10.0)

                ]))
            pageTwoSun.runAction(SKAction.sequence([
                SKAction.moveToX(1422*self.size.width/2048, duration: 10.0),
                SKAction.moveToX(1829*self.size.width/2048, duration: 10.0)
                
                ]))
        } else{}
    }
    
   /* func pageTwoSunPressed() {
        
    }*/
    
    func pageTwoCrabPressed() {
        if pageTwoCrabEyebrows.hasActions() == false {
            pageTwoCrabEyebrows.runAction(SKAction.sequence([
                SKAction.moveToY(1005*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(982*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(1005*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(982*self.size.height/1536, duration: 0.25),
                SKAction.waitForDuration(2.0)
                ]))
            pageTwoCrabPincer1.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.0),
                SKAction.moveToY(827*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(809*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(827*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(809*self.size.height/1536, duration: 0.25)
                ]))
            pageTwoCrabPincer2.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.1),
                
                SKAction.moveToY(811*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(794*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(811*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(794*self.size.height/1536, duration: 0.25)
                ]))
            pageTwoCrabPincer3.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.2),

                SKAction.moveToY(802*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(785*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(802*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(785*self.size.height/1536, duration: 0.25)

                ]))
            
        } else{}
    }
    
    func pageTwoSnailPressed() {
        if pageTwoSnail.hasActions() == false {
            pageTwoSnail.runAction(SKAction.sequence([
                SKAction.rotateByAngle(0.30, duration:0.25),
                SKAction.rotateByAngle(-0.60, duration:0.25),
                SKAction.rotateByAngle(0.30, duration:0.25)

                ]))
        } else{}
    }
    
    func pageTwoStarfishPressed() {
        if pageTwoEyes.hasActions() == false {
            pageTwoEyes.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(782*self.size.width/2048, 370*self.size.height/1536), duration: 0.2),
                SKAction.waitForDuration(0.4),
                SKAction.moveTo(CGPointMake(784*self.size.width/2048, 386*self.size.height/1536), duration: 0.2)

                

                
                ]))
        } else{}
    }
    
    func pageThreeStarfishBucketPressed() {
        if pageThreeBucketHandle.hasActions() == false {
            pageThreeBucketHandle.runAction(SKAction.sequence([
                SKAction.rotateByAngle(-0.20, duration:0.25),
                SKAction.rotateByAngle(0.20, duration:0.25),
                SKAction.waitForDuration(0.35)


                ]))
            pageThreeStarfishEyes.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.45),
                SKAction.moveTo(CGPointMake(875*self.size.width/2048, 358*self.size.height/1536), duration: 0.2),
                SKAction.moveTo(CGPointMake(881*self.size.width/2048, 361*self.size.height/1536), duration: 0.2)
                ]))
        } else{}
    }
    
    func pageThreeClamPressed() {}
    
    
    func pageThreeBirdPressed() {
        if pageThreeBird.hasActions() == false {
            pageThreeBird.runAction(SKAction.sequence([
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(380*self.size.height/1536, duration: 0.2),
                SKAction.moveToY(356*self.size.height/1536, duration: 0.2)
                ]))
            pageThreeBird.runAction(SKAction.sequence([
                SKAction.moveToX(1298*self.size.width/2048, duration:2.0),
               // SKAction.scaleXBy(-1,y:0, duration:0),
                SKAction.moveToX(1450*self.size.width/2048, duration:2.0),
              //  SKAction.scaleXBy(-1,y:0, duration:0)

                ]))
          
           
        } else{}
    }
    func pageThreeCrabPressed() {
        if pageThreeCrabBody.hasActions() == false {
            pageThreeCrabBody.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(693*self.size.width/2048, 743*self.size.height/1536), duration: 2.0),
                SKAction.waitForDuration(0.25),
                SKAction.moveTo(CGPointMake(1704*self.size.width/2048, 745*self.size.height/1536), duration: 1.0),
                SKAction.waitForDuration(0.5)

                ]))
            pageThreeCrabPincer1.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(784*self.size.width/2048, 633*self.size.height/1536), duration: 2.0),
                SKAction.waitForDuration(0.25),
                SKAction.moveTo(CGPointMake(1795*self.size.width/2048, 635*self.size.height/1536), duration: 1.0)

                ]))
            pageThreeCrabPincer2.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(814*self.size.width/2048, 628*self.size.height/1536), duration: 2.0),
                SKAction.waitForDuration(0.25),
                SKAction.moveTo(CGPointMake(1825*self.size.width/2048, 630*self.size.height/1536), duration: 1.0)
                ]))
            pageThreeCrabPincer3.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(825*self.size.width/2048, 622*self.size.height/1536), duration: 2.0),
                SKAction.waitForDuration(0.25),
                SKAction.moveTo(CGPointMake(1843*self.size.width/2048, 624*self.size.height/1536), duration: 1.0)
                ]))
            pageThreeBall.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(760*self.size.width/2048, 520*self.size.height/1536), duration: 2.0),
                SKAction.waitForDuration(0.25),
                SKAction.moveTo(CGPointMake(1771*self.size.width/2048, 522*self.size.height/1536), duration: 1.0)
                ]))
            pageThreeBall.runAction(SKAction.sequence([
                SKAction.rotateByAngle(12.56, duration:3.5)
                ]))
            pageThreeCrabPincer1.runAction(SKAction.sequence([
                SKAction.moveToY(648*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(633*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(648*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(633*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(648*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(633*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(648*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(633*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(648*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(633*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(648*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(633*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(648*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(633*self.size.height/1536, duration: 0.25)
                ]))
            pageThreeCrabPincer2.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.1),
                SKAction.moveToY(643*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(628*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(643*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(628*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(643*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(628*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(643*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(628*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(643*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(628*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(643*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(628*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(643*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(628*self.size.height/1536, duration: 0.25)
                ]))
            pageThreeCrabPincer3.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.15),
                
                SKAction.moveToY(637*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(622*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(637*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(622*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(637*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(622*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(637*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(622*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(637*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(622*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(637*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(622*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(637*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(622*self.size.height/1536, duration: 0.25)
                ]))
            for object in [pageThreeCrabBody,pageThreeCrabPincer1,pageThreeCrabPincer2,pageThreeCrabPincer3,pageThreeBall] {
                object.runAction(SKAction.sequence([
                    SKAction.waitForDuration(1.75),
                    SKAction.fadeOutWithDuration(0.25),
                    SKAction.moveByX(self.size.width,y:0, duration:0),
                    SKAction.fadeInWithDuration(0.25)
                    ]))
            }
            
            
        } else{}
    }
    
    func pageThreeCloudPressed() {
        if pageThreeCloud.hasActions() == false {
            pageThreeCloud.runAction(SKAction.sequence([
                SKAction.moveToX(850*self.size.width/2048, duration: 10.0),
                SKAction.moveToX(1830*self.size.width/2048, duration: 10.0)
                ]))
            
            
       
    } else{}
    }
    func pageThreeSunPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
        if pageThreeSun.hasActions() == false {
            pageThreeSun.runAction(SKAction.sequence([
                SKAction.moveToY(933*self.size.height/1536, duration: 6.0),
                SKAction.fadeOutWithDuration(0.5),
                SKAction.moveToY(1386*self.size.height/1536, duration: 0.5),
                SKAction.fadeInWithDuration(0.5)

                ]))
            pageThreeSun.runAction(SKAction.sequence([
                SKAction.waitForDuration(2.0),
                SKAction.setTexture(SKTexture(imageNamed: "pageThreeSunOrangeiPadPro")),
                SKAction.waitForDuration(2.0),
                SKAction.setTexture(SKTexture(imageNamed: "pageThreeSunRediPadPro")),
                SKAction.waitForDuration(2.0),
                SKAction.setTexture(SKTexture(imageNamed: "pageThreeSunYellowiPadPro"))
                ]))
            
        } else{}
        default:
            if pageThreeSun.hasActions() == false {
                pageThreeSun.runAction(SKAction.sequence([
                    SKAction.moveToY(933*self.size.height/1536, duration: 6.0),
                    SKAction.fadeOutWithDuration(0.5),
                    SKAction.moveToY(1386*self.size.height/1536, duration: 0.5),
                    SKAction.fadeInWithDuration(0.5)
                    
                    ]))
                pageThreeSun.runAction(SKAction.sequence([
                    SKAction.waitForDuration(2.0),
                    SKAction.setTexture(SKTexture(imageNamed: "pageThreeSunOrangeiPadPro")),
                    SKAction.waitForDuration(2.0),
                    SKAction.setTexture(SKTexture(imageNamed: "pageThreeSunRediPadPro")),
                    SKAction.waitForDuration(2.0),
                    SKAction.setTexture(SKTexture(imageNamed: "pageThreeSunYellowiPadPro"))
                    ]))
                
            } else{}
            
            
            
            
        }
    
    }
    
    func pageFourMattMarcoPressed() {
        if pageFourMattHand.hasActions() == false {
            pageFourMattHand.runAction(SKAction.sequence([
                SKAction.rotateByAngle(-0.5, duration:0.25),
                SKAction.rotateByAngle(0.5, duration:0.25),
                SKAction.rotateByAngle(-0.5, duration:0.25),
                SKAction.rotateByAngle(0.5, duration:0.25)
                ]))
            pageFourMarcoHand.runAction(SKAction.sequence([
                SKAction.rotateByAngle(0.5, duration:0.25),
                SKAction.rotateByAngle(-0.5, duration:0.25),
                SKAction.rotateByAngle(0.5, duration:0.25),
                SKAction.rotateByAngle(-0.5, duration:0.25)

                ]))
            
            
        } else{}
    }
    func pageFourCrabPressed() {
        if pageFourCrabPincer3.hasActions() == false {
            pageFourCrabLeftClaw.runAction(SKAction.sequence([
                SKAction.rotateByAngle(-0.5, duration:0.5),
                SKAction.rotateByAngle(0.5, duration:0.5),
                SKAction.rotateByAngle(-0.5, duration:0.5),
                SKAction.rotateByAngle(0.5, duration:0.5)
                ]))
            pageFourCrabRightClaw.runAction(SKAction.sequence([
                SKAction.rotateByAngle(0.25, duration:0.5),
                SKAction.rotateByAngle(-0.25, duration:0.5),
                SKAction.rotateByAngle(0.25, duration:0.5),
                SKAction.rotateByAngle(-0.25, duration:0.5)
                

                ]))
            pageFourCrabPincer1.runAction(SKAction.sequence([
                SKAction.moveToY(790*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(780*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(790*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(780*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(790*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(780*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(790*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(780*self.size.height/1536, duration: 0.25)
                
                ]))
            pageFourCrabPincer2.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.1),

                SKAction.moveToY(780*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(770*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(780*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(770*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(780*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(770*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(780*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(770*self.size.height/1536, duration: 0.25)
                
                ]))
            pageFourCrabPincer3.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.15),

                SKAction.moveToY(768*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(758*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(768*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(758*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(768*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(758*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(768*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(758*self.size.height/1536, duration: 0.25)
                
                ]))
            pageFourCrabPincer4.runAction(SKAction.sequence([
                SKAction.moveToY(832*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(825*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(832*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(825*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(832*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(825*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(832*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(825*self.size.height/1536, duration: 0.25)
                
                ]))
            
            
            
        } else{}
    }
    func pageFourStarfishPressed() {
        if pageFourStarfish.hasActions() == false {
            pageFourStarfish.runAction(SKAction.sequence([
                //SKAction.scaleXTo(-1,y:0, duration:0),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveToX(1795*self.size.width/2048, duration: 0.1),
                SKAction.fadeInWithDuration(0.25),
                SKAction.waitForDuration(1.0),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveToX(1509*self.size.width/2048, duration: 0.5),
                SKAction.fadeInWithDuration(0.25)
                ]))
            _ = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(MainMenuScene.changeStarfishXRot), userInfo: nil, repeats: false)
            _ = NSTimer.scheduledTimerWithTimeInterval(1.85, target: self, selector: #selector(MainMenuScene.changeStarfishXRot2), userInfo: nil, repeats: false)

            
        } else{}
    }
    
    func changeStarfishXRot() {
        pageFourStarfish.xScale = -1
    }
    func changeStarfishXRot2() {
        
        pageFourStarfish.xScale = 1
    }
    
    
    func pageFourClam1Pressed() {
        if pageFourClam1.hasActions() == false {
            pageFourClam1.runAction(SKAction.sequence([
                SKAction.rotateByAngle(31.4, duration:5.0)
                ]))
        } else{}
    }
    func pageFourClam2Pressed() {
        if pageFourClam2.hasActions() == false {
            pageFourClam2.runAction(SKAction.sequence([
                SKAction.rotateByAngle(-31.4, duration:3.0)

                ]))
        } else{}
    }
    func pageFourClam3Pressed() {
        if pageFourClam3.hasActions() == false {
            pageFourClam3.runAction(SKAction.sequence([
                SKAction.rotateByAngle(6.28, duration:1.0)
                
                ]))
            pageFourClam3.runAction(SKAction.sequence([
                SKAction.moveToX(1340*self.size.width/2048, duration: 0.5),
                SKAction.moveToX(1185*self.size.width/2048, duration: 0.5)
                ]))
        } else{}
    }
    func pageFourClams45Pressed() {
        if pageFourClam4.hasActions() == false {
            pageFourClam4.runAction(SKAction.sequence([
                SKAction.rotateByAngle(6.28, duration:1.0)
                
                ]))
            pageFourClam5.runAction(SKAction.sequence([
                SKAction.rotateByAngle(6.28, duration:1.0)
                
                ]))
            pageFourClam4.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(1920*self.size.width/2048, 415*self.size.height/1536), duration: 0.5),
                SKAction.moveTo(CGPointMake(1831*self.size.width/2048, 371*self.size.height/1536), duration: 0.5)
                ]))
            pageFourClam5.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(1831*self.size.width/2048, 371*self.size.height/1536), duration: 0.5),
                SKAction.moveTo(CGPointMake(1920*self.size.width/2048, 415*self.size.height/1536), duration: 0.5)
                
                ]))
        } else{}
    }
    func pageFourCloudPressed() {
        if pageFourCloud.hasActions() == false {
            pageFourCloud.runAction(SKAction.sequence([
                SKAction.moveToX(1125*self.size.width/2048, duration:10.0),
                SKAction.moveToX(840*self.size.width/2048, duration: 10.0)

                ]))
           
                
            
        } else{}
    }
    
    func pageFiveLeftShedPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        if pageFiveLeftShed.hasActions() == false {
            
            if p5lsc == 0{
            p5lsc = 1
            switch screenSize.height {
            case 1366:
                pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedPurpleiPadPro")))
            default:
                pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedPurple")))
            }
            }//0
            else if p5lsc == 1 {
                p5lsc = 2
                switch screenSize.height {
                case 1366:
                    pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedOrangeiPadPro")))
                default:
                    pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedOrange")))
                }
            }//1
            else if p5lsc == 2 {
                p5lsc = 3
                switch screenSize.height {
                case 1366:
                    pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedGreeniPadPro")))
                default:
                    pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedGreen")))
                }
            }//2
            else if p5lsc == 3 {
                p5lsc = 4
                switch screenSize.height {
                case 1366:
                    pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedBlueiPadPro")))
                default:
                    pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedBlue")))
                }
            }//3
            else if p5lsc == 4 {
                p5lsc = 0
                switch screenSize.height {
                case 1366:
                    pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedYellowiPadPro")))
                default:
                    pageFiveLeftShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedYellow")))
                }
            }//4
            
            
            
            
            
        } else{}
    }
    func pageFiveRightShedPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageFiveRightShed.hasActions() == false {
            
            if p5rsc == 0{
                p5rsc = 1
                switch screenSize.height {
                case 1366:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedPurpleiPadPro")))
                default:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedPurple")))
                }
            }//0
            else if p5rsc == 1 {
                p5rsc = 2
                switch screenSize.height {
                case 1366:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedPinkiPadPro")))
                default:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedPink")))
                }
            }//1
            else if p5rsc == 2 {
                p5rsc = 3
                switch screenSize.height {
                case 1366:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedGreeniPadPro")))
                default:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedGreen")))
                }
            }//2
            else if p5rsc == 3 {
                p5rsc = 4
                switch screenSize.height {
                case 1366:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedBlueiPadPro")))
                default:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedBlue")))
                }
            }//3
            else if p5rsc == 4 {
                p5rsc = 0
                switch screenSize.height {
                case 1366:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedRediPadPro")))
                default:
                    pageFiveRightShed.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightShedRed")))
                }
            }//4
            
            
            
            
            
        } else{}
    }
    func pageFiveLeftBootPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageFiveLeftBoot.hasActions() == false {
            
            if p5lbc == 0{
                p5lbc = 1
                switch screenSize.height {
                case 1366:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootGreeniPadPro")))
                default:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootGreen")))
                }
            }//0
            else if p5lbc == 1 {
                p5lbc = 2
                switch screenSize.height {
                case 1366:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootOrangeiPadPro")))
                default:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootOrange")))
                }
            }//1
            else if p5lbc == 2 {
                p5lbc = 3
                switch screenSize.height {
                case 1366:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootPurpleiPadPro")))
                default:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootPurple")))
                }
            }//2
            else if p5lbc == 3 {
                p5lbc = 4
                switch screenSize.height {
                case 1366:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootRediPadPro")))
                default:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootRed")))
                }
            }//3
            else if p5lbc == 4 {
                p5lbc = 0
                switch screenSize.height {
                case 1366:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootBlueiPadPro")))
                default:
                    pageFiveLeftBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftBootBlue")))
                }
            }//4
            
            
            
            
            
        } else{}
    }
    func pageFiveRightBootPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageFiveRightBoot.hasActions() == false {
            
            if p5rbc == 0{
                p5rbc = 1
                switch screenSize.height {
                case 1366:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootBlueiPadPro")))
                default:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootBlue")))
                }
            }//0
            else if p5rbc == 1 {
                p5rbc = 2
                switch screenSize.height {
                case 1366:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootPinkiPadPro")))
                default:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootPink")))
                }
            }//1
            else if p5rbc == 2 {
                p5rbc = 3
                switch screenSize.height {
                case 1366:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootRediPadPro")))
                default:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootRed")))
                }
            }//2
            else if p5rbc == 3 {
                p5rbc = 4
                switch screenSize.height {
                case 1366:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootYellowiPadPro")))
                default:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootYellow")))
                }
            }//3
            else if p5rbc == 4 {
                p5rbc = 0
                switch screenSize.height {
                case 1366:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootGreeniPadPro")))
                default:
                    pageFiveRightBoot.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveRightBootGreen")))
                }
            }//4
            
            
            
            
            
        } else{}
    }
    func pageFiveMarcoPressed() {
        if pageFiveBall.hasActions() == false {
            pageFiveMarcoLeg.runAction(SKAction.sequence([
                SKAction.rotateByAngle(-0.5, duration:0.25),
                SKAction.rotateByAngle(0.5, duration:0.25)
                ]))
            pageFiveBall.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.15),
                SKAction.moveTo(CGPointMake(1038*self.size.width/2048, 1000*self.size.height/1536), duration: 0.5),
                SKAction.waitForDuration(1.2),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveTo(CGPointMake(1490*self.size.width/2048, 587*self.size.height/1536), duration: 0.1),
                SKAction.fadeInWithDuration(0.25)
                ]))
            pageFiveThump.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.2),
                SKAction.fadeAlphaTo(1.0, duration: 0),
                SKAction.scaleTo(1.0, duration: 0.15),
                SKAction.waitForDuration(1.5),
                SKAction.scaleTo(0.1, duration: 0.15),
                SKAction.fadeAlphaTo(0, duration: 0)
                
                
                ]))
            pageFiveCrabRightClaw.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.65),
                SKAction.rotateByAngle(0.75, duration:0.25),
                SKAction.rotateByAngle(-0.75, duration:0.25),
                SKAction.rotateByAngle(0.75, duration:0.25),
                SKAction.rotateByAngle(-0.75, duration:0.25),
                SKAction.rotateByAngle(0.75, duration:0.25),
                SKAction.rotateByAngle(-0.75, duration:0.25)
                ]))
            pageFiveStarfish.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.65),
                SKAction.moveToY(470*self.size.height/1536, duration: 0.3),
                SKAction.moveToY(432*self.size.height/1536, duration: 0.3),
                SKAction.moveToY(470*self.size.height/1536, duration: 0.3),
                SKAction.moveToY(432*self.size.height/1536, duration: 0.3)
                ]))
            pageFiveStarfish.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.65),
                SKAction.rotateByAngle(-0.5, duration:0.6),
                SKAction.rotateByAngle(0.5, duration:0.6)

                ]))
            pageFiveMattLeftHand.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.65),
                SKAction.rotateByAngle(-0.4, duration:0.25),
                SKAction.rotateByAngle(0.4, duration:0.25),
                SKAction.rotateByAngle(-0.4, duration:0.25),
                SKAction.rotateByAngle(0.4, duration:0.25)
                ]))
            pageFiveMattRightHand.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.65),
                SKAction.rotateByAngle(0.45, duration:0.25),
                SKAction.rotateByAngle(-0.45, duration:0.25),
                SKAction.rotateByAngle(0.45, duration:0.25),
                SKAction.rotateByAngle(-0.45, duration:0.25)
                ]))
        } else{}

    }
    func pageFiveRockPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageFiveRock.hasActions() == false {
            
            
                switch screenSize.height {
                case 1366:
                    pageFiveRock.runAction(SKAction.sequence([
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockRediPadPro")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockGreeniPadPro")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockRediPadPro")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockGreeniPadPro")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockRediPadPro")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockGreeniPadPro"))
                        ]))
                
                default:
                    pageFiveRock.runAction(SKAction.sequence([
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockRed")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockGreen")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockRed")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockGreen")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockRed")),
                        SKAction.waitForDuration(0.2),
                        SKAction.setTexture(SKTexture(imageNamed: "pageFiveRockGreen"))
                        ]))
                    
                }
            
            
            
            
            
            
            
        } else{}
    }
    
    func pageSixSnailPressed() {
    if pageSixSnail.hasActions() == false {
        pageSixSnail.runAction(SKAction.sequence([
            SKAction.rotateByAngle(-0.30, duration:0.25),
            SKAction.rotateByAngle(0.60, duration:0.25),
            SKAction.rotateByAngle(-0.30, duration:0.25)
            
            ]))
        } else{}
    }
    func pageSixBoot1Pressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageSixBoot1.hasActions() == false {
            
            if p6b1 == 0{
                p6b1 = 1
                pageSixBoot1.hidden = false
                /*switch screenSize.height {
                case 1366:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedPurpleiPadPro")))
                default:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedPurple")))
                }*/
            }//0
            else if p6b1 == 1 {
                p6b1 = 2
                switch screenSize.height {
                case 1366:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot1GreeniPadPro")))
                default:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot1Green")))
                }
            }//1
            else if p6b1 == 2 {
                p6b1 = 3
                switch screenSize.height {
                case 1366:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot1OrangeiPadPro")))
                default:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot1Orange")))
                }
            }//2
            else if p6b1 == 3 {
                p6b1 = 4
                switch screenSize.height {
                case 1366:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot1PinkiPadPro")))
                default:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot1Pink")))
                }
            }//3
            else if p6b1 == 4 {
                p6b1 = 0
                pageSixBoot1.hidden = true
                switch screenSize.height {
                case 1366:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot1BlueiPadPro")))
                default:
                    pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot1Blue")))
                }
            }//4
            
            
            
            
            
        } else{}

    }
    func pageSixBoot2Pressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageSixBoot2.hasActions() == false {
            
            if p6b2 == 0{
                p6b2 = 1
                pageSixBoot2.hidden = false
                /*switch screenSize.height {
                 case 1366:
                 pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedPurpleiPadPro")))
                 default:
                 pageSixBoot1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageFiveLeftShedPurple")))
                 }*/
            }//0
            else if p6b2 == 1 {
                p6b2 = 2
                switch screenSize.height {
                case 1366:
                    pageSixBoot2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot2RediPadPro")))
                default:
                    pageSixBoot2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot2Red")))
                }
            }//1
            else if p6b2 == 2 {
                p6b2 = 3
                switch screenSize.height {
                case 1366:
                    pageSixBoot2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot2BrowniPadPro")))
                default:
                    pageSixBoot2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot2Brown")))
                }
            }//2
            else if p6b2 == 3 {
                p6b2 = 4
                switch screenSize.height {
                case 1366:
                    pageSixBoot2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot2PinkiPadPro")))
                default:
                    pageSixBoot2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot2Pink")))
                }
            }//3
            else if p6b2 == 4 {
                p6b2 = 0
                pageSixBoot2.hidden = true
                switch screenSize.height {
                case 1366:
                    pageSixBoot2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot2BlueiPadPro")))
                default:
                    pageSixBoot2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSixBoot2Blue")))
                }
            }//4
            
            
            
            
            
        } else{}
    }
    func pageSixSpiderPressed() {
        if pageSixSpider.hasActions() == false {
            pageSixSpider.runAction(SKAction.sequence([
                SKAction.rotateByAngle(1.0, duration:0.25),
                SKAction.rotateByAngle(-2.0, duration:0.25),
                SKAction.rotateByAngle(2.0, duration:0.25),
                SKAction.rotateByAngle(-2.0, duration:0.25),
                SKAction.rotateByAngle(2.0, duration:0.25),
                SKAction.rotateByAngle(-1.0, duration:0.25)
                
                ]))
        } else{}
    }
    func pageSixCrabPressed() {
        if pageSixCrabEyebrows.hasActions() == false {
            pageSixCrabEyebrows.runAction(SKAction.sequence([
                SKAction.moveToY(815*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(797*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(815*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(797*self.size.height/1536, duration: 0.25),
                SKAction.waitForDuration(2.0)
                ]))
            pageSixCrabPincer1.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.0),
                SKAction.moveToY(637*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(621*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(637*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(621*self.size.height/1536, duration: 0.25)
                ]))
            pageSixCrabPincer2.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.1),
                
                SKAction.moveToY(650*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(635*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(650*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(635*self.size.height/1536, duration: 0.25)
                ]))
            pageSixCrabPincer3.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.2),
                
                SKAction.moveToY(653*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(634*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(653*self.size.height/1536, duration: 0.25),
                SKAction.moveToY(634*self.size.height/1536, duration: 0.25)
                
                ]))
            
        } else{}
    }
    func pageSixBallPressed() {
        if pageSixBall.hasActions() == false {
            pageSixBall.runAction(SKAction.sequence([
                SKAction.moveToY(1700*self.size.height/1536, duration:0.5),
                SKAction.moveToX(1450*self.size.width/2048, duration: 0.3),
                SKAction.moveToY(1190*self.size.height/1536, duration: 0.5),
                SKAction.moveTo(CGPointMake(1828*self.size.width/2048, 900*self.size.height/1536), duration: 0.5),
                SKAction.waitForDuration(0.5),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveTo(CGPointMake(1574*self.size.width/2048, 573*self.size.height/1536), duration: 0.1),
                SKAction.scaleTo(1.0, duration:0.1),
                SKAction.fadeInWithDuration(0.25),
                SKAction.waitForDuration(0.5)



            ]))
            pageSixBall.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.3),
                SKAction.scaleTo(0.6, duration:0.5)
                
                ]))
        
            pageSixThumpText.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.3),
                SKAction.fadeAlphaTo(1.0, duration: 0),
                SKAction.scaleTo(1.0, duration: 0.15),
                SKAction.waitForDuration(1.5),
                SKAction.scaleTo(0.01, duration: 0.15),
                SKAction.fadeAlphaTo(0, duration: 0)
                
                ]))
            pageSixThumpImage.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.3),
                SKAction.fadeAlphaTo(1.0, duration: 0),
                SKAction.scaleTo(1.0, duration: 0.15),
                SKAction.waitForDuration(1.5),
                SKAction.scaleTo(0.01, duration: 0.15),
                SKAction.fadeAlphaTo(0, duration: 0)
                
                ]))
            pageSixStarfish.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.8),
                SKAction.moveToY(585*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(454*self.size.height/1536, duration: 0.5)
                
                ]))
            pageSixStarfish.runAction(SKAction.sequence([
                SKAction.waitForDuration(1.8),
                SKAction.rotateByAngle(6.28, duration:1.0)
                
                
                ]))
        
    } else{}
    }
    func pageSixClam1Pressed() {
        if pageSixClam1.hasActions() == false {
            pageSixClam1.runAction(SKAction.sequence([
                SKAction.rotateByAngle(1.57, duration:0.5),
                SKAction.rotateByAngle(-3.14, duration:1.0),
                SKAction.rotateByAngle(1.57, duration:0.5)
                ]))
        } else{}
    }
    func pageSixClam2Pressed() {
        if pageSixClam2.hasActions() == false {
            pageSixClam2.runAction(SKAction.sequence([
                SKAction.rotateByAngle(12.56, duration:3.0),
                ]))
        } else{}
    }
    func pageSixClam3Pressed() {
        if pageSixClam3.hasActions() == false {
            pageSixClam3.runAction(SKAction.sequence([
                SKAction.rotateByAngle(-12.56, duration:1.0),
                ]))
        } else{}
    }
    
    func pageSevenBallPressed() {
        if pageSevenBall.hasActions() == false {
            pageSevenBall.runAction(SKAction.sequence([
                SKAction.moveToY(1700*self.size.height/1536, duration:0.5),
                SKAction.moveToX(950*self.size.width/2048, duration: 0.3),
                SKAction.moveToY(1320*self.size.height/1536, duration:0.3),
                SKAction.moveToY(1700*self.size.height/1536, duration:0.3),
                SKAction.moveToX(854*self.size.width/2048, duration: 0.3),
                SKAction.moveToY(490*self.size.height/1536, duration:0.5)

                
                
                
                ]))
           
            
        } else{}
    }
    func pageSevenBranchPressed() {
        if pageSevenLeaf1.hasActions() == false {
          
            
            for object in [pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4]{
                object.runAction(SKAction.sequence([
                    SKAction.moveByX(0, y:-150*self.size.height/1536, duration:0.5)
                    ]))
            }
            for object in [pageSevenLeaf1,pageSevenLeaf2,pageSevenLeaf3,pageSevenLeaf4]{
                object.runAction(SKAction.sequence([
                    SKAction.fadeInWithDuration(0.1),
                    SKAction.waitForDuration(0.3),
                    SKAction.fadeOutWithDuration(0.1),
                    SKAction.moveByX(0, y:150*self.size.height/1536, duration:0.1)

                    ]))
            }
            
        } else{}
    }
    func pageSevenEviePressed() {
        if pageSevenEvieArm.hasActions() == false {
            
            pageSevenEvieArm.runAction(SKAction.sequence([
                SKAction.moveToX(1662*self.size.width/2048, duration: 0.25),
                SKAction.waitForDuration(1.5),
                SKAction.moveToX(1633*self.size.width/2048, duration: 0.25)
                ]))
            if p7b5 == 1 {
            pageSevenBlock5.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.2),
                SKAction.moveToX(1850*self.size.width/2048, duration: 0.15),
                SKAction.moveTo(CGPointMake((1850 + 0)*self.size.width/2048, (372 - 0)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 10)*self.size.width/2048, (372 - 1)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 20)*self.size.width/2048, (372 - 4)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 30)*self.size.width/2048, (372 - 9)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 40)*self.size.width/2048, (372 - 16)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 50)*self.size.width/2048, (372 - 25)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 60)*self.size.width/2048, (372 - 36)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 70)*self.size.width/2048, (372 - 49)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 80)*self.size.width/2048, (372 - 64)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 90)*self.size.width/2048, (372 - 81)*self.size.height/1536), duration: 0.05),
                SKAction.moveTo(CGPointMake((1850 + 100)*self.size.width/2048, (372 - 100)*self.size.height/1536), duration: 0.05)
                ]))
            pageSevenBlock4.runAction(SKAction.sequence([
                    SKAction.waitForDuration(0.35),
                    SKAction.moveTo(CGPointMake(1738*self.size.width/2048, 380*self.size.height/1536), duration: 0.15)
                    ]))
                p7b5 = 0
            }
            else if p7b5 == 0 {
                pageSevenBlock4.runAction(SKAction.sequence([
                    SKAction.waitForDuration(0.2),
                    SKAction.moveToX(1850*self.size.width/2048, duration: 0.15),
                    SKAction.moveTo(CGPointMake((1850 + 0)*self.size.width/2048, (372 - 0)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 5)*self.size.width/2048, (372 - 1)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 10)*self.size.width/2048, (372 - 4)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 15)*self.size.width/2048, (372 - 9)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 20)*self.size.width/2048, (372 - 16)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 25)*self.size.width/2048, (372 - 25)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 30)*self.size.width/2048, (372 - 36)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 35)*self.size.width/2048, (372 - 49)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 40)*self.size.width/2048, (372 - 64)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 45)*self.size.width/2048, (372 - 81)*self.size.height/1536), duration: 0.05),
                    SKAction.moveTo(CGPointMake((1850 + 50)*self.size.width/2048, (372 - 100)*self.size.height/1536), duration: 0.05),
                    SKAction.fadeOutWithDuration(0.25),
                    SKAction.moveTo(CGPointMake(1760*self.size.width/2048, 429*self.size.height/1536), duration: 0.05),
                        SKAction.fadeInWithDuration(0.25)
                    ]))
                pageSevenBlock5.runAction(SKAction.sequence([
                    SKAction.waitForDuration(0.9),
                    SKAction.fadeOutWithDuration(0.25),
                    SKAction.moveTo(CGPointMake(1708*self.size.width/2048, 372*self.size.height/1536), duration: 0.05),
                    SKAction.fadeInWithDuration(0.25)

                    ]))
                p7b5 = 1
                    }
            
        } else{}
    }
    func pageSevenPicturePressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageSevenPicture.hasActions() == false {
            
            if p7p == 0{
                p7p = 1
                switch screenSize.height {
                case 1366:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureBlueiPadPro")))
                default:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureBlue")))
                }
            }//0
            else if p7p == 1 {
                p7p = 2
                switch screenSize.height {
                case 1366:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureGreeniPadPro")))
                default:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureGreen")))
                }
            }//1
            else if p7p == 2 {
                p7p = 3
                switch screenSize.height {
                case 1366:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureOrangeiPadPro")))
                default:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureOrange")))
                }
            }//2
            else if p7p == 3 {
                p7p = 4
                switch screenSize.height {
                case 1366:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureRediPadPro")))
                default:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureRed")))
                }
            }//3
            else if p7p == 4 {
                p7p = 5
                switch screenSize.height {
                case 1366:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureYellowiPadPro")))
                default:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureYellow")))
                }
            }//4
            else if p7p == 5 {
                p7p = 0
                switch screenSize.height {
                case 1366:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureBlackiPadPro")))
                default:
                    pageSevenPicture.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageSevenPictureBlack")))
                }
            }//5
            
            
            
            
            
        } else{}
    
    }
    func pageSevenOllyPressed() {
        if pageSevenOlly.hasActions() == false {
            pageSevenOlly.runAction(SKAction.sequence([
                SKAction.moveToY(850*self.size.height/1536, duration:0.5),
                SKAction.moveToY(657*self.size.height/1536, duration:0.5)
                ]))
            pageSevenOlly.runAction(SKAction.sequence([
                SKAction.rotateByAngle(6.28, duration: 1.0)
                
                ]))
            
            
        } else{}
    }
    func pageSevenBlocksPressed() {
        if pageSevenBlock1.hasActions() == false {
            pageSevenBlock2.runAction(SKAction.sequence([
                SKAction.moveToY(400*self.size.height/1536, duration:0.25),
                SKAction.moveToX(1300*self.size.width/2048, duration:0.25),
                SKAction.moveToY(275*self.size.height/1536, duration:0.25),
                SKAction.waitForDuration(1.0),
                SKAction.fadeOutWithDuration(0.125),
                SKAction.moveTo(CGPointMake(1089*self.size.width/2048, 337*self.size.height/1536), duration:0.1),
                SKAction.fadeInWithDuration(0.125)

                ]))
            pageSevenBlock1.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.25),
                SKAction.moveToY(400*self.size.height/1536, duration:0.25),
                SKAction.moveToX(1310*self.size.width/2048, duration:0.25),
                SKAction.moveToY(340*self.size.height/1536, duration:0.25),
                SKAction.waitForDuration(0.75),
                SKAction.fadeOutWithDuration(0.125),
                SKAction.moveTo(CGPointMake(1062*self.size.width/2048, 286*self.size.height/1536), duration:0.1),
                SKAction.fadeInWithDuration(0.125)

                ]))
            pageSevenBlock3.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.5),
                SKAction.moveToY(425*self.size.height/1536, duration:0.25),
                SKAction.moveToX(1320*self.size.width/2048, duration:0.25),
                SKAction.moveToY(395*self.size.height/1536, duration:0.25),
                SKAction.waitForDuration(0.5),
                SKAction.fadeOutWithDuration(0.125),
                SKAction.moveTo(CGPointMake(1153*self.size.width/2048, 290*self.size.height/1536), duration:0.1),
                SKAction.fadeInWithDuration(0.125)

                ]))
            
            _ = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(MainMenuScene.changeBlock2ZPos), userInfo: nil, repeats: false)
            _ = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(MainMenuScene.changeBlock1ZPos), userInfo: nil, repeats: false)
            _ = NSTimer.scheduledTimerWithTimeInterval(0.75, target: self, selector: #selector(MainMenuScene.changeBlock3ZPos), userInfo: nil, repeats: false)
            _ = NSTimer.scheduledTimerWithTimeInterval(1.87, target: self, selector: #selector(MainMenuScene.resetBlock2ZPos), userInfo: nil, repeats: false)
            _ = NSTimer.scheduledTimerWithTimeInterval(1.87, target: self, selector: #selector(MainMenuScene.resetBlock1ZPos), userInfo: nil, repeats: false)
            _ = NSTimer.scheduledTimerWithTimeInterval(1.87, target: self, selector: #selector(MainMenuScene.resetBlock3ZPos), userInfo: nil, repeats: false)
            
        } else{}
    }
    
    func changeBlock2ZPos() {
        pageSevenBlock2.zPosition = 5

    }
    func changeBlock1ZPos() {
        pageSevenBlock1.zPosition = 6

    }
    func changeBlock3ZPos() {
        pageSevenBlock3.zPosition = 7

    }
    func resetBlock2ZPos() {
        pageSevenBlock2.zPosition = 7

    }
    func resetBlock1ZPos() {
        pageSevenBlock1.zPosition = 5
    }
    func resetBlock3ZPos() {
        pageSevenBlock3.zPosition = 6

    }
    
    func pageEightFlorryPressed() {
    
        if pageEightFlorry1.hasActions() == false {
            pageEightFlorry1.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(2380*self.size.width/2048, 1214*self.size.height/1536), duration:2.0),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveTo(CGPointMake(880*self.size.width/2048, 1214*self.size.height/1536), duration:0.1),
                SKAction.fadeInWithDuration(0.25)

                ]))
            pageEightFlorry1Wings.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(2418*self.size.width/2048, 1200*self.size.height/1536), duration:2.0),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveTo(CGPointMake(918*self.size.width/2048, 1200*self.size.height/1536), duration:0.1),
                SKAction.fadeInWithDuration(0.25)
                ]))
            pageEightFlorry1Wings.runAction(SKAction.sequence([
                SKAction.rotateByAngle(0.39, duration:0.5),
                SKAction.rotateByAngle(-0.78, duration:1.0),
                SKAction.rotateByAngle(0.39, duration:0.5)
                ]))
            pageEightFlorry2.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(2748*self.size.width/2048, 1330*self.size.height/1536), duration:2.0),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveTo(CGPointMake(1248*self.size.width/2048, 1330*self.size.height/1536), duration:0.1),
                SKAction.fadeInWithDuration(0.25)


                ]))
            pageEightFlorry2Wings.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(2787*self.size.width/2048, 1320*self.size.height/1536), duration:2.0),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveTo(CGPointMake(1287*self.size.width/2048, 1320*self.size.height/1536), duration:0.1),
                SKAction.fadeInWithDuration(0.25)


                ]))
            pageEightFlorry2Wings.runAction(SKAction.sequence([
                SKAction.rotateByAngle(0.39, duration:0.5),
                SKAction.rotateByAngle(-0.78, duration:1.0),
                SKAction.rotateByAngle(0.39, duration:0.5)
                ]))
        } else{}
    
    }
    func pageEightBootSet1Pressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageEightBootSet1.hasActions() == false {
            
            if p8BS1 == 0{
                p8BS1 = 1
                switch screenSize.height {
                case 1366:
                    pageEightBootSet1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet1BGiPadPro")))
                default:
                    pageEightBootSet1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet1BG")))
                }
            }//0
            else if p8BS1 == 1 {
                p8BS1 = 2
                switch screenSize.height {
                case 1366:
                    pageEightBootSet1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet1YPiPadPro")))
                default:
                    pageEightBootSet1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet1YP")))
                }
            }//1
            else if p8BS1 == 2 {
                p8BS1 = 0
                switch screenSize.height {
                case 1366:
                    pageEightBootSet1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet1iPadPro")))
                default:
                    pageEightBootSet1.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet1")))
                }
            }//2
          
            
            
            
            
            
            
        } else{}
    }
    func pageEightBootSet2Pressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageEightBootSet2.hasActions() == false {
            
            if p8BS2 == 0{
                p8BS2 = 1
                switch screenSize.height {
                case 1366:
                    pageEightBootSet2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet2BRiPadPro")))
                default:
                    pageEightBootSet2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet2BR")))
                }
            }//0
            else if p8BS2 == 1 {
                p8BS2 = 2
                switch screenSize.height {
                case 1366:
                    pageEightBootSet2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet2PBiPadPro")))
                default:
                    pageEightBootSet2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet2PB")))
                }
            }//1
            else if p8BS2 == 2 {
                p8BS2 = 0
                switch screenSize.height {
                case 1366:
                    pageEightBootSet2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet2iPadPro")))
                default:
                    pageEightBootSet2.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightBootSet2")))
                }
            }//2
            
            
            
            
            
            
            
        } else{}
    }
    func pageEightPaddyPressed() {
        if pageEightPaddy.hasActions() == false {
        pageEightPaddy.runAction(SKAction.sequence([
            SKAction.moveToX(1120*self.size.width/2048, duration:2.0),
            SKAction.moveToX(793*self.size.width/2048, duration:2.0)
            ]))
        _ = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(MainMenuScene.changePaddyDir), userInfo: nil, repeats: false)
        _ = NSTimer.scheduledTimerWithTimeInterval(4.0, target: self, selector: #selector(MainMenuScene.resetPaddyDir), userInfo: nil, repeats: false)
    } else{}
    }
    func changePaddyDir() {
        pageEightPaddy.xScale = 1.0
    }
    func resetPaddyDir() {
        pageEightPaddy.xScale = -1.0
    }
    func pageEightSeahorsePressed() {
        if pageEightSeahorse.hasActions() == false {
            pageEightSeahorse.runAction(SKAction.sequence([
                SKAction.moveToX(1500*self.size.width/2048, duration: 3.0),
                SKAction.moveToX(1200*self.size.width/2048, duration: 3.0)
                ]))
            pageEightSeahorse.runAction(SKAction.sequence([
                SKAction.moveToY(350*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(300*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(350*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(300*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(350*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(300*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(350*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(300*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(350*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(300*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(350*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(300*self.size.height/1536, duration: 0.5)
                ]))
            _ = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(MainMenuScene.changeSeahorseDir), userInfo: nil, repeats: false)
            _ = NSTimer.scheduledTimerWithTimeInterval(6.0, target: self, selector: #selector(MainMenuScene.resetSeahorseDir), userInfo: nil, repeats: false)
        } else{}
    }
    func changeSeahorseDir() {
        pageEightSeahorse.xScale = 1.0
    }
    func resetSeahorseDir() {
        pageEightSeahorse.xScale = -1.0
    }
    func pageEightWheelPressed() {
        if pageEightWheel.hasActions() == false {
            pageEightWheel.runAction(SKAction.sequence([
                SKAction.rotateByAngle(6.28, duration:10.0),
                ]))
        } else{}
    }
    func pageEightGreenPlantPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageEightGreenPlant.hasActions() == false {
            
            if p8G == 0{
                p8G = 1
                switch screenSize.height {
                case 1366:
                    pageEightGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightGreenPlantBlueiPadPro")))
                default:
                    pageEightGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightGreenPlantBlue")))
                }
            }//0
            else if p8G == 1 {
                p8G = 2
                switch screenSize.height {
                case 1366:
                    pageEightGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightGreenPlantBrowniPadPro")))
                default:
                    pageEightGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightGreenPlantBrown")))
                }
            }//1
            else if p8G == 2 {
                p8G = 3
                switch screenSize.height {
                case 1366:
                    pageEightGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightGreenPlantRediPadPro")))
                default:
                    pageEightGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightGreenPlantRed")))
                }
            }//2
            else if p8G == 3 {
                p8G = 0
                switch screenSize.height {
                case 1366:
                    pageEightGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightGreenPlantiPadPro")))
                default:
                    pageEightGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightGreenPlant")))
                }
            }//3
            
            
            
            
            
            
        } else{}
    }
    func pageEightROPlantPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageEightRedOrangePlant.hasActions() == false {
            
            if p8RO == 0{
                p8RO = 1
                switch screenSize.height {
                case 1366:
                    pageEightRedOrangePlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightROPlantGPiPadPro")))
                default:
                    pageEightRedOrangePlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightROPlantGP")))
                }
            }//0
            else if p8RO == 1 {
                p8RO = 2
                switch screenSize.height {
                case 1366:
                    pageEightRedOrangePlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightROPlantPBiPadPro")))
                default:
                    pageEightRedOrangePlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightROPlantPB")))
                }
            }//1
            else if p8RO == 2 {
                p8RO = 3
                switch screenSize.height {
                case 1366:
                    pageEightRedOrangePlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightROPlantMultiiPadPro")))
                default:
                    pageEightRedOrangePlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightROPlantMulti")))
                }
            }//2
            else if p8RO == 3 {
                p8RO = 0
                switch screenSize.height {
                case 1366:
                    pageEightRedOrangePlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightROPlantiPadPro")))
                default:
                    pageEightRedOrangePlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageEightROPlant")))
                }
            }//3
           
            
            
            
            
            
        } else{}
    }
    func pageEightStarfishPressed() {
        if pageEightStarfish.hasActions() == false {
            pageEightStarfish.runAction(SKAction.sequence([
                SKAction.rotateByAngle(12.56, duration:1.0),
                ]))
        } else{}
    }
    func pageEightJellyfishPressed() {
        if pageEightJellyfish.hasActions() == false {
            pageEightJellyfish.runAction(SKAction.sequence([
                SKAction.moveToY(1700*self.size.height/1536, duration: 3.0),
                SKAction.moveToX(2248*self.size.width/2048, duration: 0.1),
                SKAction.moveToY(1292*self.size.height/1536, duration: 0.1),
                SKAction.moveToX(1879*self.size.width/2048, duration: 3.0)
                ]))
            
        } else{}
    }
    
    
    
    func pageNineFlorryPressed() {
        if pageNineFlorry.hasActions() == false {
            pageNineFlorry.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(646*self.size.width/2048, 1176*self.size.height/1536), duration:2.0),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveTo(CGPointMake(1671*self.size.width/2048, 1183*self.size.height/1536), duration:0.1),
                SKAction.fadeInWithDuration(0.25)
                
                ]))
            pageNineFlorryWings.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(627*self.size.width/2048, 1173*self.size.height/1536), duration:2.0),
                SKAction.fadeOutWithDuration(0.25),
                SKAction.moveTo(CGPointMake(1652*self.size.width/2048, 1180*self.size.height/1536), duration:0.1),
                SKAction.fadeInWithDuration(0.25)
                ]))
            pageNineFlorryWings.runAction(SKAction.sequence([
                SKAction.rotateByAngle(-0.39, duration:0.5),
                SKAction.rotateByAngle(0.78, duration:1.0),
                SKAction.rotateByAngle(-0.39, duration:0.5)
                ]))
            
        } else{}
    }
    func pageNineStarfishPressed() {
        if pageNineStarfish.hasActions() == false {
            pageNineStarfish.runAction(SKAction.sequence([
                SKAction.moveTo(CGPointMake(2200*self.size.width/2048, 1000*self.size.height/1536), duration: 3.0),
                SKAction.fadeOutWithDuration(0.1),
               SKAction.moveTo(CGPointMake(791*self.size.width/2048, 569*self.size.height/1536), duration: 0.2),
                SKAction.fadeInWithDuration(0.25)

                ]))
            pageNineStarfish.runAction(SKAction.sequence([
                SKAction.rotateByAngle(12.56, duration:3.0)
                
                ]))
        } else{}
    }
    func pageNineJellyfishPressed() {
        if pageNineJellyfish.hasActions() == false {
            pageNineJellyfish.runAction(SKAction.sequence([
                SKAction.moveToX(1400*self.size.width/2048, duration:5.0),
                SKAction.moveToX(916*self.size.width/2048, duration:5.0)
                ]))
            
        } else{}
    }
    func pageNinePaddyPressed() {
        if pageNinePaddy.hasActions() == false {
            pageNinePaddy.runAction(SKAction.sequence([
                SKAction.moveToX(1200*self.size.width/2048, duration:2.0),
                SKAction.moveToX(813*self.size.width/2048, duration:2.0)
                ]))
            _ = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(MainMenuScene.changep9PaddyDir), userInfo: nil, repeats: false)
            _ = NSTimer.scheduledTimerWithTimeInterval(4.0, target: self, selector: #selector(MainMenuScene.resetp9PaddyDir), userInfo: nil, repeats: false)
        } else{}
    }
    func changep9PaddyDir() {
        pageNinePaddy.xScale = 1.0
    }
    func resetp9PaddyDir() {
        pageNinePaddy.xScale = -1.0
    }
    func pageNineLizardPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageNineLizard.hasActions() == false {
            
            if p9L == 0{
                p9L = 1
                switch screenSize.height {
                case 1366:
                    pageNineLizard.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineLizardOrangeiPadPro")))
                default:
                    pageNineLizard.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineLizardOrange")))
                }
            }//0
            else if p9L == 1 {
                p9L = 0
                switch screenSize.height {
                case 1366:
                    pageNineLizard.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineLizardGreeniPadPro")))
                default:
                    pageNineLizard.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineLizardGreen")))
                }
            }//1
            
            
            
            
            
            
        } else{}
    }
    func pageNineClam1Pressed() {
        if pageNineClam1.hasActions() == false {
            pageNineClam1.runAction(SKAction.sequence([
                SKAction.rotateByAngle(12.56, duration:2.0)
                
                ]))
        } else{}
    }
    func pageNineClam2Pressed() {
        if pageNineClam2.hasActions() == false {
            pageNineClam2.runAction(SKAction.sequence([
                SKAction.rotateByAngle(3.14, duration:0.5),
                SKAction.rotateByAngle(-3.14, duration:0.5),
                SKAction.rotateByAngle(3.14, duration:0.5),
                SKAction.rotateByAngle(-3.14, duration:0.5)
                ]))
        } else{}
    }
    func pageNineClam3Pressed() {
        if pageNineClam3.hasActions() == false {
            pageNineClam3.runAction(SKAction.sequence([
                SKAction.rotateByAngle(3.14, duration:5.0)
                
                ]))
        } else{}
    }
    func pageNineRGPlantPressed() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        if pageNineRedGreenPlant.hasActions() == false {
            
            if p9RG == 0{
                p9RG = 1
                switch screenSize.height {
                case 1366:
                    pageNineRedGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineRGPlantBGiPadPro")))
                default:
                    pageNineRedGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineRGPlantBG")))
                }
            }//0
            else if p9RG == 1 {
                p9RG = 2
                switch screenSize.height {
                case 1366:
                    pageNineRedGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineRGPlantGPiPadPro")))
                default:
                    pageNineRedGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineRGPlantGP")))
                }
            }//1
            else if p9RG == 2 {
                p9RG = 3
                switch screenSize.height {
                case 1366:
                    pageNineRedGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineRGPlantPOiPadPro")))
                default:
                    pageNineRedGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineRGPlantPO")))
                }
            }//2
            else if p9RG == 3 {
                p9RG = 0
                switch screenSize.height {
                case 1366:
                    pageNineRedGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineRGPlantiPadPro")))
                default:
                    pageNineRedGreenPlant.runAction(SKAction.setTexture(SKTexture(imageNamed: "pageNineRGPlant")))
                }
            }//3
            
            
            
            
            
            
        } else{}
    }
    func pageNineSeahorsePressed() {
        if pageNineSeahorse.hasActions() == false {
            pageNineSeahorse.runAction(SKAction.sequence([
                SKAction.moveToX(1550*self.size.width/2048, duration: 3.0),
                SKAction.moveToX(1917*self.size.width/2048, duration: 3.0)
                ]))
            pageNineSeahorse.runAction(SKAction.sequence([
                SKAction.moveToY(378*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(328*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(378*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(328*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(378*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(328*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(378*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(328*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(378*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(328*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(378*self.size.height/1536, duration: 0.5),
                SKAction.moveToY(328*self.size.height/1536, duration: 0.5)
                ]))
            _ = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(MainMenuScene.changep9SeahorseDir), userInfo: nil, repeats: false)
            _ = NSTimer.scheduledTimerWithTimeInterval(6.0, target: self, selector: #selector(MainMenuScene.resetp9SeahorseDir), userInfo: nil, repeats: false)
        } else{}
    }
    func changep9SeahorseDir() {
        pageNineSeahorse.xScale = -1.0
    }
    func resetp9SeahorseDir() {
        pageNineSeahorse.xScale = 1.0
    }
    func pageNineWormPressed() {
        if pageNineWorm.hasActions() == false {
            pageNineWorm.runAction(SKAction.sequence([

                SKAction.moveToY(1215*self.size.height/1536, duration:0.5),
                SKAction.moveToY(1800*self.size.height/1536, duration:0.5),
                SKAction.fadeOutWithDuration(0.1),
                SKAction.moveToY(1283*self.size.height/1536, duration:0.1),
                SKAction.fadeInWithDuration(0.25)

                ]))
          
            
        } else{}
    }
    
}
