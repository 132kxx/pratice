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
    
    @State var transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    // onboarding
    @State var onboardingState: Int = 0
    @State var username: String = ""
    @State var userage: Double = 30
    @State var usergender: String = ""
    
    // for the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
   // app storage
    @AppStorage("username") var currentUserName: String?
    @AppStorage("userage") var currentUserAge: Int?
    @AppStorage("usergender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
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
        .alert(isPresented: $showAlert) {
            return Alert(title: Text(alertTitle))
        }
    }
}






//MARK: COMPONENT
extension OnboardingView {
    
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "Sign Up" : onboardingState == 3 ? "Finish" : "Next")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .animation(nil, value: onboardingState)
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
                        .foregroundColor(.white)
                    
                }
            
            Text("In this video we will review a lot of what we have learned so far in the SwiftUI Bootcamp. We will create a fake user onboarding experience in which a user can sign up, add their name, age, gender, and then log in to our application.")
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
        // CHECK INPUTS
        switch onboardingState {
        case 1:
            guard username.count >= 3 else {
                showAlert(title: "3글자 이상 입력해주세요")
                return
            }
        case 3:
            guard usergender.count > 1 else {
                showAlert(title: "have to select gender")
                return
            }
        default:
            break
        }
        
        // Go To Next
        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = username
        currentUserAge = Int(userage)
        currentUserGender = usergender
        
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = "title"
        showAlert.toggle()
    }
    
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
