//
//  ViewController.swift
//  Timer
//
//  Created by 강소원 on 9/6/24.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var second: Int = 0
    var mTimer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureUI()
    }
    
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        second = Int(sender.value)
        mainLabel.text = "\(second) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.value = 30
    }
        
    @objc func timerCallback() {
        if second > 0 {
            second -= 1
            slider.value = Float(second)
            mainLabel.text = "\(second) 초"
        } else {
            second = 0
            mainLabel.text = "초를 선택하세요"
            mTimer?.invalidate()
            
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
}

