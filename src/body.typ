#import "dep.typ":*

#let body(hue:red, style, alpha:1.0, shadow:true) = {
  import cetz.draw: hobby, arc, line, merge-path, group
  let body = group(
  {
    if style == "drawing" {
      let pts_drawing = (// Back leg
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
        (2.28, 0.3), (2.28, 0.8))
      // Fill
      hobby(..pts_drawing, omega: 1, stroke:none, fill:hue)

      // Shadow
      if shadow {
        hobby(
        // Back leg
        (2.9,1),(2.3,0.8), (1.5,0.8), (1.3,0.8), 
        (1.1, 0.1), (1,0.01), (0.9,0),
        // Back
        (0.1, 0.15), (0, 0.5), (0, 0.9), (-0.05, 2),
        // Middle curve
        (0,4), (0.02, 4.5), (0.15, 4.94),  (0.48, 5.29), (0.49, 5.295), (0.51, 5.2), (0.5, 3), (0.7, 2.5), (2,1.7), (3.4, 2.4), (3.499, 2.5), (3.55, 2.5), (3.6, 2.43), 
        // Front below visor
        (3.6, 2),(3.5, 0.5), (3.45, 0.1), 
        // Font leg
        (3.1,0),(2.5,0), (2.49,0) , (2.3, 0.2), 
        (2.28, 0.3), (2.28, 0.8), 
        omega: 1, stroke:none, fill: rgb(0,0,0,alpha-float2int(alpha*0.15))
        )
      }

      // Border
      hobby(..pts_drawing, omega: 1, fill:none)
      
    } else if style == "simple" {
      merge-path(fill:hue, {
        arc((3.5, 0.3), start: 0deg, stop: -90deg, radius:0.3)
        arc((2.5, 0), start: 90deg, stop: 0deg, radius:-0.3)
        line((2.2, 0.8), (1.2, 0.8))
        arc((1.2, 0.3), start: 0deg, stop: -90deg, radius:0.3)
        arc((0.3, 0), start: 90deg, stop: 0deg, radius:-0.3)
        hobby((0, 4), (0.2, 4.94), (0.48, 5.27), (1.18, 5.61), (1.73, 5.69), (2.24, 5.64), (3.1, 5.3), (3.42, 4.93), (3.5, 4.))
        line((3.5, 4.5), (3.5, 0.3))
      })

    } else {
      panic("Unknown style: " + style)
    }
    
  })
  return body
}