
//  PDFKitView.swift
//  DocAssist
//
//  Created by Masimo Stephenson on 3/3/26.



import SwiftUI
import PDFKit
import UIKit

struct PDFKitView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        // Configure the PDFView here, e.g., set autoScales
        pdfView.autoScales = true
        if let document = PDFDocument(url: url) {
            pdfView.document = document
        }
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // Update the view if necessary (e.g., if the URL changes)
        if let document = PDFDocument(url: url) {
            uiView.document = document
        }
    }
}
