proc Horner1(a: seq[float], n: int, u0: float): float =
  var C: float = a[n]
  for i in 0 .. n-1:
    C = C * u0 + a[i]
  result = C

# Ejemplo de uso:
var coefficients = @[1.0, 2.0, 3.0]  # Coeficientes del polinomio: 1 + 2x + 3x^2
var degree = coefficients.len - 1  # Grado del polinomio
var u0 = 2.0  # Valor de x en el que evaluamos el polinomio
var result = Horner1(coefficients, degree, u0)
echo "El resultado de evaluar el polinomio en x =", u0, " es:", result
