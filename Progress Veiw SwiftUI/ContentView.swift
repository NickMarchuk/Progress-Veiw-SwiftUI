//
//  ContentView.swift
//  Progress Veiw SwiftUI
//
//  Created by Nick M on 12/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var condition = 0
    
    @State private var isWork = false

    var body: some View {
        
        HStack{
            
            VStack{
            
                ProgressView("Loading...", value: Float(condition), total: 100).padding()

                
                Button("RUN") {
                    
                    condition = 0
                    
                    isWork = true
                    
                    let timer = Timer(timeInterval: 0.1, repeats: true, block: { time in
                        
                        if condition < 100{

                            condition += 2
                            
                        }else{
                            
                            time.invalidate()
                            
                            isWork = false
                            
                        }
                    })
                    
                    RunLoop.main.add(timer, forMode: .common)
                    
                }.font(.largeTitle).foregroundColor(isWork ? .green : .orange)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
