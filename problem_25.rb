def fibonacci(n, cache = {})
  p n
  return  n  if n <= 1
  cache[n] ||= fibonacci(n-1, cache) + fibonacci(n-2, cache)
end

(40..100000).each do |number|
  fib = fibonacci(number)
  p [number, fib]

  if fib.to_s.split('').count >= 1000
    return fib
  end
end
