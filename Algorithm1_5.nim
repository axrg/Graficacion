type
  Point = tuple[x, y: float]

proc deCasteljau1(P: seq[Point], n: int, u: float): Point =
  ## Compute point on a Bezier curve using deCasteljau
  ## Input: P (list of control points), n (degree of the curve), u (parameter)
  ## Output: C (a point)
  var Q: seq[Point] = newSeq[Point](n+1)
  for i in 0..n:
    Q[i] = P[i]
  for k in 1..n:
    for i in 0..n-k:
      let t = 1.0 - u
      Q[i] = (t * Q[i][0] + u * Q[i+1][0], t * Q[i][1] + u * Q[i+1][1])
  return Q[0]

# Ejemplo de uso:
let P = @[(0.0, 0.0), (1.0, 2.0), (3.0, 4.0)]  # Lista de puntos de control
let n = P.len - 1  # Grado de la curva
let u = 0.5  # Parámetro
let C = deCasteljau1(P, n, u)  # Punto en la curva para el parámetro u
echo "Punto en la curva para u=", u, ": ", C
