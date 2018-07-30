# Sample Swift ContainerView
> UIViewController 하위에 Container View를 이용하여 Controller를 작동(연결) 할 수 있습니다.  <br />
그것을 스토리보드를 이용해서 스크롤뷰 안에 들어가는 뷰들을 Container View로 넣어서 셈플링한 소스 입니다.

## 주요 설명
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/sample-ios-timer/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.1-orange.svg?style=flat)](https://swift.org) 
- 스크롤뷰 안의 스크롤뷰의 내부 컨텐츠를 담는 뷰를 크게 만들고 그 안에 페이지 단위 View 들 안에 Container View 를 담았습니다.
- 현재의 뷰 안에 컨트롤러를 연결 시킨 것과 다른 스토리보드의 파일을 링크 시킨 두가지 경우로 셈플링 하였습니다.

## 스토리보드 이미지
<img width="739" height="499" src="/Image/image_storyboard_00.png"></img>

## 실행 이미지 (GIF)
<img width="268" height="480" src="/Image/resultForImage.gif"></img>

## 결과
- Main.storyboard : 여기에 구성했습니다.
- Other.storyboard : 오른쪽의 두번째 Container View에 들어갈 RightViewController가 들어있습니다.
- ViewController.swift : 가로 길이가 디바이스에 따라 변하게 하였고, 스크롤뷰의 이벤트 받는 부분을 살짝 추가해봤습니다. 
```swift 
class ViewController: UIViewController {

    @IBOutlet weak var scrollViewContainerViewWidth: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the ContainerView's width size for the ScrollView
        scrollViewContainerViewWidth.constant = UIScreen.main.bounds.size.width * 2
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Current X,Y are X:\(scrollView.contentOffset.x), Y: \(scrollView.contentOffset.y)")
        let currentPage = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
        print("current page : \(currentPage)")
    }
}
```
- LeftViewController.swift : 배경 컬러만 확인을 위해 수정했습니다.
```swift
	override func viewDidLoad() {
        super.viewDidLoad()
        
        // TEST backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
```

- RightViewController.swift : 배경 컬러만 확인을 위해 수정했습니다.
```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TEST backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    }
```

## 링크
- [Implementing a Container View Controller](https://developer.apple.com/documentation/uikit/uiviewcontroller) : 여기에서 Implementing a Container View Controller 부분에 설명이 되어있습니다.