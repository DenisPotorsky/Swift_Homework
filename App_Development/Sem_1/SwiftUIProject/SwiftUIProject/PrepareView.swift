//
//  PrepareView.swift
//  SwiftUIProject
//
//  Created by Den on 22.08.2023.
//

import SwiftUI

struct PrepareView: View {
    
    var body: some View {
        NavigationStack {
                NavigationLink
                ("Перейти к новостям", destination: ContentView())
            }
        }
    }

struct NewsViews_Previews:
    PreviewProvider {
    static var previews: some View {
        PrepareView()
    }
}
