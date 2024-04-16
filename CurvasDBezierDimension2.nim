import math

# Función para calcular el coeficiente binomial (n choose k)
proc binomialCoefficient(n, k: int): int =
    var res = 1
    for i in 0 ..< k:
        res = res * (n - i) div (i + 1)
    return res

# Función para calcular un punto en la curva de Bézier en 2D
proc bezierPoint(p0, p1, p2, p3: tuple[x, y: float], t, u: float): tuple[x, y: float] =
    let
        b0 = float(binomialCoefficient(3, 0)) * pow(1.0 - t, 3)
        b1 = float(binomialCoefficient(3, 1)) * pow(1.0 - t, 2) * pow(t, 1)
        b2 = float(binomialCoefficient(3, 2)) * pow(1.0 - t, 1) * pow(t, 2)
        b3 = float(binomialCoefficient(3, 3)) * pow(t, 3)
    
    let
        x = b0 * p0.x + b1 * p1.x + b2 * p2.x + b3 * p3.x
        y = b0 * p0.y + b1 * p1.y + b2 * p2.y + b3 * p3.y
    
    return (x * u, y * u)

# Ejemplo de uso
let
    controlPoints = @[
        (10.0, 10.0),
        (20.0, 30.0),
        (40.0, 20.0),
        (50.0, 50.0)
    ]
let
    t = 1.5
    u = 1.5
let
    (x, y) = bezierPoint(controlPoints[0], controlPoints[1], controlPoints[2], controlPoints[3], t, u)

echo "Punto en la curva de Bezier en t=", t, ", u=", u, ": (", x, ", ", y, ")"
