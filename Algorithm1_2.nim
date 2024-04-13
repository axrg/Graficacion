proc Bernstein(i, n: int, u: float): float =
    var
        temp: array[0..100, float]  
        u1, B: float

    for j in 0..n:
        temp[j] = 0.0

    temp[n - i] = 1.0
    u1 = 1.0 - u

    for k in 1..n:
        for j in (n - k + 1)..n:  # Bucle hacia abajo
            temp[j] = u1 * temp[j] + u * temp[j - 1]

    B = temp[n]
    result = B

# Ejemplo de uso
let i = 2
let n = 4
let u = 0.3
let resultado = Bernstein(i, n, u)
echo "El valor del polinomio Bernstein para i = ", i, ", n = ", n, " y u = ", u, " es: ", resultado
