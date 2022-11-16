
import SwiftUI

struct ContentView: View {

    
    @State private var link: String = ""
    @State private var hor: String = ""
    @State private var min: String = ""
    @State private var sec: String = ""
    
    @State private var ihor: Int = 0
    @State private var imin: Int = 0
    @State private var isec: Int = 0
    
    @State private var flink: String = ""
    @State private var msg: String = ""
    
   
     
    var body: some View {
        
        
        ZStack {
            
            Color.white
            
            VStack{
                
                Spacer()
                
                //Link and timestamp variables views and storage
                TextField("Paste link here:", text: $link)
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack{
                    TextField("Hour:", text: $hor)
                        .padding(.horizontal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Minute:", text: $min)
                        .padding(.horizontal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Second:", text: $sec)
                        .padding(.horizontal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                
                
                Spacer()
                
                Button(action: {
                    
                    //Calculating timestamp
                    ihor = Int(hor) ?? 0
                    imin = Int(min) ?? 0
                    isec = Int(sec) ?? 0
                    
                    ihor = ihor * 60 * 60
                    imin = imin * 60
                    
                    flink = link + "&t=" + String(ihor + imin + isec)
                    
                    //Sending generated link to clipboard
                    UIPasteboard.general.string = flink
                    msg = "Generated timestamp, \(flink) has been copied to your clipboard!"
                    
                }, label: {Text("COPY TIMESTAMP")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .padding()
                    .border(Color.black, width: 0.1)
                    .cornerRadius(40)
                    .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1))
                })
                
                
                //Showing generated link and alerting user that it is in clipboard
                Text(msg)
                    .foregroundColor(Color.black)
                    .padding()
                
                
                
                Spacer()
                
            }
            
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}
