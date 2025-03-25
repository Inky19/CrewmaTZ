#import "dep.typ":*
#let backpack(hue: red, style, alpha:1.0, shadow: true) = {
    import cetz.draw: hobby, rect, group
    let backpack = none
    if style == "drawing" {
      let pts_drawing = ((-0.9,2),(-0.9,3.5),(-0.75,4.1), (-0.6, 4.2), (-0.1, 4.2), (0.25, 4.2), (0.3, 3.9), (0.3, 3.5), (0.3,1.2), (0.25, 1), (-0.1, 0.9), (-0.6,1), (-0.8, 1.5))
      backpack = group({
        // Fill
        hobby(..pts_drawing, close: true, fill: hue, stroke:none)

        // Shadow
        if shadow {
          hobby((-0.5, 3.7), (0.1, 3.7), (0.24, 3.4), (0.3, 1.2), (0.25, 1), (-0.1, 0.9), (-0.6,1), (-0.8, 1.5), (-0.9, 2.1), close: true, fill: rgb(0,0,0,alpha-float2int(alpha*0.15)), stroke:none)
        }
      
        // Border
        hobby(..pts_drawing, close: true, fill: none)

      })


    } else if style == "simple" {
      backpack = rect((-0.7, 4.2), (rel: (1, -3.2)), radius: 0.3, fill: hue)
    } else {
      panic("Unknown style: " + style)

    }
  return backpack
}