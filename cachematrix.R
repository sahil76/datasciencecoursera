## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y){
    x <<- matrix(y)
    m <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inverse) m <<- solve
  getinverse <- function() m
  
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        m <- getinverse()
        if(!is.null(m)){
          message("getting cached data")
          return(m)
        }
        data <- x$get()
        m <- solve(data,...)
        x$setinverse(m)
        m
}

