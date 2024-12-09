//
//  ContentView.swift
//  Sampler_Rampup
//
//  Created by Jonathan Brown on 03/12/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext)private var context
    @Query private var dataItems: [DataItem]
    var conductor = Conductor()
    var coreUI = Core_UI.shared
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle().foregroundColor(coreUI.darkBlueIsh)
            ZStack{
                  SampleLadder(coreUI: coreUI, conductor: conductor)
            }.offset(x:50,y:50)
        }
    }
}

struct SampleLadder : View {
    var coreUI : Core_UI
    var conductor : Conductor
    var body: some View {
        return ZStack{
            VStack{
                Current_Bank(conductor: conductor, coreUI: coreUI)
                Tone_Btn(selectedColor: coreUI.brightOrange, noteNum: 60, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.brightOrange, noteNum: 61, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.brightOrange, noteNum: 62, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.brightOrange, noteNum: 63, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.brightOrange, noteNum: 64, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.brightOrange, noteNum: 65, conductor: conductor)
                
                Tone_Btn(selectedColor: coreUI.lime, noteNum: 66, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.lime, noteNum: 67, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.lime, noteNum: 68, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.lime, noteNum: 69, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.lime, noteNum: 70, conductor: conductor)
                Tone_Btn(selectedColor: coreUI.lime, noteNum: 71, conductor: conductor)
                
                Bank_Rack(selectedColor: .yellow, conductor: conductor)
            }
        }
    }
}


struct Tone_Btn : View {
    
    var selectedColor : Color
    var noteNum : Int
    var conductor : Conductor
    var coreUI = Core_UI.shared
    var body: some View {
        return ZStack{
            Button(action:{
                conductor.play(noteNum: UInt8(noteNum))
            }){
                ZStack{
                    Rectangle().frame(width: 100,height: 30).foregroundColor(.black)
                    Text("TONE").foregroundColor(selectedColor)
                }
            }
        }
    }
}

struct Bank_Rack : View {
    
    var selectedColor : Color
    var conductor : Conductor
    var coreUI = Core_UI.shared
    var body: some View {
        return ZStack{
            HStack{
                
                Button(action:{
                    conductor.currentSoundFont = .bank0
                    conductor.loadSF()
                }){
                    ZStack{
                        Rectangle().frame(width: 150,height: 30).foregroundColor(.black)
                        Text("Bank_0").foregroundColor(selectedColor)
                    }
                }
                
                Button(action:{
                    conductor.currentSoundFont = .bank1
                    conductor.loadSF()
                }){
                    ZStack{
                        Rectangle().frame(width: 150,height: 30).foregroundColor(.black)
                        Text("Bank_1").foregroundColor(selectedColor)
                    }
                }
                
            }
        }
    }
}

struct Current_Bank : View {
    @ObservedObject var conductor : Conductor
    var coreUI = Core_UI.shared
    var body: some View {
        return ZStack{
            Rectangle().frame(width: 220,height: 30).foregroundColor(.black)
            Text(conductor.currentTitle ).foregroundColor(.gray)
        }
    }
}
