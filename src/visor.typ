#import "dep.typ":*

#let visor(hue: red, style, alpha:1.0, shadow: true) = {
  let _alpha = alpha-float2int(alpha)
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
        fill: rgb(85, 170, 255, _alpha),
      )
    
      // Shadow
      if shadow {
        hobby((vis_l*0.87333, vis_h*0.2), (vis_h/2, 0) , (vis_l*0.0667,vis_h*0.1), (0, vis_h*0.9), (vis_l*0.1334, vis_h*0.4), (vis_l*0.4666 , vis_h*0.2), 
          close: true, omega: 0,
          ta: (2, 1, 10, 1, 2, 1),
          tb: (1, 1, 1, 1, 1, 100),
          stroke:none,
          fill: rgb(0,0,0,alpha-float2int(alpha*0.15))
        )
      }
      
      // Shine
      let shine_x = vis_l/1.57
      let shine_y = vis_h/1.67
      let shine_l = vis_l/3
      let shine_h = vis_h/5
      rect((shine_x, shine_y), (rel: (shine_l, shine_h)), 
        fill: rgb(255,255,255,_alpha), stroke: none, radius: 50%
      )

      // Border
      hobby((vis_l/2,vis_h), (vis_l, vis_h*0.9), (vis_l*0.9333, vis_h*0.1), (vis_l/2, 0) , (vis_l*0.0667,vis_h*0.1), (0, vis_h*0.9), 
        close: true, omega: 0,
        ta: (1, 1, 1, 1, 1, 2),
        tb: (2, 1, 1, 1, 1, 1),
      )
    })
  } else if style == "simple" {
    visor = group({
      rect((0, 0), (rel: (vis_l*1.3, vis_h)), 
        fill: rgb(85, 170, 255, _alpha), stroke: none,
        radius: 50%
      )

      // Shine
      let shine_x = vis_l/1.57
      let shine_y = vis_h/1.67
      let shine_l = vis_l/3
      let shine_h = vis_h/5
      rect((shine_x, shine_y), (rel: (shine_l, shine_h)), 
        fill: rgb(255,255,255,_alpha), stroke: none, radius: 50%
      )

      rect((0, 0), (rel: (vis_l*1.3, vis_h)), 
        fill: none,
        radius: 50%
      )
    })
  } else {
    panic("Unknown style: " + style)
  }
  return visor
}