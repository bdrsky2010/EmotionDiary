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
}

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var happyButton: UIButton! // 행복해
    @IBOutlet weak var loveButton: UIButton! // 사랑해
    @IBOutlet weak var likeButton: UIButton! // 좋아해
    @IBOutlet weak var flusterButton: UIButton! // 당황해
    @IBOutlet weak var upsetButton: UIButton! // 속상해
    @IBOutlet weak var depressedButton: UIButton! // 우울해
    @IBOutlet weak var boringButton: UIButton! // 지루해
    @IBOutlet weak var sleepyButton: UIButton! // 졸려
    @IBOutlet weak var jadedButton: UIButton! // 무덤덤해
    
    @IBOutlet weak var happyLabel: UILabel! // 행복해
    @IBOutlet weak var loveLabel: UILabel! // 사랑해
    @IBOutlet weak var likeLabel: UILabel! // 좋아해
    @IBOutlet weak var flusterLabel: UILabel! // 당황해
    @IBOutlet weak var upsetLabel: UILabel! // 속상해
    @IBOutlet weak var depressedLabel: UILabel! // 우울해
    @IBOutlet weak var boringLabel: UILabel! // 지루해
    @IBOutlet weak var sleepyLabel: UILabel! // 졸려
    @IBOutlet weak var jadedLabel: UILabel! // 무덤덤해
    
    private var emotionCount: [String: Int] = [
        "행복해": 0, "사랑해": 0, "좋아해": 0, "당황해": 0, "속상해": 0, "우울해": 0, "지루해": 0, "졸려": 0, "무덤덤해": 0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        let emotions: [Emotion] = [
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
        
        emotions.enumerated().forEach {
            let index = $0.offset
            let emotion = $0.element.emotion
            let image = UIImage(named: $0.element.imageName)?.withRenderingMode(.alwaysOriginal)
            let fontSize: CGFloat = 15
            
            if index == 0 {
                happyButtonConfig(emotion: emotion, image: image, fontSize: fontSize)
            } else if index == 1 {
                loveButtonConfig(emotion: emotion, image: image, fontSize: fontSize)
            } else if index == 2 {
                likeButtonConfig(emotion: emotion, image: image, fontSize: fontSize)
            } else if index == 3 {
                flusterButtonConfig(emotion: emotion, image: image, fontSize: fontSize)
            } else if index == 4 {
                upsetButtonConfig(emotion: emotion, image: image, fontSize: fontSize)
            } else if index == 5 {
                depressedButtonConfig(emotion: emotion, image: image, fontSize: fontSize)
            } else if index == 6 {
                boringButtonConfig(emotion: emotion, image: image, fontSize: fontSize)
            } else if index == 7 {
                sleepyButtonConfig(emotion: emotion, image: image, fontSize: fontSize)
            } else if index == 8 {
                jadedButtonConfig(emotion: emotion, image: image, fontSize: fontSize)
            }
        }
    }
    
    private func happyButtonConfig(emotion: String, image: UIImage?, fontSize: CGFloat) {
        self.happyButton.setImage(image, for: .normal)
        self.happyButton.setTitle(emotion, for: .normal)
        self.happyLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        self.happyLabel.font = .boldSystemFont(ofSize: fontSize)
        self.happyLabel.textAlignment = .center
    }
    
    private func loveButtonConfig(emotion: String, image: UIImage?, fontSize: CGFloat) {
        self.loveButton.setImage(image, for: .normal)
        self.loveButton.setTitle(emotion, for: .normal)
        self.loveLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        self.loveLabel.font = .boldSystemFont(ofSize: fontSize)
        self.loveLabel.textAlignment = .center
    }
    
    private func likeButtonConfig(emotion: String, image: UIImage?, fontSize: CGFloat) {
        self.likeButton.setImage(image, for: .normal)
        self.likeButton.setTitle(emotion, for: .normal)
        self.likeLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        self.likeLabel.font = .boldSystemFont(ofSize: fontSize)
        self.likeLabel.textAlignment = .center
    }
    
    private func flusterButtonConfig(emotion: String, image: UIImage?, fontSize: CGFloat) {
        self.flusterButton.setImage(image, for: .normal)
        self.flusterButton.setTitle(emotion, for: .normal)
        self.flusterLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        self.flusterLabel.font = .boldSystemFont(ofSize: fontSize)
        self.flusterLabel.textAlignment = .center
    }
    
    private func upsetButtonConfig(emotion: String, image: UIImage?, fontSize: CGFloat) {
        self.upsetButton.setImage(image, for: .normal)
        self.upsetButton.setTitle(emotion, for: .normal)
        self.upsetLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        self.upsetLabel.font = .boldSystemFont(ofSize: fontSize)
        self.upsetLabel.textAlignment = .center
    }
    
    private func depressedButtonConfig(emotion: String, image: UIImage?, fontSize: CGFloat) {
        self.depressedButton.setImage(image, for: .normal)
        self.depressedButton.setTitle(emotion, for: .normal)
        self.depressedLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        self.depressedLabel.font = .boldSystemFont(ofSize: fontSize)
        self.depressedLabel.textAlignment = .center
    }
    
    private func boringButtonConfig(emotion: String, image: UIImage?, fontSize: CGFloat) {
        self.boringButton.setImage(image, for: .normal)
        self.boringButton.setTitle(emotion, for: .normal)
        self.boringLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        self.boringLabel.font = .boldSystemFont(ofSize: fontSize)
        self.boringLabel.textAlignment = .center
    }
    
    private func sleepyButtonConfig(emotion: String, image: UIImage?, fontSize: CGFloat) {
        self.sleepyButton.setImage(image, for: .normal)
        self.sleepyButton.setTitle(emotion, for: .normal)
        self.sleepyLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        self.sleepyLabel.font = .boldSystemFont(ofSize: fontSize)
        self.sleepyLabel.textAlignment = .center
    }
    
    private func jadedButtonConfig(emotion: String, image: UIImage?, fontSize: CGFloat) {
        self.jadedButton.setImage(image, for: .normal)
        self.jadedButton.setTitle(emotion, for: .normal)
        self.jadedLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        self.jadedLabel.font = .boldSystemFont(ofSize: fontSize)
        self.jadedLabel.textAlignment = .center
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let emotion = sender.titleLabel?.text else { return }
        
        self.emotionCount[emotion] = (emotionCount[emotion] ?? 0) + 1
        
        if emotion == "행복해" {
            self.happyLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        } else if emotion == "사랑해" {
            self.loveLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        } else if emotion == "좋아해" {
            self.likeLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        } else if emotion == "당황해" {
            self.flusterLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        } else if emotion == "속상해" {
            self.upsetLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        } else if emotion == "우울해" {
            self.depressedLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        } else if emotion == "지루해" {
            self.boringLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        } else if emotion == "졸려" {
            self.sleepyLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        } else if emotion == "무덤덤해" {
            self.jadedLabel.text = emotion + " \(emotionCount[emotion] ?? 0)"
        }
    }
    
}

