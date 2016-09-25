## This function creates the list which is, similar to course example, contains 2 get and 2 set functions for martix and its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  inv = NULL
  set = function(y) {
    x <<- y
    inv <<- NULL
  }
  get = function() x
  setinv = function(inverse) inv <<- inverse 
  getinv = function() inv
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## This function checks if the inverse has already been calculated (i.e. if matrix is the same as original) 
## and then either pulls the value from cache or recalculates the inverse.

cacheSolve <- function(x, ...) {
  inv = x$getinv()
  if (!is.null(inv)){
   
    message("getting cached data")
    return(inv)
  }
  mat.data = x$get()
  inv = solve(mat.data, ...)
  x$setinv(inv)s
  
  return(inv)
}
