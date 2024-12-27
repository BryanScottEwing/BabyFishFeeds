//
//  NHArtemiaView.swift
//  BabyFishFeeds Watch App
//
//  Created by Bryan Ewing on 8/19/23.
//

import SwiftUI

struct NHArtemiaView: View {
    
    // Data
    var name: String = "NH Artemia"
    var icon: String = "iconArtemia"
    var color: Color = Color.orange
    
    // Input
    @State private var artemiaCount: String = ""
    @State private var litersInBucket: String = ""
    
    // Output
    @State private var artemiaInBucket: Float = 0.0
    @State private var litersOfArtemia: String = ""
    
    // Vars
    @State public var show: Bool = false
    var cellWidth: CGFloat = 65
    var cellHeight: CGFloat = 35
    
    
    // input
    // given: armtemia count per 2 ml (ac/2 = ac per 1 ml)
    // given: liters in bucket
    
    // calc
    // ac per 1 ml x liters in bucket = total artemia count in bucket (round up to whole number)
    // artemia in bucket / 300 (target artemia per ml)
    // output = 2.6 Liters
    
    
    // Functions
    public func toggleVisibility () {
        show = !show
        calcOrganismsPerML()
    }
    
    func calcOrganismsPerML () {
        artemiaInBucket = Float(artemiaCount) ?? 0
        if artemiaInBucket == 0 {
            litersOfArtemia = "0.00"
            return
        }
        
        let bucket: Float = Float(litersInBucket) ?? 0
        if bucket == 0 {
            litersOfArtemia = "0.00"
            return
        }
        
        litersOfArtemia = String(format: "%.2f", ((artemiaInBucket / 2) * bucket) / 300)
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
                    Text("Artemia Count")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    TextField("Count", text: $artemiaCount)
                        .onSubmit {
                            calcOrganismsPerML()
                        }
                        .frame(width: cellWidth, alignment: .center)
                }
                .frame(height: cellHeight)
                
                Spacer()
                    .frame(height: cellHeight / 2.5)
                
                HStack {
                    Text("Liters In Bucket")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    TextField("Liters", text: $litersInBucket)
                        .onSubmit {
                            calcOrganismsPerML()
                        }
                        .frame(width: cellWidth)
                }
                .frame(height: cellHeight)
                
            Spacer()
                .frame(height: 10)
                
                HStack {
                    Text("Liters of Artemia")
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(color)
                    
                    Spacer()
                    
                    Text("\(litersOfArtemia)")
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

struct RNHArtemiaView_Previews: PreviewProvider {
    static var previews: some View {
        NHArtemiaView(name: "NH Artemia", icon: "iconArtemia", color: Color.orange)
    }
}
