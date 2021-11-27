import SwiftUI

enum CustomAlertType {
    case normal
    case danger
}

struct CustomAlertView: View {
    var alertImage: String = ""

    var alertTitle: String
    var alertDescription: String = ""

    var primaryButtonTitle: String
    var type: CustomAlertType = .normal
    var primaryButtonAction: () -> Void
    var closeAction: () -> Void

    var body: some View {
        VStack {
            VStack(spacing: 32) {
                ZStack {
                    Circle()
                        .fill(type == .danger ? Color.red : Color.accent)
                        .frame(width: 56, height: 56)
                    Image(systemName: type == .danger ? "exclamationmark.triangle.fill" : alertImage)
                        .padding(10)
                        .font(Font.system(size: 30))
                        .foregroundColor(.white)
                }

                VStack(spacing: 0) {
                    Text(alertTitle)
                        .boldLargeFont(size: 20)
                        .multilineTextAlignment(.center)

                    if alertDescription != "" {
                        Text(alertDescription)
                            .semiBoldSmallFont(size: 16)
                            .multilineTextAlignment(.center)
                            .padding(.top, 16)
                    }
                }

                Group {
                    Button(action: self.primaryButtonAction) {
                        if type == .danger {
                            Text(primaryButtonTitle)
                                .dangerButtonStyle()
                        } else {
                            Text(primaryButtonTitle)
                                .primaryButtonStyle()
                        }
                    }
                    Button(action: self.closeAction) {
                        Text(AppStrings.cancel.localized())
                            .boldLargeFont(size: 15)
                            .foregroundColor(type == .danger ? Color.accent : Color.red)
                            .padding(8)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(32)
            .background(Color.white)
            .cornerRadius(16)
        }
        .padding(32)
    }
}
