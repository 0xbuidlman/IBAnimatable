# IBAnimatable
`IBAnimatable`是一个帮助我们在Interface Builder和Swift playground里面设计UI, 交互, 导航模式, 换场和动画的开源库。

2015年Designer News热卖文章中，前20篇里面有一半左右的文章是讨论如何快速制作可交换的原型，例如Adobe公司在开发Project Comet原型工具来补救日益被Sketch迅速占领的市场。这些工具都有一个特点：“快”。“快”成为移动开发领域为不可破的法宝，因为无论那个App都需要在不断的迭代中逐步完善和发展。但是目前这些工具都没法提供一个端到端的解决方案，很多工具生成的原型没办法直接使用在最终的App中，或者需要在Xcode和Interface Builder里重做原型中的设计，交换以及动画。这是一个很大的痛点，`IBAnimatable`的诞生是为了解决这个痛点。`IBAnimatable`提供从想法到最终App产品的设计工具，帮助我们在Interface Builder和Swift playground里面设计UI, 交互, 导航模式, 换场和动画。   

## 功能
* 一个工具覆盖原型到可提交到App Store的App - 支持所见即所得的设计功能。
* 对设计师友好 - 在Interface Builder的Attributes Inspector里提供类似Sketch配置功能。   
* 在Swift playground上设计动画 - 提供类似Framer Studio的左边编写代码，右边预览动画的功能。 
* 内置Auto Layout支持 - 使用Auto Layout和Size Classes支持翻屏和多设备。 
* 导航和换场动画支持 - 可以使用内置的导航模式，`IBAnimatable`同时提供Unwind Segue来返回前一个页面，可以省去编写代码的步骤。
* Protocol oriented编程模式 - `IBAnimatable`使用了protocol oriented编程模式，是的项目非常容易扩张，并且可以方便的制作出自己的自定义控件。  

## 怎样运行例子App
要了解和学习`IBAnimatable`，我们可运行例子App，并在Interface Builder中修改相关的配置来查看设计的结果。 

1) 克隆代码库

```
$ git clone https://github.com/JakeLin/IBAnimatable.git
```

2) 在Xcode打开xcworkspace文件

```
$ cd IBAnimatable
$ open "IBAnimatable.xcworkspace"
```

3) 编译并运行

