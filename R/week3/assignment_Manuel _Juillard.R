makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
inv
}

m2 <- matrix( c ( 1, 2, 3, 4 ), nrow=2, byrow=TRUE)
mv1 <- makeCacheMatrix(m2)
cacheSolve(mv1)

mv1$get()
mv1$setinverse(solve(m1))
mv1$getinverse()

matrix.inverse(m1)