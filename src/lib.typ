#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1"

#let amongus(color: red, size:5cm) = {
  let amog = cetz.canvas({
    import cetz.draw: *

    // Backpack
    rect((-0.5, 4.2), (rel: (0.8, -3.2)), radius: 0.3, stroke: 2pt+black, fill: color)

    // Body
    merge-path(fill: color, stroke: 2pt,
    {
      arc((3.5, 0.3), start: 0deg, stop: -90deg, radius:0.3)
      arc((2.5, 0), start: 90deg, stop: 0deg, radius:-0.3)
      line((2.2, 0.8), (1.2, 0.8))
      arc((1.2, 0.3), start: 0deg, stop: -90deg, radius:0.3)
      arc((0.3, 0), start: 90deg, stop: 0deg, radius:-0.3)
      hobby((0, 4.5), (0.09, 4.94), (0.48, 5.29), (1.18, 5.61), (1.73, 5.71), (2.24, 5.64), (3.1, 5.3), (3.42, 4.96), (3.5, 4.5))
      line((3.5, 4.5), (3.5, 0.3))
    })

    // Visor
    let (vis_x, vis_y) = (1.4, 3)
    let (vis_l, vis_h) = (2.5, 1.8)

    translate(x: vis_x, y:vis_y)
    hobby((vis_l/2,vis_h), (vis_l, vis_h*0.9), (vis_l*0.9333, vis_h*0.1), (vis_l/2, 0) , (vis_l*0.0667,vis_h*0.1), (0, vis_h*0.9), close: true, omega: 0,
    ta: (1, 1, 1, 1, 1, 2),
    tb: (2, 1, 1, 1, 1, 1),
    stroke: none,
    fill: rgb("#55aaff"),
    )
    
    // Shadow
    hobby((vis_l*0.87333, vis_h*0.2), (vis_h/2, 0) , (vis_l*0.0667,vis_h*0.1), (0, vis_h*0.9), (vis_l*0.1334, vis_h*0.4), (vis_l*0.4666 , vis_h*0.2), close: true, omega: 0,
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
    rect((shine_x, shine_y), (rel: (shine_l, shine_h)), fill: white, stroke: none,
    radius: 50%,
    )


    // Border
    hobby((vis_l/2,vis_h), (vis_l, vis_h*0.9), (vis_l*0.9333, vis_h*0.1), (vis_l/2, 0) , (vis_l*0.0667,vis_h*0.1), (0, vis_h*0.9), close: true, omega: 0,
    ta: (1, 1, 1, 1, 1, 2),
    tb: (2, 1, 1, 1, 1, 1),
    stroke: 3pt,
    )
  })

  scale(y:size,x:auto)[#amog]
}


