//
//  CopepodsView.swift
//  BabyFishFeeds Watch App
//
//  Created by Bryan Ewing on 8/19/23.
//

import SwiftUI

struct CopepodsView: View {
    
    // Data
    var name: String = "Organism Name"
    var icon: String = "iconArtemia"
    var color: Color = Color.orange
    
    // Input
    @State private var organimsHave: String = ""
    @State private var organismsNeed: String = ""
    
    // Output
    @State private var litersOfCulture: String = ""
    
    // Given
    // how many copepods you need (copepods / ml)
    // how many copepods you have (copepods / ml
    
    // Calc
    // liters of culture
    // (need / have) * 1,000,000 = liters of culture
    
    
    // Vars
    @State public var show: Bool = false
    var cellWidth: CGFloat = 65
    var cellHeight: CGFloat = 35
    
    // Functions
    public func toggleVisibility () {
        show = !show
        calcLitersOfCulture()
    }
    
    func calcLitersOfCulture () {
        let need = Float(organismsNeed) ?? 0
        if need == 0 {
            litersOfCulture = "0.00"
            return
        }
        
        let have = Float(organimsHave) ?? 0
        if have == 0 {
            litersOfCulture = "0.00"
            return
        }
        
        litersOfCulture = String(format: "%.2f", (need / have) * 1000)
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
            
            if (show) {
                Spacer()
                Spacer()
                HStack {
                    Text("Copepod Density")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    TextField("Have", text: $organimsHave)
                        .onSubmit {
                            //calcOrganismsPerML()
                            calcLitersOfCulture()
                        }
                        .frame(width: cellWidth, alignment: .center)
                }
                .frame(height: cellHeight)
                
                Spacer()
                    .frame(height: cellHeight / 2)
                
                HStack {
                    Text("\(name) / ml\nRequired")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    TextField("Need", text: $organismsNeed)
                        .onSubmit {
                            calcLitersOfCulture()
                        }
                        .frame(width: cellWidth, alignment: .center)
                }
                .frame(height: cellHeight)
                
                Spacer()
                    .frame(height: cellHeight / 2.8)
                
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

struct CopepodsView_Previews: PreviewProvider {
    static var previews: some View {
        CopepodsView(name: "Copepods", icon: "iconCopepod", color: Color.brown)
    }
}
