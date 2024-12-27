//
//  numberPad.swift
//  BabyFishFeeds Watch App
//
//  Created by Bryan Ewing on 8/24/23.
//

import SwiftUI

struct numberPad: View {
    
    @State private var output: String = ""
    
    
    
    var buttonWidth: CGFloat = 40
    var buttonHeight: CGFloat = 40
    var buttonCornerRadius: CGFloat = 10
    
    @State var show = true
    
    func input (_ number: String) {
        if output.count > 3 { return }
        output = "\(output)\(number)"
    }
    
    func submit () {
        show = false
    }
    
    func backspace () {
        output = String(output.dropLast(1))
    }
    
    
    
    var body: some View {
        if show {
            VStack {
                
                Label("\(output)", systemImage: "circle")
                    .labelStyle(.titleOnly)
                    .font(.title2)
                    .frame(height: buttonHeight)
                
                HStack {
                    // numbers and decimal
                    VStack {
                        HStack {
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label("9", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("9")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                            
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label("8", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("8")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                            
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label("7", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("7")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                        }
                        HStack {
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label("6", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("6")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                            
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label("5", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("5")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                            
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label("4", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("4")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                        }
                        HStack {
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label("3", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("3")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                            
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label("2", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("2")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                            
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label("1", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("1")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                        }
                        HStack {
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth * 2, height: buttonHeight)
                                .overlay(
                                    Label("0", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input("0")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                            
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .fill(.quaternary)
                                .frame(width: buttonWidth, height: buttonHeight)
                                .overlay(
                                    Label(".", systemImage: "circle")
                                        .labelStyle(.titleOnly)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            input(".")
                                        }
                                        .frame(width: buttonWidth, height: buttonHeight)
                                )
                        }
                    }
                    
                    // backspace and OK
                    VStack {
                        RoundedRectangle(cornerRadius: buttonCornerRadius)
                            .fill(.quaternary)
                            .frame(width: buttonWidth, height: buttonHeight)
                            .overlay(
                                Label("<", systemImage: "delete.left.fill")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        backspace()
                                    }
                                    .frame(width: buttonWidth, height: buttonHeight)
                            )
                        
                        Spacer()
                            .frame(height: 55)
                        
                        RoundedRectangle(cornerRadius: buttonCornerRadius)
                            .fill(.green)
                            .frame(width: buttonWidth, height: buttonHeight * 2)
                            .overlay(
                                Label("OK", systemImage: "circle.fill")
                                    .labelStyle(.titleOnly)
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        submit()
                                    }
                                    .frame(width: buttonWidth, height: buttonHeight)
                            )
                    }
                }
            }
        }
    }
}

struct numberPad_Previews: PreviewProvider {
    static var previews: some View {
        numberPad()
    }
}
