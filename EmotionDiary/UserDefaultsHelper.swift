//
//  UserDefaultsHelper.swift
//  EmotionDiary
//
//  Created by Minjae Kim on 5/30/24.
//

import Foundation

struct UserDefaultsHelper {
    var emotionList: [Emotion] {
        get {
            
            if let data = UserDefaults.standard.object(forKey: ViewController.emotionKey) as? Data {
                let decoder = JSONDecoder()
                if let emotionList = try? decoder.decode([Emotion].self, from: data) {
                    print("UserDefault 불러오기 완료")
                    return emotionList
                }
            }
            let emotionList = [
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
            
            return emotionList
        }
        
        set {
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: ViewController.emotionKey)
                print("UserDefault 저장 완료")
            } else {
                print("UserDefault 저장 실패")
            }
        }
    }
}
