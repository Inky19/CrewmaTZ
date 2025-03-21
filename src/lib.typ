#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1"

#let backpack(color: red, style) = {
    import cetz.draw: hobby, rect
    let backpack = none
    if style == "drawing" {
      backpack = hobby((-0.9,2),(-0.9,3.5),(-0.75,4.1), (-0.6, 4.2), (-0.1, 4.2),
    (0.25, 4.2), (0.3, 3.9), (0.3, 3.5), (0.3,1.2), (0.25, 1),
    (-0.1, 0.9), (-0.6,1), (-0.8, 1.5), close: true, stroke: 5pt+black, fill: color)
    } else if style == "simple" {
      backpack = rect((-0.7, 4.2), (rel: (1, -3.2)), radius: 0.3, stroke: 5pt+black, fill: color)
    } else {
      panic("Unknow style: " + style)

    }
  return backpack
}

#let body(color:red, style) = {
  import cetz.draw: hobby, arc, line, merge-path
  let body = merge-path(fill: color, stroke: 5pt,
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
      panic("Unknow style: " + style)
    }
    
  })
  return body
}

#let visor(color: red, style) = {
  let (vis_l, vis_h) = (2.1, 1.8)
  import cetz.draw: hobby, rect, group
  let visor = none
  if style == "drawing" {
    visor = group({
      hobby((vis_l/2,vis_h), (vis_l, vis_h*0.9), (vis_l*0.9333, vis_h*0.1), (vis_l/2, 0) , (vis_l*0.0667,vis_h*0.1), (0, vis_h*0.9), 
        close: true, omega: 0,
        ta: (1, 1, 1, 1, 1, 2),
        tb: (2, 1, 1, 1, 1, 1),
        stroke: none,
        fill: rgb("#55aaff"),
      )
    
      // Shadow
      hobby((vis_l*0.87333, vis_h*0.2), (vis_h/2, 0) , (vis_l*0.0667,vis_h*0.1), (0, vis_h*0.9), (vis_l*0.1334, vis_h*0.4), (vis_l*0.4666 , vis_h*0.2), 
        close: true, omega: 0,
        ta: (2, 1, 10, 1, 2, 1),
        tb: (1, 1, 1, 1, 1, 100),
        stroke:none,
        fill: blue
      )
      
      // Shine
      let shine_x = vis_l/1.57
      let shine_y = vis_h/1.67
      let shine_l = vis_l/3
      let shine_h = vis_h/5
      rect((shine_x, shine_y), (rel: (shine_l, shine_h)), 
        fill: white, stroke: none, radius: 50%
      )

      // Border
      hobby((vis_l/2,vis_h), (vis_l, vis_h*0.9), (vis_l*0.9333, vis_h*0.1), (vis_l/2, 0) , (vis_l*0.0667,vis_h*0.1), (0, vis_h*0.9), 
        close: true, omega: 0,
        ta: (1, 1, 1, 1, 1, 2),
        tb: (2, 1, 1, 1, 1, 1),
        stroke: 5pt,
      )
    })
  } else if style == "simple" {
    visor = group({
      rect((0, 0), (rel: (vis_l*1.3, vis_h)), 
        fill: rgb("#55aaff"), stroke: none,
        radius: 50%
      )

      // Shine
      let shine_x = vis_l/1.57
      let shine_y = vis_h/1.67
      let shine_l = vis_l/3
      let shine_h = vis_h/5
      rect((shine_x, shine_y), (rel: (shine_l, shine_h)), 
        fill: white, stroke: none, radius: 50%
      )

      rect((0, 0), (rel: (vis_l*1.3, vis_h)), 
        fill: none, stroke: 5pt,
        radius: 50%
      )
    })
  } else {
    panic("Unknow style: " + style)
  }
  return visor
}


#let amongus(color: red, style:"drawing", size:5cm) = {
  let amog = cetz.canvas({
    import cetz.draw: *

    backpack(color: color, style)
    body(color: color, style)
    
    // Visor
    let (vis_x, vis_y) = (1.4, 3)
    translate(x: vis_x, y:vis_y)
    visor(color: color, style)
  })

  scale(y:size,x:auto)[#amog]
}
