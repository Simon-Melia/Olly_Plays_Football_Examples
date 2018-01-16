//
//  PopScene.swift
//  Olly Plays Football
//
//  Created by Simon Melia  on 10/04/2016.
//  Copyright © 2016 Simon Melia. All rights reserved.
//

import UIKit
import SpriteKit

class PopScene: SKScene {
    let touchLayer = SKNode()
    var touchx: CGFloat?
    var touchy: CGFloat?
    var canTouch = true
    var homeButton: SKSpriteNode!
    var volumeButton: SKSpriteNode!
    var base: SKSpriteNode!
    var gameReef: SKSpriteNode!
    var instructions: SKSpriteNode!

    var counter = 0
    var dur = 10.0
    var a = 0
    var bubble: SKSpriteNode!
    var bubbleradius = 43.5
    var background = SKSpriteNode(imageNamed: "blankWhite")
    var reef = SKSpriteNode(imageNamed: "reef")
    var bubbleArray = [Int]()
    var bubbleNodes = [SKSpriteNode]()
    var timer1: NSTimer!
    var timer2: NSTimer!
    var timer3: NSTimer!
    var timer4: NSTimer!
    var checkTimer: NSTimer!
    var timerArray = [NSTimer]()
    var score = 0
    var scoreLabel: SKLabelNode!
    var scoreTextLabel: SKLabelNode!
    var highScoreLabel: SKLabelNode!
    var playAgainLabel: SKLabelNode!
    var blankDirBar: SKSpriteNode!
    var wantDir: SKSpriteNode!
    var music:String!
    var volume:String!
    var changeVolButton: SKAction!
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        let defaults = NSUserDefaults.standardUserDefaults()
        if let musicValue: String? = defaults.stringForKey("musicValue"){
            music = musicValue!
            if music == "on" {volume = "volumeOn"} else {volume = "volumeOff"}
        }
        highScoreLabel = SKLabelNode(fontNamed: "Futura-Medium")
        
        highScoreLabel.fontSize = 30
        highScoreLabel.fontColor = UIColor.blackColor()
        
        if let topScore: Int? = defaults.integerForKey("highScore"){
            highScoreLabel.text = "Highscore: \(topScore!) "
        }
        
        
        scoreLabel = SKLabelNode(fontNamed: "Futura-Medium")
        scoreLabel.text = "\(score)"
        scoreLabel.fontSize = 60
        scoreLabel.fontColor = UIColor.blackColor()
        scoreTextLabel = SKLabelNode(fontNamed: "Futura-Medium")
        scoreTextLabel.text = "Score"
        scoreTextLabel.fontSize = 60
        scoreTextLabel.fontColor = UIColor.blackColor()
        
        playAgainLabel = SKLabelNode(fontNamed: "Futura-Medium")
        playAgainLabel.text = "Play again?"
        playAgainLabel.fontSize = 60
        playAgainLabel.fontColor = UIColor.redColor()
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            homeButton = SKSpriteNode(imageNamed: "homeButtoniPadPro")
            volumeButton = SKSpriteNode(imageNamed: volume + "ButtoniPadPro")
            background = SKSpriteNode(imageNamed: "blankWhiteiPadPro")
            base = SKSpriteNode(imageNamed: "baseImageiPadPro")
            gameReef = SKSpriteNode(imageNamed: "popgamereefiPadPro")
            reef = SKSpriteNode(imageNamed: "reefiPadPro")
            instructions = SKSpriteNode(imageNamed: "instructionsiPadPro")

