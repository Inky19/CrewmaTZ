#import "src/lib.typ":*
#show: doc => sussy-watermark(doc, hue:green)
#show: page => sussy-numbering(page)
//#show: doc => test_template(doc)

= Amogus
Test from _Typst_ UwU 
#amongus(hue: red, size: 5cm, style: "drawing")

#amongus(hue: orange, size: 5cm, style: "simple")

#let test_visor = visor("simple", hue: red, alpha: 0.5)
#let test_backpack = backpack(hue: orange, "simple")
#let test_body = body(hue: gradient.conic(..color.map.rainbow), "drawing")

#amongus-builder(test_backpack, test_body, test_visor)

#let mog = amongus(hue: gradient.linear(..color.map.rocket, angle:45deg), size: 5cm, style: "drawing", angle: 45deg, alpha: 0.5)

#place(top + right, mog)

#pagebreak()
#pagebreak()
#pagebreak()
#pagebreak()
#pagebreak()
#pagebreak()
#pagebreak()
#pagebreak()
#pagebreak()
#pagebreak()