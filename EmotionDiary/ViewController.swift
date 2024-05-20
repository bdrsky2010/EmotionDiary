//
//  ViewController.swift
//  EmotionDiary
//
//  Created by Minjae Kim on 5/17/24.
//

import UIKit

fileprivate struct Emotion {
    let emotion: String
    let imageName: String
    var count = 0
}

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    
    private var emotions: [Emotion] = [
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleBarConfig()
        buttonConfig()
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
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let tag = sender.tag
        self.emotions[tag].count += 1
        self.emotionLabels[tag].text = emotions[tag].emotion + "\(emotions[tag].count)"
    }
    
}

