//
//  SettingsView.swift
//  BabyFishFeeds Watch App
//
//  Created by Bryan Ewing on 8/19/23.
//

import SwiftUI

struct SettingsView: View {
    
    // Data
    var name: String = "Settings"
    var icon: String = "iconSettings"
    var color: Color = Color.gray
    
    
    // Vars
    @State public var show: Bool = false
    var cellWidth: CGFloat = 150
    var cellHeight: CGFloat = 35
    
    // Properties
    @State public var poop: String = ""
    @State public var toggles = [false, false, false]
    
    
    
    // Functions
    public func toggleVisibility () {
        show = !show
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
                                .rotationEffect(.degrees(-45))
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
            
            if (show)
            {
                Toggle("Save Data", isOn: $toggles[0])
                    .frame(width: cellWidth, height: cellHeight)
                    .onSubmit {
                        // save()
                    }
                /*
                Spacer()
                    .frame(height: -10)
                
                Toggle("Toggle", isOn: $toggles[1])
                    .frame(width: cellWidth, height: cellHeight)
                    .onSubmit {
                        // do stuff
                    }
                
                Spacer()
                    .frame(height: -10)
                
                Toggle("Toggle", isOn: $toggles[2])
                    .frame(width: cellWidth, height: cellHeight)
                    .onSubmit {
                        // do stuff
                    }
                */
                Divider()
                
                // CREDITS
                Group {
                    Text("Created by Bryan Ewing")
                        .font(.caption2)
                    
                    Spacer()
                    
                    Label("Cuttlefish Games", systemImage: "c.circle")
                        .font(.caption2)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("2024")
                        .font(.caption2)
                }
                
                Spacer()
                Divider()
                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(name: "Settings", icon: "iconGear", color: Color.gray)
    }
}
