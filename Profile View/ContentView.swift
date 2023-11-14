//
//  ContentView.swift
//  Profile View
//
//  Created by Mohd Wasif Raza on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                VStack {
                    TriangularCurvedImageView()
                    Text("Andrew Smith")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer().frame(maxHeight: 50)
                    HStack {
                        VStack{
                            TextView(title: "Height", subtitle: "5' 11")
                            Spacer().frame(maxHeight: 20)
                            TextView(title: "SMM", subtitle: "73")
                        }
                        Spacer().frame(maxWidth: 50)
                        VStack{
                            TextView(title: "Weight", subtitle: "200 lbs")
                            Spacer().frame(maxHeight: 20)
                            TextView(title: "Body Fat", subtitle: "20%")
                        }
                    }
                    
                    ZStackSubView()
                        .padding(.horizontal)
                        .offset(y:30)
                }
                //
            }
            Spacer(minLength: 50)
            ScrollView {
                CalenderView()
                CellView(title: "Activation")
                CellView(title: "Build")
                CellView(title: "Energy")
                CellView(title: "Skill")
                CellView(title: "Regen")
                CellView(title: "Fuel")
            }
            
        }.background(Color (UIColor.systemGroupedBackground))
        
    }
}

struct ZStackSubView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Phase").bold()
                    .foregroundStyle(.black)
                Text("5")      
                    .padding(.horizontal)
                    .foregroundStyle(.gray)
            }
            Spacer()
            VStack {
                Text("Type").bold()
                    .foregroundStyle(.black)
                Text("Lateral")
                    .padding(.horizontal)
                    .foregroundStyle(.gray)
            }
            Spacer()
            VStack {
                Text("Phase").bold()
                    .foregroundStyle(.black)
                Text("5")
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
            }
            
            
        }
        .padding()
        .background(Color (UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical,5)
        .shadow(radius: 5)
    }
}

struct TextView: View {
    let title: String
    let subtitle: String
    var body: some View {
        VStack {
            Text(subtitle).bold()
                .foregroundStyle(.white)
            Text(title)
                .bold()
                .padding(.horizontal)
                .background(.gray)
                .cornerRadius(15)
            
        }
    }
}

struct CalenderView: View {
    var body: some View {
        VStack (alignment: .center) {
            HStack {
                Text ("<")
                    .padding(.horizontal, 8)
                    .background(Color(hex: "#F3F3F3"))
                    .cornerRadius(15)
                Spacer()
                Text ("June 1, 2023").font(.title3).bold()
                Spacer()
                Text (">")
                    .padding(.horizontal, 8)
                    .background(Color(hex: "#F3F3F3"))
                    .cornerRadius(15)
            }
        }
        .padding()
        .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray, lineWidth: 1) // Adjust color and lineWidth as needed
                        .background(Color(UIColor.secondarySystemGroupedBackground))
                )
        .cornerRadius(16)
        .padding(.horizontal)
        
        
    }
}


struct CellView: View {
    let title: String
    @State private var isTapped = false
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text (title).font(.title3).bold()
                
                Spacer()
                Text (">")
            }
        }
        .padding()
        .background(isTapped ? Color(hex: "#CE9634") : Color (UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical,5)
        .onTapGesture {
            isTapped.toggle()
        }
        
        
    }
}

struct TriangularCurvedImageView: View {
    var body: some View {
        Image("face")
            .resizable()
            .frame(width: 200, height: 200)
            .scaledToFill()
            .frame(width: 125, height: 120)
            .clipShape(TriangularCurveShape())
            .overlay(TriangularCurveShape().stroke(Color(hex: "#CE9634"), lineWidth: 10))
            .shadow(radius: 5)
    }
}

struct TriangularCurveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(
            to: CGPoint(x: width, y: 0),
            control: CGPoint(x: width * 0.5, y: -(width * 0.25))
        )
        path.addQuadCurve(
            to: CGPoint(x: width / 2, y: height),
            control: CGPoint(x: width, y: height * 0.7)
        )
        path.addQuadCurve(
            to: CGPoint(x: 0, y: -4),
            control: CGPoint(x:0, y: height * 0.65)
            
        )
        return path
    }
}


extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    ContentView()
}
