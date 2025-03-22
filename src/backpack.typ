#import "dep.typ":*
#let backpack(hue: red, style) = {
    import cetz.draw: hobby, rect
    let backpack = none
    if style == "drawing" {
      backpack = hobby((-0.9,2),(-0.9,3.5),(-0.75,4.1), (-0.6, 4.2), (-0.1, 4.2),
    (0.25, 4.2), (0.3, 3.9), (0.3, 3.5), (0.3,1.2), (0.25, 1),
    (-0.1, 0.9), (-0.6,1), (-0.8, 1.5), close: true, fill: hue)
    } else if style == "simple" {
      backpack = rect((-0.7, 4.2), (rel: (1, -3.2)), radius: 0.3, fill: hue)
    } else {
      panic("Unknown style: " + style)

    }
  return backpack
}