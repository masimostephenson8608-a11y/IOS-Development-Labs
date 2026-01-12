//
//  CreateCardView.swift
//  BirthdayCards
//
//  Created by Masimo Stephenson on 1/9/26.
//

import SwiftUI
import PhotosUI

struct CreateCardView: View {
    @Environment(\.self) var environment
    @Environment(\.dismiss) var dismiss
    @Binding var cards: [Card]
    @State var viewModel = CreateCardViewModel()
    @State var selectedColor: Color = .black
    @State var selectedImage: Image?
    @State var selectedTextColor: Color = .gray
    @State var returnImage: UIImage?
        
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    ScrollView {
                        ZStack { //MARK: WHOLE CARD
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: geometry.size.width , height: geometry.size.height / 1.2)
                                .foregroundStyle(selectedColor)
                            VStack {
                                Text(viewModel.date.formatted(date: .abbreviated, time: .omitted))
                                    .font(.title.bold())
                                    .foregroundStyle(selectedTextColor)
                                if let selectedImage {
                                    selectedImage
                                        .resizable()
                                        .frame(width: geometry.size.width - 20, height: geometry.size.height / 2)
                                        .padding(.bottom, 35)
                                }
                                Text(viewModel.description)
                                    .font(.title2)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(selectedTextColor)
                            }
                        }
                        
                        PhotosPicker(selection: $viewModel.selectedPhoto, matching: .images) {
                            Text("Select photos")
                        }.padding(15)
                            .onChange(of: viewModel.selectedPhoto) {_, newValue in
                                handlePhotosChange(newValue)
                            }
                        
                        
                        Text("Create a birthday invitation")
                            .font(.largeTitle.bold())
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        Divider().padding(30)
                        
                        //MARK: COLOR PICKER
                        chooseColor.padding(25)
                        
                        Spacer().frame(height: geometry.size.height / 15)
                        
                        //MARK: DATE PICKER
                        Text("Selected Date:")
                            .font(.title)
                        DatePicker("Date", selection: $viewModel.date, in: Date.now..., displayedComponents: [.date]).labelsHidden()
                            .tint(.purple)
                        
                        Spacer().frame(height: geometry.size.height / 15)
                        
                        Text("Description:").font(.title)
                        TextField("Type Here", text: $viewModel.description)
                            .frame(width: .infinity)
                            .padding(15)
                            .onChange(of: viewModel.description) {
                                if viewModel.description.count > 100 {
                                    viewModel.description.removeLast()
                                }
                            }
                    }
                }
            }.ignoresSafeArea()
            .toolbar {
                Button("Save") {
                    SaveCard()
                }
            }
        }
    }
    
    var chooseColor: some View {
        VStack {
            Text("Background Color")
                .font(.title)
            ColorPicker("", selection: $selectedColor)
                .labelsHidden()
                .onChange(of: selectedColor) { _, newColor in
                    viewModel.backgroundColorRGB = Color.getRGB(color: selectedColor, environment: environment)
                }
            
            Spacer().frame(height: 15)
            
            Text("Text Color")
                .font(.title)
            ColorPicker("", selection: $selectedTextColor)
                .labelsHidden()
                .onChange(of: selectedColor) { _, newColor in
                    viewModel.textColor = Color.getRGB(color: selectedTextColor, environment: environment)
                }
//            Text(viewModel.backgroundColorRGB.map { String(format: "R: %.3f G: %.3f B: %.3f A: %.3f", $0.r, $0.g, $0.b, $0.opacity) } ?? "no color")
            
        }.background(RoundedRectangle(cornerRadius: 25)
            .frame(width: 350, height: 250)
            .foregroundStyle(.ultraThickMaterial))
    }
    
    func handlePhotosChange(_ newValue: PhotosPickerItem?) {
        Task {
            if let newValue {
                if let data = try? await newValue.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                    selectedImage = Image(uiImage: uiImage)
                    returnImage = uiImage
                }
            } else {
                selectedImage = nil
            }
        }
    }
    
    func SaveCard() {
        if let image = returnImage {
            let newCard: Card = Card(description: viewModel.description,
            date: viewModel.date,
            backgroundColorRGB: viewModel.backgroundColorRGB ?? nil,
            textColor: viewModel.textColor ?? nil,
            photo: image)
            cards.append(newCard)
            dismiss()
        }
    }
}
    
extension Color {
    static func getRGB(color: Color, environment: EnvironmentValues) -> RGBAColor {
        let resolved = color.resolve(in: environment)
        let redValue = resolved.red
        let greenValue = resolved.green
        let blueValue = resolved.blue
        let opacityValue = resolved.opacity
        return RGBAColor(r: redValue, g: greenValue, b: blueValue, opacity: opacityValue)
    }
}

