# Sample Swift ContainerView
> UIViewController 하위에 Container View를 이용하여 Controller를 작동(연결) 할 수 있습니다.  <br />
그것을 스토리보드와 코드를 이용해서 스크롤뷰 안에 들어가는 뷰들을 Container View로 넣어서 셈플링한 소스 입니다. <br />
Container View 1,2는 스토리보드로, <br />
Container View 3은 코드로 추가했습니다. 3은 제거하는 기능까지 테스트 했습니다.

## 주요 설명
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/sample-ios-timer/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.1-orange.svg?style=flat)](https://swift.org) 
- 스크롤뷰 안의 스크롤뷰의 내부 컨텐츠를 담는 뷰를 크게 만들고 그 안에 페이지 단위 View 들 안에 Container View 를 담았습니다.
- 현재의 뷰 안에 컨트롤러를 연결 시킨 것과 다른 스토리보드의 파일을 링크 시킨 두가지 경우로 셈플링 하였습니다.

## 스토리보드 이미지
<img width="628" height="631" src="/Image/image_storyboard_00.png"></img>

## 실행 이미지 (GIF)
<img width="268" height="480" src="/Image/resultForImage.gif"></img>

## 실행 결과 계층 구조
- Container View 1,2를 스토리보드로 추가한 계층
<br /><img width="517" height="494" src="/Image/image_result_hierarchy00.png"></img><br />
- Container View 3을 버튼을 눌러 코드로 추가한 계층
<br /><img width="482" height="499" src="/Image/image_result_hierarchy01.png"></img><br />

## 결과 소스 및 파일
> 실제 받아서 실행해 보셔요~

- Main.storyboard : 여기에 기본 베이스 화면을 구성했습니다.
- Other.storyboard : 오른쪽의 두번째 Container View에 들어갈 RightViewController가 들어있습니다. (Container View 2)
- ViewController.swift : 가로 길이가 디바이스에 따라 변하게 하였고, 스크롤뷰의 이벤트 받는 부분을 살짝 추가해봤습니다. 

```swift 
class ViewController: UIViewController {

    @IBOutlet weak var scrollViewContainerViewWidth: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the ContainerView's width size for the ScrollView
        scrollViewContainerViewWidth.constant = UIScreen.main.bounds.size.width * 2
    }
    
    // addChildController
    @IBAction func onAddChildController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Other", bundle: nil)
        let addViewController = storyboard.instantiateViewController(withIdentifier: "AddViewController")
        // if Constraints
//        addViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(addViewController)
        self.view.addSubview(addViewController.view)
        
        // if Constraints
//        self.view.addConstraints(addViewController.view.constraints)
        
        addViewController.didMove(toParent: self)
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
	- StoryBoard로 추가한 케이스 입니다.
	- RightViewController.swift는 배경 색상만 달라서 별도 소스는 추가 안했습니다. 
	
```swift
class LeftViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TEST backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
    
    // willMove -> It appears on the parent screen.
    override func willMove(toParent parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)   // TestScrollViewAndContainerView.ViewController
        }
    }
    
    // It appears on the parent screen. -> didMove
    override func didMove(toParent parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)
        }
    }
}
```

- AddViewController.swift : 코드 레벨로 Contrainer View를 추가했습니다. 

```swift
class AddViewController: UIViewController {
    deinit {
        // check remove self
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TEST backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    
    // willMove -> It appears on the parent screen.
    override func willMove(toParent parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)
        }
    }
    
    // It appears on the parent screen. -> didMove
    override func didMove(toParent parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)
        }
    }
    
    // remove child view controller
    @IBAction func onRemoveChildViewController(_ sender: Any) {
        // Notify the parent to remove it by calling willMove.
        // willMove 를 호출해서 제거한다는 것을 알립니다.
        self.willMove(toParent: nil)
        // Remove Constraint.
        // 제약사항 제거
        self.view.removeFromSuperview()
        // Remove the relationship of the child connected to the parent.
        // 부모에 연결된 자식의 관계를 제거합니다.
        self.removeFromParent()
    }
}
```

## 추가 설명
- 단순하게 addSubView를 하면 부모자식관계는 성립하지 않습니다.
- addChildViewController를 이용해서 자식 컨트롤러를 추가합니다.
- 추가 완료된 이후에는 부모컨트롤러에서 didMove:를 호출해 줘야 합니다.
- removeFromParentViewController를 이용해서 자식 컨트롤러를 제거합니다.
- 제거 순서는 자식의 부모 뷰를 Container View 계층에서 제거한 후, 자식과 부모는 Container View Controller와 연결을 끊어야 합니다.
- 자식 컨트롤러가 오토레이아웃 환경인 경우 translatesAutoresizingMaskIntoConstraints 설정도 신경씁니다.


## 링크
- [Implementing a Container View Controller](https://developer.apple.com/documentation/uikit/uiviewcontroller) : 여기에서 Implementing a Container View Controller 부분에 설명이 되어있습니다.