//
//  CreateRecipeView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/20.
//

import SwiftUI
import AVFoundation


struct CreateRecipeView: View {
    
    @State var items: [Cook] = [Cook(), Cook()]
    @State var currentIndex = 0
    @State var isShowIngredientSelection: Bool = false
    @State var menu: Menu?
    @State var selectedIngredientsEnglishNames: [String] = []
    @State var isShowCookActionSelection: Bool = false
    @State var isShowTimeSelection: Bool = false
    @State private var isAnimating = false
    
    let spacing: CGFloat  = 10
    let itemWidth: CGFloat = 290
    let itemHeight: CGFloat = 208
    
    private let audioManager = AudioManager.instance
    
    init() {
            _menu = State(initialValue: Menu(
                name: "",  // 초기 값을 적절히 설정하십시오.
                numberOfOrder: 0,
                creater: "",
                likes: 0,
                story: "",
                recipe: Recipe(ingredients: [], amount: [], price: 0, produce: []),
                review: [],
                image: Image("default")
            ))
        }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            ZStack(alignment: .bottom) {
                Image("Pot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 240)
                ZStack {
                    ForEach(selectedIngredientsEnglishNames, id: \.self) { imageName in
                        ForEach(1 ..< 8, id: \.self) { num in
                            AnimatedImage(id: num, imageName: imageName)
                        }
                    }
                }
                Image("PotFront")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 240)
                
                if items[currentIndex].action != nil {
                    Image("Fire")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 195)
                        .padding(.bottom, -15)
                        .offset(y: isAnimating ? -5 : 5)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                isAnimating = true
                            }
                        }
                }
            }
            .padding(.bottom, -50)
            .onChange(of: items[currentIndex].action) { newValue in
                print(newValue)
                if let action = newValue {
                    audioManager.playSoundAsset(assetName: action.getThumbnailImageFimeName())
                } else {
                    audioManager.stopSound()
                }
            }
            
            Carousel(items: $items,
                     currentIndex: $currentIndex,
                     spacing: spacing,
                     itemWidth: itemWidth,
                     itemHeight: itemHeight,
                     opacity: 0,
                     sizeScale: 0.1) { item in
                CarouselItemView(index: currentIndex + 1,
                                 item: item,
                                 isShowIngredientSelection: $isShowIngredientSelection,
                                 isShowCookActionSelection: $isShowCookActionSelection,
                                 isShowTimeSelection: $isShowTimeSelection
                )
                .fullScreenCover(isPresented: $isShowIngredientSelection) {
                        IngredientSelectionView(isShowIngredientSelection: $isShowIngredientSelection, menu: $menu, currentIndex: $currentIndex, selectedEnglishNames: $selectedIngredientsEnglishNames, cook: $items[currentIndex])
                    }
                .fullScreenCover(isPresented: $isShowCookActionSelection) {
                    SelectedCookActionView(isShowCookActionSelection: $isShowCookActionSelection, cook: $items[currentIndex])
                }
                .fullScreenCover(isPresented: $isShowTimeSelection) {
                    TimerView(isShowTimer: $isShowTimeSelection, cook: $items[currentIndex])
                }
            }
                     .padding(.bottom, 50)
            
            Spacer()
            
            NavigationLink {
                RegisterRecipeView(menu: menu)
            } label: {
                Text("완료")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.Point)
                    )
                    .padding([.horizontal, .bottom], 20)
            }
        }
        .background(Color.Background)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .navigationTitle("레시피 등록")
    }
}

struct CreateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipeView()
    }
}

struct AnimatedImage: View {
    let id: Int
    let imageName: String
    
    @State private var offset: CGFloat = -UIScreen.main.bounds.height / 2 + 25
    @State private var rotation: Double = 0.0
    let randomX: CGFloat
    let randomDuration: Double
    
    init(id: Int, imageName: String) {
        self.id = id
        self.imageName = imageName
        self.randomX = CGFloat.random(in: -UIScreen.main.bounds.width/5...UIScreen.main.bounds.width/5)
        self.randomDuration = Double.random(in: 0.5...1.5)
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 50, height: 50)
            .rotationEffect(Angle(degrees: rotation))
            .offset(x: randomX, y: offset)
            .onAppear() {
                withAnimation(Animation.easeIn(duration: randomDuration)) {
                    offset = -30
                    rotation = 360.0
                }
            }
    }
}
