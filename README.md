# YjiPodModule

### Tasks
✅ 1, Create a framework with sample app.

✅ 2, Publish the framework as **Private Framework**.

✅ 3, Add other frameworks（SnapKit, Alamofire）, Edit spec.dependency and update.

✅ 4, Add Resource file and update.
(Storyboard, Localizable.strings, Objc files)

✅ 5, Load Resource files in Bundle


### Sample
Please refer to the **TestProject** under the root folder

### Implementation

Becasue release will cost too much time.

Local Test: *pod 'YjiPodModule', :path => '../../Downloads/YjiPodModule'* [Detail for private pod release](https://github.com/Ericji1989114/PrivatePodsSpecs)

### How to load bundle in framework
```
// Look for the framework which will include YjiTestViewController class
let bundle = Bundle(for: YjiTestViewController.self)

// Bundle will be built under the framework. So seaching bundle path needs to look for framework firstly.
let path = bundle.path(forResource: "YjiPodModule", ofType: "bundle")

// Create a resource bundle. which includes image resource, storyboard/xib,  Localizable.strings 
let resource = Bundle(path: path!)
```




