//
//  ViewController.swift
//  WorksongsProto
//
//  Created by Ian Curry on 10/18/14.
//  Copyright (c) 2014 Ian Curry. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var but: UIView!
    
    var audioPlayer = AVAudioPlayer()
    
    var filename:String!
    var type:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    @IBAction func play(sender: AnyObject) {
        self.playSound()
    }
    
    @IBAction func stop(sender: AnyObject) {
        self.stopSound()
    }

    func playSound()
    {
        filename = "join"
        type = "mp3"
        
        // Do any additional setup after loading the view, typically from a nib.
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(filename, ofType: type)!)
        println(alertSound)
        
        // Removed deprecated use of AVAudioSessionDelegate protocol
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    func stopSound()
    {
        audioPlayer.stop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

