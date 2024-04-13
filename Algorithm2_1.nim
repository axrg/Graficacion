# Definir la función findSpan
proc findSpan(n: int, p: int, u: float, U: seq[float]): int =
    var low, high, mid: int
    low = p
    high = n + 1
    
    # Caso especial
    if u == U[n + 1]:
        return n
    
    # Búsqueda binaria
    mid = (low + high) div 2
    while u < U[mid] or u >= U[mid + 1]:
        if u < U[mid]:
            # Realizar búsqueda binaria
            high = mid
        else:
            low = mid
        mid = (low + high) div 2
    
    return mid

# Ejemplo de uso
when isMainModule:
    let n = 5
    let p = 2
    let u = 2.5
    let U = @[0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 4.0, 4.0]
    let spanIndex = findSpan(n, p, u, U)
    echo "El índice del intervalo de los nodos para u =", u, " es:", spanIndex
