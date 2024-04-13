proc BasisFuns(i: int, u: float, p: int, U: seq[float], N: var seq[float]) =
  ## Compute the nonvanishing basis functions
  ## Input: i, u, p, U
  ## Output: N
  
  var
    left, right: seq[float]
    saved, temp: float
    
  left = newSeq[float](p + 1)
  right = newSeq[float](p + 1)
    
  N[0] = 1.0
  for j in 1..p:
    left[j] = u - U[i + 1 - j]
    right[j] = U[i + j] - u
    saved = 0.0
    for r in 0..<j:
      temp = N[r] / (right[r + 1] + left[j - r])
      N[r] = saved + right[r + 1] * temp
      saved = left[j - r] * temp
    N[j] = saved



# Ejemplo de uso de la función BasisFuns
when isMainModule:
  # Definimos los parámetros de entrada
  let i = 2
  let u = 0.5
  let p = 2
  let U = @[0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 3.0, 3.0]

  # Creamos una secuencia mutable para almacenar los resultados
  var N = newSeq[float](p + 1)

  # Llamamos a la función BasisFuns
  BasisFuns(i, u, p, U, N)

  # Imprimimos los resultados
  echo "Los resultados de las funciones base son:"
  for j, value in N:
    echo "N[", j, "] = ", value