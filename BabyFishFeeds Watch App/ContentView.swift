//
//  ContentView.swift
//  BabyFishFeeds Watch App
//
//  Created by Bryan Ewing on 8/19/23.
//

import SwiftUI

struct ContentView: View {
    
    public func nothing () { }
        
    
    var body: some View {
        NavigationStack {
            ScrollView {
                //Label("Baby Fish Feeds", systemImage: "fish")
                //    .foregroundColor(.cyan)
                
                Divider()
                
                Spacer()
                
                Group {
                    RotifersView(name: "Rotifers", icon: "iconRotifer", color: Color.green)
                    NHArtemiaView(name: "NH Artemia", icon: "iconArtemia", color: Color.orange)
                    AlgaeView(name: "Algae", icon: "iconAlgae", color: Color.green)
                    CopepodsView(name: "Copepods", icon: "iconCopepod", color: Color.brown)
                    ENRArtemiaView(name: "ENR Artemia", icon: "iconArtemia", color: Color.orange)
                    SalinityView(name: "Salinity", icon: "iconSalinity", color: Color.cyan)
                    SettingsView(name: "Settings", icon: "iconGear", color: Color.gray)
                }
            }
            .navigationBarTitle("Baby Fish Feeds")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Image(systemName: "fish")
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
     public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
         let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
         return clipShape(roundedRect)
              .overlay(roundedRect.strokeBorder(content, lineWidth: width))
     }
}
