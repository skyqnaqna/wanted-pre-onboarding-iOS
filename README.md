# wanted-pre-onboarding-iOS

## 날씨 정보 APP

### 제약 사항
- 외부 라이브러리 사용 불가
  - Alamofire, Moya, Kingfisher 등 통신 관련 라이브러리도 사용 불가
  - SnapKit 사용 불가
- 모든 화면은 오토레이아웃을 사용하여 레이아웃
  - UIKit 기반으로 UI를 구현하며, SwiftUI는 사용할 수 없습니다.
- Open Weather의 API를 활용
  - [Weather API - OpenWeatherMap](https://openweathermap.org/api)
<br /><br /><br />
  
## 앱 디자인 (Figma)
<img width="735" alt="Screen Shot 2022-09-14 at 16 42 01" src="https://user-images.githubusercontent.com/31722496/190092386-93713b59-e58e-4b9c-a8e9-436ad8c01614.png">

<br /><br />
## 앱 실행 및 첫 번째 화면
[MainViewController.swift](https://github.com/skyqnaqna/wanted-pre-onboarding-iOS/blob/main/Weatherman/Weatherman/Controllers/MainViewController.swift)

<img src="https://user-images.githubusercontent.com/31722496/190091364-ab865e49-35fc-4f9a-963f-a2920b56ba6e.gif" width="250"/>

- 뷰가 처음 로드되면 WeatherManager에서 API Request를 날려 날씨 정보를 Fetch -> Update 합니다.
- CollectionView를 사용하여 각 도시 정보를 2열로 표현했습니다.
- MVC 패턴을 적용했습니다.

![mainVC](https://user-images.githubusercontent.com/31722496/190095596-a3ce9ea6-59bb-4694-a5f5-dc63d269f0b9.png)

<br /><br />
## 두 번째 화면
[DetailWeatherViewController.swift](https://github.com/skyqnaqna/wanted-pre-onboarding-iOS/blob/main/Weatherman/Weatherman/Controllers/DetailWeatherViewController.swift)


<img src="https://user-images.githubusercontent.com/31722496/190091625-bae10b55-dd21-4b23-96ee-2f25f7433c55.gif" width="250"/>

- 메인에서 선택한 도시의 상세 날씨 정보를 StackView를 사용하여 표현했습니다.
- 날씨 아이콘 이미지는 NSCache를 사용하여 캐싱했습니다.

![detailVC](https://user-images.githubusercontent.com/31722496/190095705-f8441020-22bf-4844-8f7f-87f87504cb62.png)

<br /><br />
## 날씨 새로고침
<img src="https://user-images.githubusercontent.com/31722496/190091636-03cc6ffe-c49d-4cf2-a34e-3ee95639e710.gif" width="250"/>

- RefreshControl을 사용하여 pull to refresh 기능을 구현했습니다.
- Refresh가 시작되면 기존 날씨 데이터를 지우고 WeatherManager에서 새로운 날씨 정보를 받아옵니다.

<br /><br />
## 이슈
### CollectionView Cell 내부 뷰가 중첩되는 현상

![issue1](https://user-images.githubusercontent.com/31722496/190101216-5683df74-8ae2-45a5-af8a-0a5e5f4b35e3.png)

- 원인은 [WeatherCollectionViewCell.swift](https://github.com/skyqnaqna/wanted-pre-onboarding-iOS/blob/main/Weatherman/Weatherman/Views/Cells/WeatherCollectionViewCell.swift)에 있는 `initViews()` 함수였습니다.
- 이 함수는 셀을 구성하는 뷰들을 생성하고 오토레이아웃을 적용하는 함수입니다.
- 그래서 셀이 재활용될 때마다 이 함수가 수행되면 뷰들이 계속 생성되기 때문에 중첩되는 것이었습니다.
- 따라서 셀이 처음 초기화될 때만 실행하도록 하여 해결했습니다.
<br />

### 날씨 데이터 업데이트 시 에러
- WeatherManager에서 가져온 날씨 정보를 추가하고 `collectionView.reloadData()`로 반영할 때 
`This application is modifying the autolayout engine from a background thread after the engine was accessed from the main thread. This can lead to engine corruption and weird crashes.` 라는 에러가 발생했습니다.
- UI를 Update할 때 메인 스레드에 넣지 않아 발생한 에러로 `DispatchQueue.main.async{ }`안에 넣어 해결했습니다.
  - [참고한 글](https://stackoverflow.com/questions/28302019/getting-a-this-application-is-modifying-the-autolayout-engine-from-a-background)