        default:
            homeButton = SKSpriteNode(imageNamed: "homeButton")
            volumeButton = SKSpriteNode(imageNamed: volume + "Button")
            background = SKSpriteNode(imageNamed: "blankWhite")
            base = SKSpriteNode(imageNamed: "baseImage")
            gameReef = SKSpriteNode(imageNamed: "popgamereef")
            reef = SKSpriteNode(imageNamed: "reef")
            instructions = SKSpriteNode(imageNamed: "instructions")

        }
        
        background.position = CGPointMake(self.size.width/2, self.size.height/2)
        reef.position = CGPointMake(330*self.size.width/2048, 68*self.size.height/1536)
        homeButton.position = CGPointMake(202*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)
        instructions.position = CGPointMake(1350*self.size.width/2048, 1350*self.size.height/1536)

        volumeButton.position = CGPointMake(457*self.size.width/2048, 1456*self.size.height/1536 + self.size.height/5)
        base.position = CGPointMake(1350*self.size.width/2048, 861*self.size.height/1536)
        gameReef.position = CGPointMake(1350*self.size.width/2048, 861*self.size.height/1536)
        scoreLabel.position = CGPointMake(330*self.size.width/2048, 618*self.size.height/1536)
        scoreTextLabel.position = CGPointMake(330*self.size.width/2048, 818*self.size.height/1536)
        highScoreLabel.position = CGPointMake(330*self.size.width/2048, 1218*self.size.height/1536)
        playAgainLabel.position = CGPointMake(330*self.size.width/2048, 318*self.size.height/1536)

        let homeButtonfinalPos: CGPoint = CGPointMake(202*self.size.width/2048, 1456*self.size.height/1536 )
        
        let volumeButtonfinalPos: CGPoint = CGPointMake(457*self.size.width/2048, 1456*self.size.height/1536 )
        
        for object in [background,reef,homeButton,volumeButton,base,gameReef,touchLayer,scoreLabel,scoreTextLabel,highScoreLabel,playAgainLabel,instructions] {
            addChild(object)
            object.zPosition = 3
        }
        background.zPosition = 1
        base.zPosition = 2
        gameReef.zPosition = 4
        instructions.zPosition = 4

        
        playAgainLabel.hidden = true
        let homeButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let homeButtonMove2 = SKAction.moveTo(homeButtonfinalPos, duration: 0.20)
        
        let volumeButtonMove1 = SKAction.moveByX(0, y: -22*self.size.height/100, duration: 0.20)
        let volumeButtonMove2 = SKAction.moveTo(volumeButtonfinalPos, duration: 0.20)
        
        homeButton.runAction(SKAction.sequence([homeButtonMove1,homeButtonMove2]))
        volumeButton.runAction(SKAction.sequence([volumeButtonMove1,volumeButtonMove2]))
        
       timer1 = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(PopScene.randomBubbleGenerator), userInfo: nil, repeats: true)
       checkTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(PopScene.checkWall), userInfo: nil, repeats: true)
        timerArray += [timer1,checkTimer]
        instructions.runAction(SKAction.sequence([
            SKAction.waitForDuration(1.0),
            SKAction.fadeOutWithDuration(0.25)
            ]))
        addDir()
        GameMusicPlayer.sharedInstance().playGameBackgroundMusic("bkPeriMusic.wav")

        if music == "on" {
            GameMusicPlayer.sharedInstance().fadeGameMusicIn()
        }
        else {
            GameMusicPlayer.sharedInstance().pauseGameMusicWithVolume()
        }
        
        
        defaults.synchronize()
    }
    
    func addDir() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            blankDirBar = SKSpriteNode(imageNamed: "dirBarBkiPadPro")
            wantDir = SKSpriteNode(imageNamed: "wantDiriPadPro")
        default:
            blankDirBar = SKSpriteNode(imageNamed: "dirBarBk")
            wantDir = SKSpriteNode(imageNamed: "wantDir")
        }
        
        blankDirBar.position = CGPointMake(1350*self.size.width/2048, 93*self.size.height/1536)
        wantDir.position = CGPointMake(1350*self.size.width/2048, 93*self.size.height/1536)
        blankDirBar.zPosition = 7
        wantDir.zPosition = 8
        
        for object in [blankDirBar,wantDir] {
            addChild(object)
        }
        
    }
    
    func checkWall() {
        for bubble in bubbleNodes {
            if (bubble.position.y > 1536*self.size.height/1536) {
                print("GAME OVER")
                for timer in timerArray {
                    timer.invalidate()
                }
                for bubble in bubbleNodes {
                bubble.runAction(SKAction.sequence([
                    SKAction.scaleTo(1.2, duration: 0.1),
                    SKAction.scaleTo(0.01, duration: 0.1)

                        ]))
                bubble.runAction(SKAction.sequence([
                    SKAction.fadeOutWithDuration(0.2),
                    SKAction.removeFromParent()
                    
                    ]))
                }
                gameEnd()
            }
        }
        
    }
    
    func gameEnd() {
        for object in bubbleArray {
                let index = bubbleArray.indexOf(object)
                bubbleArray.removeAtIndex(index!)
            
        }
        for object in bubbleNodes {
            let index = bubbleNodes.indexOf(object)
            bubbleNodes.removeAtIndex(index!)
            
        }
        for object in timerArray {
            let index = timerArray.indexOf(object)
            timerArray.removeAtIndex(index!)
            
        }
        playAgainLabel.hidden = false
        let defaults = NSUserDefaults.standardUserDefaults()
        if let highScore: Int? = defaults.integerForKey("highScore"){
            if score > highScore {
                scoreLabel.fontColor = UIColor.greenColor()

                defaults.setValue(score, forKey: "highScore")
                defaults.synchronize()
                highScoreLabel.text = "Highscore: \(score) "

            } else {
                scoreLabel.fontColor = UIColor.redColor()
}
            
            
        }
    }
    
    func restartGame() {
        score = 0
        scoreLabel.text = "\(score)"
        counter = 0
        dur = 10.0
        playAgainLabel.hidden = true
        scoreLabel.fontColor = UIColor.blackColor()
        timer1 = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(PopScene.randomBubbleGenerator), userInfo: nil, repeats: true)
        checkTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(PopScene.checkWall), userInfo: nil, repeats: true)
        timerArray += [timer1,checkTimer]
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        ////dont need special part for ipadpro as it is scaled automatically from ipad
        if canTouch == true {
            if let touch: UITouch = touches.first {
                let location = touch.locationInNode(touchLayer)
                touchx = CGFloat(location.x)
                touchy = CGFloat(location.y)
                for bubble in bubbleNodes {
                    if (bubble.containsPoint(location)) {
                        //print("BUBBLE \(bubble.name!) TOUCHED")
                        let index = bubbleNodes.indexOf(bubble)
                        bubbleNodes.removeAtIndex(index!)
                        let a = Int(bubble.name!)
                        let numIndex = bubbleArray.indexOf(a!)
                        bubbleArray.removeAtIndex(numIndex!)
                        bubble.runAction(SKAction.sequence([
                            SKAction.fadeOutWithDuration(0.1),
                            SKAction.removeFromParent()
                            ]))
                        updateScore()
                        print("BUBBLE \(bubble.name!) REMOVED FROM INDEX \(index!)")

                        //print(index)
                    }
                }
                

                if (touchx > 162*self.size.width/2048 && touchy > 1419*self.size.height/1536 && touchx < 242*self.size.width/2048 && touchy < 1494*self.size.height/1536) {
                    
                    homeButtonTouched()
                }
                else if (touchx > 420*self.size.width/2048 && touchy > 1418*self.size.height/1536 && touchx < 493*self.size.width/2048 && touchy < 1498*self.size.height/1536) {
                    
                    volumeButtonTouched()
                }
                else if (touchx > 653*self.size.width/2048 && touchy > 0*self.size.height/1536 && touchx < 2048*self.size.width/2048 && touchy < 186*self.size.height/1536) {
                    if let url = NSURL(string: "http://www.ollyoctopus.com/ollydub.html") {
                        UIApplication.sharedApplication().openURL(url)
                    }
                }

                
                if playAgainLabel.hidden == false {
                    if (playAgainLabel.containsPoint(location)) {
                        restartGame()
                    }
                }
                
                /*if (touchx > (bubble.position.x - 44*self.size.width/2048) && touchy > (bubble.position.y - 44*self.size.height/1536) && touchx < (bubble.position.x + 44*self.size.width/2048) && touchy < (bubble.position.y + 44*self.size.height/1536) ) {
                    print("BUBBLE TOUCHED")
                    
                    
                } else {print("BUBBLE NOT TOUCHED")}*/
                
            }
            else {print("CANNOT TOUCH")}
        }
    }

