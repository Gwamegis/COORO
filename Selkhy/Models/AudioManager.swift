//
//  AudioManager.swift
//  Selkhy
//
//  Created by JeonJimin on 2023/08/20.
//

import SwiftUI
import AVFoundation

class AudioManager {
    static let instance = AudioManager()
    var player: AVAudioPlayer?
    
    func playSound(action: CookAction) {
        print(action.getThumbnailImageFimeName())
        guard let url = Bundle.main.url(forResource: action.getThumbnailImageFimeName(), withExtension: nil) else { return }
        print(url)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
        player?.play()
    }
    func playSoundAsset(assetName: String) {
        guard let audioData = NSDataAsset(name: assetName)?.data else {
            fatalError ("Unable to find asset \(assetName)")
        }
        do {
            player = try AVAudioPlayer(data: audioData)
            player?.play ()
        } catch {
            fatalError (error.localizedDescription)
            
        }
    }
    func stopSound() {
        player?.stop()
    }
}