## 如何在Interface Builder中设计UI和动画
![](https://raw.githubusercontent.com/JakeLin/IBAnimatable/master/Screenshots/DesignInInterfaceBuilder.png)

使用`IBAnimatable`在Interface Builder里设计UI和动，只需要下面简单的几步：

1. 打开storyboard或者Xib。
2. 把UIview或其他UI控件拖放到ViewController里面。
3. 在Identity Inspector里把相应的UI控件关联到`Animatable`的UI控件类，`Animatable`的文档可以在(APIs section)[https://github.com/JakeLin/IBAnimatable#apis]找到。
4. 在Attribute Inspector里配置UI和动画。


## 如何在Swift playground里设计动画
![](https://github.com/JakeLin/IBAnimatable/blob/master/Screenshots/AnimateInSwiftPlayground.gif)

尽管我们可以在Attribute Inspector里配置动画，但是Interface Builder还不支持预览动画。但幸运的是我们可以在Swift playgournd里设计和预览动画。你可以在[IBAnimatable.playground](https://github.com/JakeLin/IBAnimatable/tree/master/IBAnimatable.playground)看到如何设计和预览动画。首先选择一个playground的页，然后点击"Assistant editor"按钮来呈现右边的预览页。接着选择右上角的"Timeline"来预览动画。我们可以使用Xcode的"Editor" -> "Execute"菜单来重新执行Playground的动画。


## 手工运行动画
在上面我们已经看到，我们可以不需要任何代码就能在Interface Builder进行设计，但是`IBAnimatable`还提供编程接口来让我们完全控制UI和动画。`IBAnimatable`提供了例如`pop()`那样简单的API，我们只需要一行代码就能执行动画。

```
view.pop() // pop animation for the view
view.squeezeFadeInLeft() // squeeze and fade in from left animation
```  

在[Swift playgournd Page - Predefined Animations](https://github.com/JakeLin/IBAnimatable/tree/master/IBAnimatable.playground/Pages/Predefined%20Animations.xcplaygroundpage)里面我们可以尝试不同的动画。

### 动画的属性
我们可以通过修改动画的属性来进一步个性化我们的动画。我们只需要修改这项属性，然后调用`animate()`方法来运行动画。

```
// Setup the animation
view.animationType = "SqueezeInLeft"
view.delay = 0.5
view.damping = 0.5
view.velocity = 2
view.force = 1

// Start the animation
view.animate()
```

我们可以在[Swift playgournd Page - Animation Properties](https://github.com/JakeLin/IBAnimatable/tree/master/IBAnimatable.playground/Pages/Animation%20Properties.xcplaygroundpage)里面尝试不同的动画属性。

### 串联动画
有时候我们需要把多个动画串联起来执行，`IBAnimatble`提供非常简易的方式来把动画串联起来。

```
// 只要把下一个动画放在 `{}` closure就可以了，下面的例子是当执行完从上而下的滑动后Pop的动画。
view.squeezeInDown{ view.pop() }

// 这是"Animate in Swift playground"Gif动画的源代码，把好几个动画串联起来执行。
view.squeezeInDown{ view.pop { view.shake{ view.squeeze{ view.wobble{ view.flipX { view.flash{ view.flipY { view.fadeOutDown() } } } } } } } }
```

## 怎样安装
### 手工安装
把`IBAnimatable`文件夹拷贝到你的Xcode项目中

### Git submodule
在开发中，请看[Issue #22 - Swift package manager support](https://github.com/JakeLin/IBAnimatable/issues/22)

### Swift package manager
在开发中，请看[Issue #5 - Swift package manager support](https://github.com/JakeLin/IBAnimatable/issues/5)

### CocoaPods
在开发中，请看[Issue #7 - CocoaPods support](https://github.com/JakeLin/IBAnimatable/issues/7)

### Carthage 
在开发中，请看[Issue #6 - Carthage support ](https://github.com/JakeLin/IBAnimatable/issues/6)

## APIs
完整的API文档请参考[IBAnimatable APIs](https://github.com/JakeLin/IBAnimatable#apis)

## How to contribute
All of us can contribute to this project. Fewer overheads mean less time to build quality Apps and more time to enjoy coffee ☕️.

If you are a design, you can design in Interface Builder with `IBAnimatable` or redo your existing design from Sketch or Photoshop. You should be able to do <del>all</del> most of design work in Interface Builder. If you have any feature request, please [create a GitHub Issue](https://github.com/JakeLin/IBAnimatable/issues/new) and we will put it in the backlog. If you have done any design with `IBAnimatable`, please let us know via creating Pull Request or GitHub Issue. We will add it to Readme file.

If you are a developer, you can work on features or fix bugs, please check out [GitHub Issues](https://github.com/JakeLin/IBAnimatable/issues) to find out the backlog. If you have used `IBAnimatable` in you App, please let us know via creating Pull Request or GitHub Issue. We will add it to Readme file.

If you are good at English, please correct my English 😁. If you are good at other languages, please create a Readme file in those languages.

If you like the project, please share it with the other designers and developers, and star 🌟 the project. 🤗


## Inspirations
* `IBDesignable` and `IBInspectable` - The entire project is based on that.
* Sketch -  Interface Builder should be as easy as Sketch to use
* Framer
* [Spring by Meng To](https://github.com/MengTo/Spring) - steal a lot of animation parameters from this project.
* [Invision ToDo App UI Kit](http://www.invisionapp.com/do), The demo App's original design is from this UI Kit and redone in Interface Builder. We also added interaction, navigation and animations.

## License
`IBAnimatable` is released under the MIT license. See [LICENSE](https://github.com/JakeLin/IBAnimatable/blob/master/LICENSE) for details.

