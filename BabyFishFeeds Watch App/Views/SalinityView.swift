//
//  SalinityView.swift
//  BabyFishFeeds Watch App
//
//  Created by Bryan Ewing on 8/19/23.
//

import SwiftUI

struct SalinityView: View {
    
    // Data
    var name: String = "Organism Name"
    var icon: String = "iconArtemia"
    var color: Color = Color.white
    
    // Input
    @State private var targetSalinity: String = ""
    @State private var currentSalinity: String = ""
    @State private var currentSalinityRotifers: String = ""
    @State private var litersHave: String = ""
    
    // Input for rotifers
    @State public var missingVolume: String = ""
    
    // Output for rotifers
    @State public var litersOfSaltWater: String = ""
    @State public var litersOfSaltWaterRotifers: String = ""
    @State public var litersOfFreshWaterRotifers: String = ""
    
    // Vars
    @State public var show: Bool = false
    @State public var rotifer: Bool = false
    var cellWidth: CGFloat = 65
    var cellHeight: CGFloat = 35
    
    
    
    
    
    // Functions
    public func toggleVisibility () {
        show = !show
    }
    
    func calcSaltNeeded () {
        if rotifer {
           calcRotifers()
        } else {
            let target: Float = Float(targetSalinity) ?? 0
            if target == 0 { return }
            
            let current: Float = Float(currentSalinity) ?? 0
            if current == 0 { return }
            
            let have: Float = Float(litersHave) ?? 0
            if have == 0 { return }
            
            let salt = ((target - current) * have) / 1000
            
            litersOfSaltWater = "\(String(format: "%.2f", salt)) L"
        }
    }
    
    func calcRotifers () {
        let salinity: Float = Float(currentSalinityRotifers) ?? 0
        if salinity == 0 { return }
        
        let volume: Float = Float(missingVolume) ?? 0
        if volume == 0 { return }
        
        let salt = (volume * 20) / salinity
        let fresh = salt / volume
        
        litersOfSaltWaterRotifers = "\(String(format: "%.2f", salt)) L"
        litersOfFreshWaterRotifers = "\(String(format: "%.2f", fresh)) L"
    }
    
    
    init (name: String, icon: String, color: Color) {
        self.name = name
        self.icon = icon
        self.color = color
    }
     
    
    var body: some View {
        VStack {
            Button (action: {
                toggleVisibility()
            }) {
                HStack {
                    Spacer()
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 30, height: 30)
                        .overlay(
                            Image(icon)
                                .resizable()
                                .renderingMode(.original)
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .rotationEffect(.degrees(0))
                                .colorMultiply(color)
                        )
                    
                    Spacer()
                    
                    Text(name)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .tint(color)
            
            if (show) {
                Group {
                    Spacer()
                    Spacer()
                    
                    HStack {
                        Text("Rotifers")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        Toggle("", isOn: $rotifer)
                        
                        Spacer()
                            .frame(width: 16)
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                if rotifer
                {
                    HStack {
                        Text("Missing Volume")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        TextField("  vol", text: $missingVolume)
                            .onSubmit {
                                calcSaltNeeded()
                            }
                            .frame(width: cellWidth, alignment: .center)
                    }
                    .frame(height: cellHeight)
                    
                    Spacer()
                        .frame(height: 17)
                    
                    HStack {
                        Text("Current Salinity")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        TextField("  ppt", text: $currentSalinityRotifers)
                            .onSubmit {
                                calcSaltNeeded()
                            }
                            .frame(width: cellWidth, alignment: .center)
                    }
                    .frame(height: cellHeight)
                    
                    Spacer()
                        .frame(height: 12)
                    
                    HStack {
                        Text("Salt Water")
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(color)
                        
                        Spacer()
                        
                        Text("\(litersOfSaltWaterRotifers)")
                            .frame(width: cellWidth, height: cellHeight)
                            .foregroundColor(color)
                            //.border(.green).opacity(0.5)
                            .addBorder(color, width: 1, cornerRadius: 10)
                            .font(.title3)
                    }
                    .frame(height: cellHeight)
                    
                    Spacer()
                        .frame(height: 5)
                    
                    HStack {
                        Text("Fresh Water")
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(color)
                        
                        Spacer()
                        
                        Text("\(litersOfFreshWaterRotifers)")
                            .frame(width: cellWidth, height: cellHeight)
                            .foregroundColor(color)
                            //.border(.green).opacity(0.5)
                            .addBorder(color, width: 1, cornerRadius: 10)
                            .font(.title3)
                    }
                    .frame(height: cellHeight)
                }
                else
                {
                    HStack {
                        Text("Target Salinity")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        TextField("  ppt", text: $targetSalinity)
                            .onSubmit {
                                calcSaltNeeded()
                            }
                            .frame(width: cellWidth, alignment: .center)
                    }
                    .frame(height: cellHeight)
                    
                    Spacer()
                        .frame(height: 16)
                    
                    HStack {
                        Text("Current Salinity")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        TextField("  ppt", text: $currentSalinity)
                            .onSubmit {
                                calcSaltNeeded()
                            }
                            .frame(width: cellWidth, alignment: .center)
                    }
                    .frame(height: cellHeight)
                    
                    Spacer()
                        .frame(height: 16)
                    
                    HStack {
                        Text("Liters Have")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        TextField("  ppt", text: $litersHave)
                            .onSubmit {
                                calcSaltNeeded()
                            }
                            .frame(width: cellWidth, alignment: .center)
                    }
                    .frame(height: cellHeight)
                    
                    Spacer()
                        .frame(height: 16)
                        
                    HStack {
                        Text("Liters of Salt")
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(color)
                        
                        Spacer()
                        
                        Text("\(litersOfSaltWater)")
                            .frame(width: cellWidth, height: cellHeight)
                            .foregroundColor(color)
                            //.border(.green).opacity(0.5)
                            .addBorder(color, width: 1, cornerRadius: 10)
                            .font(.title2)
                    }
                    .frame(height: cellHeight)
                    
                }
                
                
                
            
                
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
            }
        }
    }
}

struct SalinityView_Previews: PreviewProvider {
    static var previews: some View {
        SalinityView(name: "Salinity", icon: "iconSalinity", color: Color.cyan)
    }
}