func updateScore() {
    score = score + 1
    scoreLabel.text = "\(score)"

}

func randomBubbleGenerator() {
        counter = counter + 1    //counter=2 means 1 second
        print(counter)
        switch counter {
        case 20:
            dur = 9.0
        case 40:
            dur = 8.0
        case 60:
            dur = 7.0
        case 80:
            dur = 6.0
            timer1.invalidate()
            timer2 = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(PopScene.randomBubbleGenerator), userInfo: nil, repeats: true)
            let index = timerArray.indexOf(timer1)
            timerArray.removeAtIndex(index!)
            timerArray += [timer2]
        case 100:
            dur = 5.0
        case 160:
            dur = 4.0
            timer2.invalidate()
            timer3 = NSTimer.scheduledTimerWithTimeInterval(0.15, target: self, selector: #selector(PopScene.randomBubbleGenerator), userInfo: nil, repeats: true)
            let index = timerArray.indexOf(timer2)
            timerArray.removeAtIndex(index!)
            timerArray += [timer3]
        case 300:
            dur = 2.0
            timer3.invalidate()
            timer4 = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(PopScene.randomBubbleGenerator), userInfo: nil, repeats: true)
            let index = timerArray.indexOf(timer3)
            timerArray.removeAtIndex(index!)
            timerArray += [timer4]
        default:
            a = a + 1
    }
    
    
        generateRandomName()
    
    
            
    
    
    
    
}
    
