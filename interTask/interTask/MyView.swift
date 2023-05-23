//
//  MyView.swift
//  interTask
//
//  Created by Natalia Wcislo on 22.05.23.
//

import SwiftUI

struct MyView: View {
    @State private var isSharePresented: Bool = false
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Button("Share app") {
            self.isSharePresented = true
        }
        .sheet(isPresented: $isSharePresented, onDismiss: {
            print("Dismiss")
        }, content: {
            ActivityViewController(activityItems: ["data"])
        })
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}

struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    ///create the instance of the view controller to be used in your SwiftUI screen
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        print("load sheet")
        return controller
    }
    
    
    ///View controller must be redrawn/updated
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {
    print("done sheet")
    }

}
