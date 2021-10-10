//
//  FloatingMenu.swift
//  FloatingButton
//
//  Created by Sopnil Sohan on 10/10/21.
//

import SwiftUI

struct FloatingMenu: View {
    
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    
    var body: some View {
        VStack {
            Spacer()
            if showMenuItem1 {
                MenuItem(icon: "camera.fill")
            }
            if showMenuItem2 {
                MenuItem(icon: "photo.on.rectangle")
            }
            if showMenuItem3{
                MenuItem(icon: "mic.slash.fill")
            }
            
            
            Button(action: {
                self.showMenu()
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(red: 153/255, green: 102/255, blue: 255/255))
                .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
            }
        }
    }
    func showMenu() {
        withAnimation {
            showMenuItem3.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                self.showMenuItem2.toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                self.showMenuItem1.toggle()
            }
        }
    }
}

struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu()
    }
}

struct MenuItem: View {
    
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 153/255, green: 102/255, blue: 255/255))
                .frame(width: 55, height: 55)
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(.white)
        }
        .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
        .transition(.move(edge: .trailing))
    }
}
