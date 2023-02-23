//
//  Settings.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 22.02.2023.
//

import SwiftUI
import StoreKit
import MessageUI

struct Settings: View {
    @Environment(\.requestReview) var requestReview
    @State var test:Bool = false
    @State private var sendEmail = false
    let constants = Constants.shared
    
    var body: some View {
        VStack {
            VStack() {
                Form{
                    
                    Section(header: Text("Premium Account")) {
                       NavigationLink("Remove Ads", destination: PremiumPage())
                        .padding(2)
                    }
                    
                    Section(header: Text("Application")) {
                        VStack(alignment: .leading){
                            Text("Rate This App")
                            Text("If you like our app you can give 5 star to us").font(Font.custom("System", size: 10))
                        }.onTapGesture {
                            requestReview()
                        }.padding(2)
                    }
                    
                    /*Section(header: Text("Support")) {
                        VStack(alignment: .leading){
                            Text("Send Feedback")
                            Text("Send us your comments and suggestions").font(Font.custom("System", size: 10))
                        }.padding(2).onTapGesture {
                               
                        }
                        VStack{
                                    if MFMailComposeViewController.canSendMail(){
                                        Button {
                                            sendEmail.toggle()
                                        } label: {
                                            Text(constants.sendButtonText)
                                        }
                                    } else {
                                        Text(constants.noSupportText)
                                            .multilineTextAlignment(.center)
                                    }
                                }
                                .sheet(isPresented: $sendEmail) {
                                    MailView(content: constants.contentPreText, to: constants.email,subject: constants.subject)
                                }
                        
                        VStack(alignment: .leading){
                            Text("Report Problem / Bug")
                            Text("Let us know for improve ourself").font(Font.custom("System", size: 10))
                        }.padding(2)
                    }
                    // Add your Views here
                     */
                }
            }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            )
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
