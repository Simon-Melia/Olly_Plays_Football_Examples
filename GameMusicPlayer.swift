//
//  GameMusicPlayer.swift
//  Olly Plays Football
//
//  Created by Simon Melia  on 13/07/2016.
//  Copyright © 2016 Simon Melia. All rights reserved.
//
import UIKit
import SpriteKit
import AVFoundation

public class GameMusicPlayer {
    public var gameMusicPlayer: AVAudioPlayer?
    public var gamefxPlayer: AVAudioPlayer?
    
    public class func sharedInstance() -> GameMusicPlayer {
        return GameMusicPlayerInstance
    }
    
    public func playGameBackgroundMusic(filename: String) {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        if (url == nil) {
            print("Could not find file: \(filename)")
            return
        }
        
        var error: NSError? = nil
        do {
            gameMusicPlayer = try AVAudioPlayer(contentsOfURL: url!)
        } catch let error1 as NSError {
            error = error1
            gameMusicPlayer = nil
        }
        if let player = gameMusicPlayer {
            player.numberOfLoops = -1
            player.prepareToPlay()
            player.play()
            player.volume = 0.0
        } else {
            print("Could not create audio player: \(error!)")
        }
    }
    
    public func pauseGameBackgroundMusic() {
        if let player = gameMusicPlayer {
            if player.playing {
                player.pause()
            }
        }
    }
    
    public func pauseGameMusicWithVolume() {
        if let player = gameMusicPlayer {
            if player.playing {
                player.volume = 1.0
                player.pause()
            }
        }
    }
    
    public func resumeGameBackgroundMusic() {
        if let player = gameMusicPlayer {
            if !player.playing {
                player.play()
            }
        }
    }
    
    public func playGameSoundEffect(filename: String) {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        if (url == nil) {
            print("Could not find file: \(filename)")
            return
        }
        
        var error: NSError? = nil
        do {
            gamefxPlayer = try AVAudioPlayer(contentsOfURL: url!)
        } catch let error1 as NSError {
            error = error1
            gamefxPlayer = nil
        }
        if let player = gamefxPlayer {
            player.numberOfLoops = 0
            player.prepareToPlay()
            player.play()
        } else {
            print("Could not create audio player: \(error!)")
        }
    }
    
    @objc public func fadeGameMusicOut() {
        if let player = gameMusicPlayer {
            if player.volume > 0.1 {
                player.volume = player.volume - 0.2
                _ = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(GameMusicPlayer.fadeGameMusicOut), userInfo: nil, repeats: false)
                
            } else {
                player.stop()
                player.volume = 0.0
            }
        }
    }
    
    @objc public func fadeGameMusicIn() {
        if let player = gameMusicPlayer {
            if player.volume < 1.0 {
                player.volume = player.volume + 0.2
                _ = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(GameMusicPlayer.fadeGameMusicIn), userInfo: nil, repeats: false)
                
            } else {
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
}

private let GameMusicPlayerInstance = GameMusicPlayer()
