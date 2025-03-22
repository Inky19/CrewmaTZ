#import "dep.typ":*

#let body(hue:red, style) = {
  import cetz.draw: hobby, arc, line, merge-path
  let body = merge-path(fill: hue,
  {
    if style == "drawing" {
      hobby(
        // Back leg
        (2.9,1),(2.3,0.8), (1.5,0.8), (1.3,0.8), 
        (1.1, 0.1), (1,0.01), (0.9,0),
        // Back
        (0.1, 0.15), (0, 0.5), (0, 0.9), (-0.05, 2),
        // Top of head
        (0, 4), (0.02, 4.5), (0.15, 4.94), (0.48, 5.29), (1.18, 5.61), (1.73, 5.62), (2.24, 5.53), (3.1, 5.1), (3.38, 4.7), (3.5, 4.0), 
        // Front below visor
        (3.6, 2),(3.5, 0.5), (3.45, 0.1), 
        // Font leg
        (3.1,0),(2.5,0), (2.49,0) , (2.3, 0.2), 
        
        (2.28, 0.3), (2.28, 0.8), 
        omega: 1)
    } else if style == "simple" {
      arc((3.5, 0.3), start: 0deg, stop: -90deg, radius:0.3)
      arc((2.5, 0), start: 90deg, stop: 0deg, radius:-0.3)
      line((2.2, 0.8), (1.2, 0.8))
      arc((1.2, 0.3), start: 0deg, stop: -90deg, radius:0.3)
      arc((0.3, 0), start: 90deg, stop: 0deg, radius:-0.3)
      hobby((0, 4), (0.2, 4.94), (0.48, 5.27), (1.18, 5.61), (1.73, 5.69), (2.24, 5.64), (3.1, 5.3), (3.42, 4.93), (3.5, 4.))
      line((3.5, 4.5), (3.5, 0.3))

    } else {
      panic("Unknown style: " + style)
    }
    
  })
  return body
}