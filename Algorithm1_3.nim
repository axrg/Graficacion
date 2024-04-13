proc allBernstein(n: int, u: float): seq[float] =
  var B = newSeq[float](n + 1)
  B[0] = 1.0
  var u1 = 1.0 - u
  for j in 1..n:
    var saved = 0.0
    for k in 0..<j:
      var temp = B[k]
      B[k] = saved + u1 * temp
      saved = u * temp
    B[j] = saved
  result = B

# Ejemplo de uso:
let n = 3
let u = 0.5
let B = allBernstein(n, u)
echo "Los polinomios de Bernstein son:"
echo B

