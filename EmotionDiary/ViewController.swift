//
//  ViewController.swift
//  EmotionDiary
//
//  Created by Minjae Kim on 5/17/24.
//

import UIKit

fileprivate struct Emotion: Codable {
    let emotion: String
    let imageName: String
    var count = 0
}

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var resetLabel: UILabel!
    
    private var emotions: [Emotion] = []
    
    private let emotionKey = "emotions"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUserDefault()
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
        saveUserDefault()
    }
    
    private func saveUserDefault() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(emotions) {
            UserDefaults.standard.set(encoded, forKey: emotionKey)
            print("UserDefault 저장 완료")
        } else {
            print("UserDefault 저장 실패")
        }
    }
    
    private func loadUserDefault() {
        if let data = UserDefaults.standard.object(forKey: emotionKey) as? Data {
            let decoder = JSONDecoder()
            if let emotionList = try? decoder.decode([Emotion].self, from: data) {
                self.emotions = emotionList
                print("UserDefault 불러오기 완료")
                return
            }
        }
        self.emotions = [
            Emotion(emotion: "행복해", imageName: "slime1"),
            Emotion(emotion: "사랑해", imageName: "slime3"),
            Emotion(emotion: "좋아해", imageName: "slime2"),
            Emotion(emotion: "당황해", imageName: "slime7"),
            Emotion(emotion: "속상해", imageName: "slime8"),
            Emotion(emotion: "우울해", imageName: "slime9"),
            Emotion(emotion: "지루해", imageName: "slime4"),
            Emotion(emotion: "졸려", imageName: "slime6"),
            Emotion(emotion: "무덤덤해", imageName: "slime5")
        ]
        print("UserDefault 불러오기 실패")
    }
    
    private func titleBarConfig() {
        self.titleLabel.text = "감정 다이어리"
        self.titleLabel.font = .boldSystemFont(ofSize: 15)
        self.titleLabel.textAlignment = .center
        
        self.menuButton.setImage(UIImage(systemName: "list.dash"), for: .normal)
        self.menuButton.tintColor = .black
    }

    private func buttonConfig() {
        for i in 0..<emotions.count {
            let image = UIImage(named: emotions[i].imageName)?.withRenderingMode(.alwaysOriginal)
            
            self.emotionButtons[i].setImage(image, for: .normal)
            self.emotionLabels[i].text = emotions[i].emotion + " \(emotions[i].count)"
            self.emotionLabels[i].font = .boldSystemFont(ofSize: 15)
            self.emotionLabels[i].textAlignment = .center
        }
    }
    
    private func resetButtonConfig() {
        var image: UIImage?
        
        if let randomEmotion = emotions.randomElement() {
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
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let tag = sender.tag
        if tag == 9 {
            for i in 0..<9 {
                self.emotions[i].count = 0
                self.emotionLabels[i].text = emotions[i].emotion + "\(emotions[i].count)"
            }
        } else {
            self.emotions[tag].count += 1
            self.emotionLabels[tag].text = emotions[tag].emotion + "\(emotions[tag].count)"
        }
    }
    
}

