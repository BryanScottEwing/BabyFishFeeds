//
//  AlgaeView.swift
//  BabyFishFeeds Watch App
//
//  Created by Bryan Ewing on 8/19/23.
//

import SwiftUI

struct AlgaeView: View {
    
    // Data
    var name: String = "Organism Name"
    var icon: String = "iconArtemia"
    var color: Color = Color.white
    
    // Input
    @State private var organismCount: String = ""
    @State private var feedRequirement: String = ""
    
    // Output
    @State private var organismPerML: Int = 0
    @State private var litersOfCulture: String = ""
    
    // Vars
    @State public var show: Bool = false
    var cellWidth: CGFloat = 65
    var cellHeight: CGFloat = 35
    
    // Functions
    public func toggleVisibility () {
        show = !show
        calcOrganismsPerML()
        calcLitersOfCulture()
    }
    
    func calcOrganismsPerML () {
        if let number: Int = Int(organismCount) {
            organismPerML = number * 20
        } else {
            organismPerML = 0
        }
    }
    
    func calcLitersOfCulture () {
        if var number: Float = Float(feedRequirement) {
            number = number * 1000000
            number /= Float(organismPerML)
            number /= 1000
            litersOfCulture = String(format: "%.2f", number)
        } else {
            litersOfCulture = "0.00"
        }
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
                Spacer()
                Spacer()
                HStack {
                    Text("Avg Count")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    TextField("  Avg", text: $organismCount)
                        .onSubmit {
                            calcOrganismsPerML()
                            calcLitersOfCulture()
                        }
                        .frame(width: cellWidth, alignment: .center)
                }
                .frame(height: cellHeight)
                
                HStack {
                    Text("\(name) / ml")
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Text("\(organismPerML)")
                        .frame(width: cellWidth)
                }
                .frame(height: cellHeight)
                
                HStack {
                    Text("Feed Requirement")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    TextField(" Feed", text: $feedRequirement)
                        .onSubmit {
                            calcLitersOfCulture()
                        }
                        .frame(width: cellWidth)
                }
                .frame(height: cellHeight)
                
            Spacer()
                .frame(height: 10)
                
                HStack {
                    Text("Liters of Culture")
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(color)
                    
                    Spacer()
                    
                    Text("\(litersOfCulture)")
                        .frame(width: cellWidth, height: cellHeight)
                        .foregroundColor(color)
                        //.border(.green).opacity(0.5)
                        .addBorder(color, width: 1, cornerRadius: 10)
                        .font(.title2)
                }
                .frame(height: cellHeight)
                
                Spacer()
                Divider()
                Spacer()
            }
        }
    }
}

struct AlgaeView_Previews: PreviewProvider {
    static var previews: some View {
        AlgaeView(name: "Algae", icon: "iconAlgae", color: Color.green)
    }
}
