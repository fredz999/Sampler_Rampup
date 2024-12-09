//
//  Persist_Layer.swift
//  Sampler_Rampup
//
//  Created by Jonathan Brown on 06/12/2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class DataItem: Identifiable {
    var id: UUID
    var name: String
    init(nameParam: String) {
        id = UUID()
        name = nameParam
    }
}
