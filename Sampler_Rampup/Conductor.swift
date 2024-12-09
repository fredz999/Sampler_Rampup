//
//  Conductor.swift
//  Sampler_Rampup
//
//  Created by Jonathan Brown on 03/12/2024.
//

import AudioKit
import Foundation
import SwiftUI
import AVFoundation

class Conductor : ObservableObject{
    var sampler : AppleSampler
    var engine : AudioEngine
    @Published var currentSoundFont : E__SoundFont = .bank0
    @Published var currentTitle : String = ""
    init(){
        sampler = AppleSampler()
        engine = AudioEngine()
        engine.output = sampler

        do {
            try engine.start()
        } catch {
            print("error starting engine")
        }
        
        loadSF()
    }
    
    func loadSF(){
        if currentSoundFont == .bank0{
            if let genURL = Bundle.main.url(forResource: "bank0", withExtension: "sf2"){
                do{
                    try sampler.loadInstrument(at:genURL)
                    currentTitle = "current soundfont is bank0"
                }catch{
                    currentTitle = "couldnt load bank0"
                }
            }
            else{
                currentTitle = "couldnt locate bank0"
            }
            
        }
        else if currentSoundFont == .bank1{
            
            if let genUrl = Bundle.main.url(forResource:"bank1",withExtension:"sf2"){
                do{
                    try sampler.loadInstrument(at:genUrl)
                    currentTitle = "current soundfont is bank1"
                }catch{
                    currentTitle = "couldnt load bank1"
                }
            }
            else{
                currentTitle = "couldnt locate bank1"
            }
            
        }
    }
    
    func play(noteNum:UInt8){
        sampler.play(noteNumber: noteNum, velocity: 80)
    }
    
}

enum E__SoundFont : String{
    case bank0 = "bank0"
    case bank1 = "bank1"
}