func generateRandomName() {
   let randName = Int(arc4random_uniform(100))
   // print("NUM is \(randName)")

    if bubbleArray.contains(randName) {
     //  print("\(randName) Copied")
        generateRandomName()
    } else {
        generateBubble(randName)
        
    }
   
    
}

func generateBubble(num: Int) {
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    switch screenSize.height {
    case 1366:
        bubble = SKSpriteNode(imageNamed: "popgamebubbleiPadPro")
    default:
        bubble = SKSpriteNode(imageNamed: "popgamebubble")
    }
    bubble.name = "\(num)"
    bubbleArray.append(num)
    bubbleNodes.append(bubble)
  /* for bubble in bubbleNodes {
        print(bubble)
    }*/
    let randomNo = CGFloat(Int(arc4random_uniform(1200)+750))
    let startPoint = CGPointMake(randomNo*self.size.width/2048, 230*self.size.height/1536)
    let endPoint = CGPointMake(randomNo*self.size.width/2048, 3*self.size.height/2)
    // let wait = SKAction.waitForDuration(0.1, withRange: 4.0)
    //let rand =  Double(arc4random_uniform(10)+9)
    let move = SKAction.moveTo(endPoint, duration: dur)
    bubble.position = startPoint
    addChild(bubble)
    
    bubble.zPosition = 3
    bubble.runAction(SKAction.sequence([move,SKAction.removeFromParent()]))
}


func homeButtonTouched() {
    GameMusicPlayer.sharedInstance().fadeGameMusicOut()

        canTouch = false
        let scaleDown = SKAction.scaleTo(0.75, duration: 0.15)
        let scaleBack = SKAction.scaleTo(1, duration: 0.15)
        homeButton.runAction(SKAction.sequence([scaleDown,scaleBack]), completion: {
            self.scene!.view!.presentScene(MainMenuScene(size: self.scene!.size),transition: SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5) )
        })
    for timer in timerArray {
        timer.invalidate()
    }
}
    func volumeButtonTouched() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if music == "on" {
            music = "off"
            defaults.setValue("off", forKey: "musicValue")
            GameMusicPlayer.sharedInstance().pauseGameBackgroundMusic()
            volume = "volumeOff"
        }
        else {
            music = "on"
            defaults.setValue("on", forKey: "musicValue")
            GameMusicPlayer.sharedInstance().resumeGameBackgroundMusic()
            volume = "volumeOn"
        }
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        switch screenSize.height {
        case 1366:
            changeVolButton = SKAction.setTexture(SKTexture(imageNamed: volume + "ButtoniPadPro"))
        default:
            changeVolButton = SKAction.setTexture(SKTexture(imageNamed: volume + "Button"))
        }
        volumeButton.runAction(SKAction.sequence([changeVolButton]))
        defaults.synchronize()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}