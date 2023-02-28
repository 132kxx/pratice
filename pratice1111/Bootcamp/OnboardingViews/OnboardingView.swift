//
//  OnboardingView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/28.
//

import SwiftUI



struct OnboardingView: View {
    
    // Onbaording States:
    /*
     0 - welcome screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    
    
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // Onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""

    //for the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomSection
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
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                        .transition(.move(edge: .bottom))
                    
                }
                
                // buttons
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

}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

// MARK: COMPONETS
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
                handleNextButtonPressed()
        }
    }
    
    private var welcomSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay {
                    Capsule(style: .continuous)
                        .frame(height: 3, alignment: .bottom)
                        .offset(y: 25)
                        .foregroundColor(.white)
                    
                    
                }
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using appsotrage and other swiftUI tech")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
            
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    

    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
           
            Text("what's your name.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            TextField("your name here...", text: $name)
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
        VStack(spacing: 20) {
            Spacer()
           
            Text("what's your age.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            
            Slider(value: $age, in: 18 ... 100, step: 1)
                .tint(.white)
            
           
            Spacer()
            Spacer()
            
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
           
            Text("what's your gender")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            Menu {
                Picker(selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Non-Binary").tag("Non-Binary")
                } label: {
                   EmptyView()
                }
            } label: {
                Text(gender.count > 1 ? gender : "what's your gender.")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.purple)
                    .background(Color.white)
                    .cornerRadius(10)
                
            }


           
            Spacer()
            Spacer()
            
        }
        .padding(30)
    }
}

// MARK: FUNCTIONS
extension OnboardingView {
    
    
    func handleNextButtonPressed(){
        
         //CHECK INPUTS
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "your name must be at 3 char")
                return
            }
            
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "please select a gender before moving forward")
                return
            }
        default:
            break
        }
        
        // GO TO NEXT SECTION
        if onboardingState == 3 {
            //sign in
            signIn()
            
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
       
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
