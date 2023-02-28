






import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .orange], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            if currentUserSignedIn {
                ProfileView()
            } else {
                OnboardingView()
            }

          
        }
    }
    
    
}


struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
