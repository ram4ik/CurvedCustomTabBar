//
//  ContentView.swift
//  CurvedCustomTabBar
//
//  Created by Ramill Ibragimov on 10.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    
    var body: some View {
        VStack {
            ZStack {
                if self.index == 0 {
                    Color.red
                } else if self.index == 1 {
                    Color.orange
                } else if self.index == 2 {
                    Color.green
                } else if self.index == 3 {
                    Color.blue
                }
            }.edgesIgnoringSafeArea(.all)
            CustomTabs(index: self.$index)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabs: View {
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }) {
                Image(systemName: "house")
            }
            .font(.title)
            .foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.2))
            //.offset(y: -15)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }) {
                Image(systemName: "magnifyingglass")
            }
            .font(.title)
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.2))
            //.offset(y: -15)
            
            Spacer(minLength: 0)
            
            Button(action: {
                
            }) {
                ZStack {
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color.purple)
                        .offset(y: 4)
                    Image(systemName: "goforward.plus")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            .offset(y: -5)
            .shadow(radius: 5)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            }) {
                Image(systemName: "heart")
            }
            .font(.title)
            .foregroundColor(Color.black.opacity(self.index == 2 ? 1 : 0.2))
            //.offset(y: -15)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            }) {
                Image(systemName: "person")
            }
            .font(.title)
            .foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.2))
            //.offset(y: -15)
        }
        .padding(.horizontal, 35)
        .padding(.top, 10)
        .background(Color.white)
        //.clipShape(CShape())
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: -5, y: -10))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            path.addArc(center: CGPoint(x: rect.width, y: 0), radius: 60, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
        }
    }
}
