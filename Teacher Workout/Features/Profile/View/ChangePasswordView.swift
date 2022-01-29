import SwiftUI

struct ChangePasswordView: View {
    var primaryButtonAction: () -> Void
    var closeAction: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ProfileHeaderView(width: geometry.size.width)
                
                Spacer()
                
                Group {
                    Button(action: self.primaryButtonAction) {
                        Text(AppStrings.ChangePassword.ctaButtonTitle.localized())
                            .primaryButtonStyle()
                    }.padding(.bottom, 16)
                    
                    Button(action: self.closeAction) {
                        Text(AppStrings.cancel.localized())
                            .boldLargeFont(size: 15)
                            .foregroundColor(.red)
                            .padding(8)
                    }.padding(.bottom, 16)
                }.padding(.horizontal, 16)
            }
        }
        .navigationTitle(Text(AppStrings.ChangePassword.navigationTitle.localized()))
    }
}
