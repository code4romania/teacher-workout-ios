import SwiftUI

struct ProfileHeaderView: View {
    var width: CGFloat
    var imageWidthRatio: CGFloat = 0.25

    var body: some View {
        VStack(alignment: .center) {
            Image("profile_image")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: width * imageWidthRatio)
                .clipShape(Circle())
                .padding(.top, 21)
            Text("1834 XP")
                .largeBoldText()
                .padding(.top, 15)
        }
        .frame(width: width)
    }
}
