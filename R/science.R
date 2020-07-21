newton1 <- function(m, a) {
  f = m * a 
  f
}

newton1(m = 5, a = 3)


newton2 <- function(f, m, a) {
  
  f1 <- function(x, m, a) x - m * a
  
  if(missing(f)) 
    return(uniroot(f1, c(-100000, 100000), m = m, a = a)$root)
  
  if(missing(m)) 
    return(uniroot(f1, c(0, 100000), x = f, a = a)$root)
  
  if(missing(a)) 
    return(uniroot(f1, c(-100000, 100000), x = f, m = m)$root)
}
  


chemistry1 <- function(m, c, t1, t0) { 
  delt = t1 - t0
  q = m * c * delt
  q
}
chemistry1(m = 1, c = 4.2, t1 = 70, t0 = 30)


chemistry2 <- function(q, m, c, t1, t0) {
  
  f2 <- function(q, m, c, t1, t0) q - m * c * (t1 - t0)
  
  if(missing(q))
    return(uniroot(f2, c(-100000, 100000), m = m, c = c, t1 = t1, t0 = t0)$root)
  
  if(missing(m))
    return(uniroot(f2, c(0, 100000), q = q, c = c, t1 = t1, t0 = t0)$root)
  
  if(missing(c))
    return(uniroot(f2, c(-100000, 100000), q = q, m = m, t1 = t1, t0 = t0)$root)
  
  if(missing(t1))
    return(uniroot(f2, c(-100000, 100000), q = q, m = m, c = c, t0 = t0)$root)
  
  if(missing(t0))
    return(uniroot(f2, c(-100000, 100000), q = q, m = m, c = c, t1 = t1)$root)
}
