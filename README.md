# π¦ λ‘€λ§νμ΄νΌ

μ±μ€μΏ¨ μλ£κ° 2λ¬μ λ λ¨μμ λ 'μλ‘κ° μλ‘μκ² κΈ°μ΅λκ³  μΆμ΅λ λ§ν μ±μ λ¬΄μμΌκΉ?' μκ°νλ μ€ νμ λ μ£Όκ³ λ°λ λ‘€λ§νμ΄νΌλ₯Ό μ±μΌλ‘ λ§λ€μ΄λ³΄λ©΄ μ’κ² λ€λ μ·¨μ§λ‘ μμλ νλ‘μ νΈ μλλ€.
<table>
  <tr>
    <td>
      <img alt="" src="https://user-images.githubusercontent.com/66459715/210161392-7bd082b4-6429-43cd-8543-8e7636fdb0ef.png" width="400">
    </td>
    <td>
      <img alt="" src="https://user-images.githubusercontent.com/66459715/210161395-5dcedf47-ab5b-4d1f-ac7d-deada8683dae.png" width="400">
    </td>
    <td>
      <img alt="" src="https://user-images.githubusercontent.com/66459715/210161398-3ecd6c02-344c-482d-b8e2-9aaeecdbdd87.png" width="400">
    </td>
        <td>
      <img alt="" src="https://user-images.githubusercontent.com/66459715/210161400-1f5edcdd-89e9-4f27-b007-e74860820b68.png" width="400">
    </td>
        <td>
      <img alt="" src="https://user-images.githubusercontent.com/66459715/210161402-017d9f01-f056-4ca5-ae29-74ae80c5d0c3.png" width="400">
    </td>
  </tr>
</table>

## π§ μ£ΌμκΈ°λ₯

#### 1. λ‘€λ§νμ΄νΌμ λ¬λ―ΈμΈ νμμ΄ κ°μΆ°μ§μ§ μμ μμ λΆλ°©ν¨μ μ΄λ¦¬κ³ μ νμμ΅λλ€.
#### κ°μ΄λ° μ€μ μ μΈν μ¬μ΄λμ κΈμλ€μ΄ μ§€λ¦¬μ§ μμ μ λ κΈμμλ₯Ό μ ννμκ³  νμ μ μ£Όμ΄ μμ λΆλ°©ν¨μ νννμμ΅λλ€.
```swift
LazyVGrid(columns: columns, spacing: 30) {
    ForEach(Array(rollingStore.rollingPapers.enumerated()), id:\.offset){ idx,replies in
        if idx % 3 == 0 && replies.message.count < 30{
            Text(replies.message)
                .rotationEffect(.degrees(Double.random(in:-25...0)))
                .font(.custom("UhBee mysen", size: 20))
                .frame(height:130)
        }
        //2λΆλ¨
        else if idx % 3 == 1 && replies.message.count < 30{
            Text(replies.message)
                .rotationEffect(.degrees(Double.random(in:-25...25)))
                .font(.custom("UhBee mysen", size: 20))
                .frame(height:130)
        }
        //3λΆλ¨
        else if idx % 3 == 2 && replies.message.count < 30{
            Text(replies.message)
                .rotationEffect(.degrees(Double.random(in:0...25)))
                .font(.custom("UhBee mysen", size: 20))
                .frame(height:130)
        }
        else {
            Text(replies.message)
                .font(.custom("UhBee mysen", size: 20))
                .frame(height:130)
        }
    }
}
```

#### 2. μ½λλ₯Ό λ³΄λ€ λ³΄κΈ°μ½κ² ν¨μν νμμ΅λλ€.
#### κΈΈμ΄μ§λμ½λ, λ°λ³΅λ  κ°λ₯μ±μ΄ μλ μ½λλ₯Ό λ°λ‘ λΆλ₯νμ¬ μμ  λ° κ°λμ±μ΄ μ©μ΄ν΄μ‘μ΅λλ€.
```swift
NavigationLink(destination: WriteMessageView(item: item, team: team)) {                               
    NavigationLinklabel(item: item)
}

func NavigationLinklabel(item: Member) -> some View {
    VStack {
        //assetμ νΈμ§μ§ μ΄λ―Έμ§μ μ΄λ¦μ μ»¬λ¬λ‘ κ΅¬μ±
        //μ»¬λ¬μ΄λ¦μ stringμΌλ‘ λ°ννμ¬ μ¬μ©
        Image(item.color.1)
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text("\(item.name)")
            .font(.custom("UhBee mysen", size: 25))
            .foregroundColor(.black)
            .lineSpacing(5)
    }
}
```
```swift
Form {
    ForEach(rollingStore.teams) {item in
        ...
}  
.toolbar { MakeTeamToolbar() }

struct MakeTeamToolbar: ToolbarContent {
    @EnvironmentObject var rollingStore: RollingStore
    @State private var presentAlert = false
    @State private var teamTextField = ""
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button("add") {
                presentAlert = true
            }
            .alert("μΆκ°νκΈ°", isPresented: $presentAlert, actions: {
                TextField("",text: $teamTextField)
                
                Button("μ·¨μ",role: .cancel,action: {
                })
                Button("μΆκ°", action: {
                    let createTeam = Team(id: UUID().uuidString, team: teamTextField)
                    rollingStore.addTeam(team: createTeam)
                    teamTextField = ""
                })
            }, message: {
                Text("μΆκ° ν  μ΄λ¦μ μ μ΄μ£ΌμΈμ")
            })
        }
    }
}
```

## π μ¬μ©κΈ°μ  λ° νκ²½
- Swift
- SwiftUI
- Firebase
- MVVM

## π μ μκΈ°κ°

2022.12.12 ~ 2022.12.16 (5μΌ)

## π» λ§μΉλ©°

μΆν μ± μΆμλ₯Ό ν  μ μλ€λ©΄ μ¬λ¬λ°©λ©΄μΌλ‘ λνκ³  μΆμ΅λλ€. μ€μ  μ΄,μ€,κ³ λ±νκ΅μμ νκ΅ μ±μ λ§λ€μ΄ λ° λ³λ‘ μ κ·Όμ΄ κ°λ₯ν λ‘€λ§νμ΄νΌ μ±μ λ§λ€μ΄ λ°°ν¬ν΄λ³Ό μ μκ³  κ΅°λ λ§μμ νΈμ§ν¨μ μμ±νλ λΆλ λ΄ μ νμ μΈ μ± λ± μ¬λ¬ λ°©λ©΄μΌλ‘ νμ© ν  μ μμ κ² κ°μ΅λλ€.

## π μ°Έμ¬μ
| πκΉνν<br/>[@yahoth](https://github.com/yahoth)<br/> | πκΉλ―ΌνΈ<br/> [@stealmh](https://github.com/stealmh)<br/> | πκΉμμ<br/>[@yngddo](https://github.com/yngddo)<br/> |
| :----------------------------------------------------------: | :---------------------------------------------: | :-------------------------------------------------: |
|<img src="https://github.com/yahoth.png?size=200" width=200> | <img src="https://avatars.githubusercontent.com/u/66459715?v=4" width=200>  | <img src="https://github.com/yngddo.png?size=200" width=200> |
