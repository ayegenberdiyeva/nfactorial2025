import SwiftUI

struct CharacterView: View {
    @StateObject var ViewModel = CharacterViewModel()
    @State var isMale = true
    @State var isCardPresented = false
    @State var selectedCharacter: CharacterResponse.Character?
    
    var body: some View {
        VStack {
            if ViewModel.isLoading {
                ProgressView()
            } else if let errorDescription = ViewModel.errorDescription{
                Text(errorDescription)
            } else {
                if ViewModel.characters.isEmpty {
                    Text("No Characters Found")
                } else {
                    List (ViewModel.characters) { character in
                        Button(action: {
                            selectedCharacter = character
                            isCardPresented = true
                            print("Tapped")
                        }){
                            ZStack () {
    //                            Button(action: {
    //                                isCardPresented.toggle()
    //                                selectedCharacter = character
    //                                print("tapped")
    //                            }) {
    //                                Color.clear
    //                            }
    //                            .buttonStyle(PlainButtonStyle())
    //                            .sheet(isPresented: $isCardPresented) {
    //                                CardView(character: selectedCharacter)
    //                            }
                                
                                if character.species == "Human" {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(AppColor.humanBackground)
                                } else if character.species == "Alien" {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(AppColor.alienBackground)
                                }
                                
                                VStack {
                                    Spacer()
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(AppColor.secondaryBg)
                                        .frame(maxHeight: 70)
                                }
                                
                                HStack {
                                    AsyncImage(url: URL(string: character.image)) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                        } else {
                                            Circle()
                                                .fill(AppColor.secondaryBg)
                                                .frame(width: 100, height: 100)
                                        }
                                    }
                                    
                                    VStack(alignment: .leading){
                                        Spacer().frame(height: 30)
                                        
                                        Text(character.name)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        
                                        HStack {
                                            if (character.status == "Alive") {
                                                Image(systemName: "heart.fill")
                                            } else {
                                                Image(systemName: "heart.slash")
                                            }
                                        
                                            if (character.species == "Human") {
                                                Image(systemName: "person.fill")
                                                    .foregroundStyle(character.gender == "Male" ? .blue : .pink)
                                            } else {
                                                Image(systemName: "person.slash.fill")
                                                    .foregroundStyle(character.gender == "Male" ? .blue : .pink)
                                            }
                                            
                                            Text(character.type)
                                                .font(.caption)
                                        }
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $isCardPresented) {
                                if let selectedCharacter {
                                    CardView(character: selectedCharacter)
                                }
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
        }
        .task {
            Task {
                await ViewModel.fetchCharacters()
            }
        }
    }
}



#Preview {
    CharacterView()
}
