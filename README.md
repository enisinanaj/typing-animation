# typing-animation
"Typing" animation with 3 dots. The animation is done using the Facebook POP library

![Resulting animation](http://i.giphy.com/3o84UbiHuOhE62xXC8.gif)


## In this project
In the project so far there's the animation shown above managed through a class called `TypingLoaderAnimation`.
The animation class needs just to inputs which are a list of views as `Array<UIView>` that will be animated and a starting Y coordinate.
Optionally a `jump` variable can be set to determine the target position from the startin Y point.

It can be used as follows:

```
        var views: Array<UIView> = Array<UIView>()
        views.append(circleLarge)
        views.append(circle1Large)
        views.append(circle2Large)
        
        let animation = TypingLoaderAnimation(viewList: views, resetZeroTo: currentStartingYPoint + 70)
        animation.jump = 12 // Optional
        animation.startAnimation()
```
