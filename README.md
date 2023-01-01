# 🦁롤링페이퍼

앱스쿨 수료가 2달정도 남았을 때 '서로가 서로에게 기억되고 추억될만한 앱은 무엇일까?' 생각하던 중 학생 때 주고받던 롤링페이퍼를 앱으로 만들어보면 좋겠다는 취지로 시작된 프로젝트 입니다.

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

## 🕒제작기간

2022.12.12 ~ 2022.12.16 (5일)

## 🛠사용기술 및 환경
- Swift
- SwiftUI
- Firebase
- MVVM

## 🧐주요기능

#### 1. 롤링페이퍼의 묘미인 형식이 갖춰지지 않은 자유분방함을 살리고자 하였습니다.
#### 가운데 줄을 제외한 사이드의 글자들이 짤리지 않을 정도 글자수를 제한하였고 회전을 주어 자유분방함을 표현하였습니다.
```swift
LazyVGrid(columns: columns, spacing: 30) {
    ForEach(Array(rollingStore.rollingPapers.enumerated()), id:\.offset){ idx,replies in
        if idx % 3 == 0 && replies.message.count < 30{
            Text(replies.message)
                .rotationEffect(.degrees(Double.random(in:-25...0)))
                .font(.custom("UhBee mysen", size: 20))
                .frame(height:130)
        }
        //2분단
        else if idx % 3 == 1 && replies.message.count < 30{
            Text(replies.message)
                .rotationEffect(.degrees(Double.random(in:-25...25)))
                .font(.custom("UhBee mysen", size: 20))
                .frame(height:130)
        }
        //3분단
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

#### 2. 코드를 보다 보기쉽게 함수화 하였습니다.
#### 길어지는코드, 반복될 가능성이 있는 코드를 따로 분류하여 수정 및 가독성이 용이해졌습니다.
```swift
NavigationLink(destination: WriteMessageView(item: item, team: team)) {                               
    NavigationLinklabel(item: item)
}

func NavigationLinklabel(item: Member) -> some View {
    VStack {
        //asset에 편지지 이미지의 이름을 컬러로 구성
        //컬러이름을 string으로 반환하여 사용
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
            .alert("추가하기", isPresented: $presentAlert, actions: {
                TextField("",text: $teamTextField)
                
                Button("취소",role: .cancel,action: {
                })
                Button("추가", action: {
                    let createTeam = Team(id: UUID().uuidString, team: teamTextField)
                    rollingStore.addTeam(team: createTeam)
                    teamTextField = ""
                })
            }, message: {
                Text("추가 할 이름을 적어주세요")
            })
        }
    }
}
```

## 마치며

추후 앱 출시를 할 수 있다면 여러방면으로 넓히고 싶습니다. 실제 초,중,고등학교에서 학교 앱을 만들어 반 별로 접근이 가능한 롤링페이퍼 앱을 만들어 배포해볼 수 있고 군대 마음의 편지함을 작성하는 부대 내 제한적인 앱 등 여러 방면으로 활용 할 수 있을 것 같습니다.

## 🌟참여자
| 📎김태형<br/>[@yahoth](https://github.com/yahoth)<br/> | 📎김민호<br/> [@stealmh](https://github.com/stealmh)<br/> | 📎김영서<br/>[@yngddo](https://github.com/suekim999)<br/> |
| :----------------------------------------------------------: | :---------------------------------------------: | :-------------------------------------------------: |
|<img src="https://github.com/yahoth.png?size=200" width=200> | <img src="https://avatars.githubusercontent.com/u/66459715?v=4" width=200>  | <img src="https://github.com/yngddo.png?size=200" width=200> |
