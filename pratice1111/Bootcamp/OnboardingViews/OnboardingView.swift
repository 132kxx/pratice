//
//  OnboardingView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/28.
//

import SwiftUI

struct OnboardingView: View {
    
    //onboading states:
    /*
     0 - welcome screen
     1 - username view
     2 - select age view
     3 - select gender view
     */
    
    
    @State var onboardingState: Int = 0
    @State var username: String = ""
    @State var userage: Double = 30
    @State var usergender: String = ""
    
    @State var transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    var body: some View {
        ZStack {
            
            //content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                    
                case 1:
                    addNameSection
                        .transition(transition)
                    
                case 2:
                    addAgeSection
                        .transition(transition)
                    
                case 3:
                    addGenderSection
                        .transition(transition)
                    
                default :
                    RoundedRectangle(cornerRadius: 20)
                }
            }
            
            //buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)


        }
    }
}






//MARK: COMPONENT
extension OnboardingView {
    
    private var bottomButton: some View {
        Text("sign in")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                signUpButton()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            
            Text("Find your match")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay {
                    Capsule(style: .continuous)
                        .frame(height: 3, alignment: .bottom)
                        .offset(y: 15)
                    
                }
            
            Text("asfjkash jkvzxjvklsdj flaksjd kvlzjxcvklx jv zjlkfjs adlkvjzx vasfjkash jkvzxjvklsdj flaksjd kvlzjxcvklx jv zjlkfjs adlkvjzx vkl jasfjkash jkvzxjvklsdj flaksjd kvlzjxcvklx jv zjlkfjs adlkvjzx vkl jkl j")
                .fontWeight(.medium)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("what's your name?")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            
           TextField("이름을 입력해주세요", text: $username)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("what's your age?")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            Text(String(format: "%.0f", userage))
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            
            Slider(value: $userage, in: 18 ... 99, step: 1)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("what's your gender?")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            Menu {
                Picker(selection: $usergender) {
                    Text("male").tag("male")
                    Text("female").tag("female")
                    Text("nonbi").tag("nonbi")
                } label: {
                    EmptyView()
                }


            } label: {
                Text(usergender.count > 1 ? usergender : "Select a gender")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
   
}

// MARK: FUNCTION
extension OnboardingView {
    func signUpButton() {
        withAnimation(.spring()) {
            onboardingState += 1
        }
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
