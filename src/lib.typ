#import "dep.typ":*
#import "backpack.typ":*
#import "body.typ":*
#import "visor.typ":*

#let amongus(hue: red, style:"drawing", size:5cm, shadow:true, alpha:1.0,angle:0deg) = {
  let _alpha = alpha-float2int(alpha)
  if type(hue) == color {
    let (r,g,b,a) = hue.components()
    hue = rgb(r, g, b, _alpha)
  } else if type(hue) == gradient {
    let stops = hue.stops()
    let stops = stops.map(stop => {
      let (r,g,b,a) = stop.at(0).components()
      return (rgb(r,g,b,_alpha), stop.at(1))
    })
    hue = hue.kind()(..stops, angle: hue.angle())
  }
  
  let border_color = rgb(0,0,0,_alpha)
  
  let amog = cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 5pt+border_color)
    backpack(hue: hue, style, alpha:alpha, shadow: shadow)
    body(hue: hue, style, alpha:alpha, shadow: shadow)
    
    // Visor
    let (vis_x, vis_y) = (1.4, 3)
    translate(x: vis_x, y:vis_y)
    visor(hue: hue, style, alpha:alpha, shadow: shadow)
  })

  rotate(angle,scale(y:size,x:auto)[#amog])
}

#let amongus-builder(backpack, body, visor) = {
  let amog = cetz.canvas({
    import cetz.draw: *
    backpack
    body
    let (vis_x, vis_y) = (1.4, 3)
    translate(x: vis_x, y:vis_y)
    visor
  })
  return amog
}

#let sussy-watermark(doc, style:"simple", alpha:0.2, hue: red, height:15cm, angle:-30deg) = {
  let width = context page.width
  set page(background: amongus(hue: hue, style: style, size:height, alpha: alpha, angle: angle))
  doc
}

#let sussy-numbering(p) = {
  set page(numbering: (..nums) => {
    let number = nums.pos().at(0)
    return box({
      place(horizon + center, amongus(size: 1.5em, hue: yellow, angle: 45deg * (number - 1)))
      place(horizon + center, highlight(fill:rgb("ffffffcc"), radius: 50%, text(nums.pos().map(str).at(0), size: 1.5em)))
    }
    )
  })
  p
}

#let test_template(doc) = {
  let width = context page.width
  set page(footer: "Sussy baka" + width)
  doc
}