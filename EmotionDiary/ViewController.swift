//
//  ViewController.swift
//  EmotionDiary
//
//  Created by Minjae Kim on 5/17/24.
//

import UIKit

final class ViewController: UIViewController {

    static let emotionKey = "emotions"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var resetLabel: UILabel!
    
    private var userDefaultsHelper = UserDefaultsHelper()
    private var emotionList: [Emotion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emotionList = userDefaultsHelper.emotionList
        
        titleBarConfig()
        buttonConfig()
        resetButtonConfig()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(appMovedToBackground),
                                       name: UIApplication.willResignActiveNotification,
                                       object: nil)
    }
    
    @objc func appMovedToBackground() {
        
        userDefaultsHelper.emotionList = emotionList
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let tag = sender.tag
        
        if tag == 9 {
            for i in 0..<9 {
                self.emotionList[i].count = 0
                self.emotionLabels[i].text = emotionList[i].emotion + "\(emotionList[i].count)"
            }
        } else {
            self.emotionList[tag].count += 1
            self.emotionLabels[tag].text = emotionList[tag].emotion + "\(emotionList[tag].count)"
        }
    }
    
}

// MARK: Cofigure UI
extension ViewController {
    
    private func titleBarConfig() {
        
        self.titleLabel.text = "감정 다이어리"
        self.titleLabel.font = .boldSystemFont(ofSize: 15)
        self.titleLabel.textAlignment = .center
        
        self.menuButton.setImage(UIImage(systemName: "list.dash"), for: .normal)
        self.menuButton.tintColor = .black
    }

    private func buttonConfig() {
        
        for i in 0..<emotionList.count {
            let image = UIImage(named: emotionList[i].imageName)?.withRenderingMode(.alwaysOriginal)
            
            self.emotionButtons[i].setImage(image, for: .normal)
            self.emotionLabels[i].text = emotionList[i].emotion + " \(emotionList[i].count)"
            self.emotionLabels[i].font = .boldSystemFont(ofSize: 15)
            self.emotionLabels[i].textAlignment = .center
        }
    }
    
    private func resetButtonConfig() {
        
        var image: UIImage?
        
        if let randomEmotion = emotionList.randomElement() {
            let imageName = randomEmotion.imageName
            image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        } else {
            image = UIImage.slime1.withRenderingMode(.alwaysOriginal)
        }
        self.resetButton.setImage(image, for: .normal)
        
        self.resetLabel.text = "리셋"
        self.resetLabel.font = .boldSystemFont(ofSize: 15)
        self.resetLabel.textAlignment = .center
    }
}
