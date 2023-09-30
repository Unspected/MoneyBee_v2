import SwiftUI
import UIKit

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            if !viewModel.isEditProfile {
                headerProfileView()
                DefaultLabel(
                    label: "Name",
                    labelValue: viewModel.firstName + " " + viewModel.lastName)
                DefaultLabel(label: "Email", labelValue: viewModel.email)
                DefaultLabel(label: "Phone", labelValue: viewModel.phone)
            } else {
                editTextField(textValue: $viewModel.firstName, trackText: viewModel.firstName.isEmpty, placeHolder: "First Name")
                
            }
        }
        .padding()
        .foregroundColor(Color(.whiteColor))
        .background(Color(.tabBarColor))
    }
    
    @ViewBuilder
    private func headerProfileView() -> some View {
        HStack {
            Image(systemName: "info.circle")
            Text("Personal Info")
            Spacer()
            Button(action:
                    { viewModel.isEditProfile.toggle() },
                   label: {
                Image(systemName: "square.and.pencil")
            })
        }
        .padding()
    }
    
    @ViewBuilder
    private func DefaultLabel(label: String, labelValue: String) -> some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            Text(labelValue)
                .font(.subheadline)
        }
        .padding()
    }
    
    @ViewBuilder
    private func editTextField(textValue: Binding<String>,
                               trackText: Bool,
                               placeHolder: String) -> some View {
        HStack {
            TextField("", text: textValue)
                .placeholder(
                    when: trackText,
                    placholder: {
                        Text(placeHolder).foregroundColor(Color(UIColor.whiteColor))
                    })
            underLine()
        }
    }
    
    @ViewBuilder
    private func underLine() -> some View {
        Divider()
            .padding(.bottom, 1)
            .background(Color.white)
    }
    
}

#Preview {
    ProfileView().environmentObject(ProfileViewModel(
        profile:
           ProfileModel(
            firstName: "Pavel",
            lastName: "Andreev",
            email: "pavel@gmail.com",
            phone:  "209-922-2138")))
}
