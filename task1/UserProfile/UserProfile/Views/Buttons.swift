import SwiftUI

struct CustomButton: View {
    var title: String
//    var action: () -> Void
    var backgroundColor: Color = .blue
    var foregroundColor: Color = .white
    var cornerRadius: CGFloat = 12
    var padding: EdgeInsets = .init(top: 8, leading: 16, bottom: 8, trailing: 16)
    
    var body: some View {
            Text(title)
                .fontWeight(.semibold)
        .foregroundColor(foregroundColor)
        .padding(padding)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}
