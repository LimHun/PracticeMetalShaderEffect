//
//  ContentView.swift
//  PracticeMetalShaderEffect
//
//  Created by 임훈 on 2023/06/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pixellateImage: CGFloat = 1
    @State private var pixellateText: CGFloat = 1
    
    @State private var speed: CGFloat = 1
    @State private var amplitude: CGFloat = 5
    @State private var frequency: CGFloat = 15
    
    let startDate: Date = .init()
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    PixellateView()
                        .navigationTitle("Pixellate")
                } label: {
                    Text("Pixellate")
                }
                NavigationLink {
                    WavesView()
                        .navigationTitle("Waves")
                } label: {
                    Text("Waves")
                }
                
                NavigationLink {
                    TextWavesView()
                        .navigationTitle("TextWavesView")
                } label: {
                    Text("TextWavesView")
                }
            }
            
        }
    }
    
    @ViewBuilder
    func PixellateView() -> some View {
        VStack {
            Group {
                Image(.xcode)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .distortionEffect(
                        .init(
                            function: .init(library: .default, name: "pixellate"),
                            arguments: [.float(pixellateImage)]
                        ),
                        maxSampleOffset: .zero)
                
                Slider(value: $pixellateImage, in: 1...30)
            }
            
            Group {
                Text("쉐이더 연습하기")
                    .font(.system(size: 50))
                    .bold()
                    .distortionEffect(
                        .init(
                            function: .init(library: .default, name: "pixellate"),
                            arguments: [.float(pixellateText)]
                        ),
                        maxSampleOffset: .zero)
                
                Slider(value: $pixellateText, in: 1...30)
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func WavesView() -> some View {
        List {
            TimelineView(.animation) {
                let time = $0.date.timeIntervalSince1970 - startDate.timeIntervalSince1970
                Image(.xcode)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .distortionEffect(
                        .init(
                            function: .init(library: .default, name: "wave"),
                            arguments: [
                                .float(time),
                                .float(speed),
                                .float(frequency),
                                .float(amplitude)
                            ]
                        ),
                        maxSampleOffset: .zero)
            }
            
            Section("Speed") {
                Slider(value: $speed, in: 1...15)
            }
            
            Section("Frequency") {
                Slider(value: $frequency, in: 1...50)
            }
            
            Section("Amplitude") {
                Slider(value: $amplitude, in: 1...35)
            }
        }
    }
    
    @ViewBuilder
    func TextWavesView() -> some View {
        List {
            TimelineView(.animation) {
                let time = $0.date.timeIntervalSince1970 - startDate.timeIntervalSince1970
                Text("쉐이더 연습하기")
                    .font(.system(size: 30))
                    .bold()
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .distortionEffect(
                        .init(
                            function: .init(library: .default, name: "wave"),
                            arguments: [
                                .float(time),
                                .float(speed),
                                .float(frequency),
                                .float(amplitude)
                            ]
                        ),
                        maxSampleOffset: .zero)
            }
            
            Section("Speed") {
                Slider(value: $speed, in: 1...15)
            }
            
            Section("Frequency") {
                Slider(value: $frequency, in: 1...50)
            }
            
            Section("Amplitude") {
                Slider(value: $amplitude, in: 1...35)
            }
        }
    }
}

#Preview {
    ContentView()
}
