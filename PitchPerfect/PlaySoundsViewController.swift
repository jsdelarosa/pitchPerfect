//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Salvador De La Rosa on 6/23/16.
//  Copyright © 2016 Magnolia Inc. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
   
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int {case Slow=0, Fast, Chipmunk, Vader, Echo, Reverb }
    
    
    @IBAction func playSoundForButton(sender: UIButton){
        print("Play Sound Button Pressed")
        switch(ButtonType(rawValue: sender.tag)!){
        case .Slow:
            playSound(rate: 0.5)
            print("1")
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
            print("vader")
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        
        configureUI(.Playing)
        
        snailButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        rabbitButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        chipmunkButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        vaderButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        echoButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        reverbButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        stopButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
    }
    @IBAction func stopButtonPressed(sender: AnyObject){
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    

    var recordedAudio: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySounds ViewController loaded")
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
