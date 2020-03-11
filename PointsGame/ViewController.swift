//
//  ViewController.swift
//  HerjanUrbas - Kovalsky
//
//  Created by ZUI on 05/11/2019.
//  Copyright © 2019 polsl. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var randomValue = Int.random(in: 1...100)
    var sliderValue = 50
    var points = 0
    var round = 1
    let soundWin = Bundle.main.url(forResource: "victoryff.swf", withExtension: "mp3")
    let soundContact = Bundle.main.url(forResource: "yourewelcomeclipmoanaringtone", withExtension: "mp3")
    let soundRestart = Bundle.main.url(forResource: "roblox-death-sound_1", withExtension: "mp3")
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomValueLabel.text = String(randomValue)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var randomValueLabel: UILabel!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        sliderValue = Int(sliderOutlet.value)
    }
    

    
    @IBAction func checkButton(_ sender: UIButton) {
        let currentPoints = 100 - abs(sliderValue-randomValue)
        points += currentPoints
        round += 1
        
        pointsLabel.text = String(points)
        
        
        let alert = UIAlertController(title: "Points", message: "You've got: " + String(currentPoints), preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        if(round == 11){
            let alert = UIAlertController(title: "Points", message: "Total points: " + String(points), preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundWin!)
                audioPlayer.play()
            }catch{
                print("No sound")
            }
            
            restart()
        }
        else{
            roundLabel.text = String(round)
        
            randomValue = Int.random(in: 1...100)
            randomValueLabel.text = String(randomValue)
        }
    }
    
    func restart(){
        roundLabel.text = "1"
        pointsLabel.text = "0"
        randomValue = Int.random(in: 1...100)
        randomValueLabel.text = String(randomValue)
        sliderValue = 50
        points = 0
        round = 1
    }
    
    @IBAction func restartButton(_ sender: Any) {
        restart()
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundRestart!)
            audioPlayer.play()
        }catch{
            print("No sound")
        }
    }
    
    
    @IBAction func helpButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Help", message: "email me at: paulurb875@student.polsl.pl", preferredStyle: .alert)
        let action = UIAlertAction(title: "Will do chief!", style: .default, handler: nil)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundContact!)
            audioPlayer.play()
        }catch{
            print("No sound")
        }
       
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

