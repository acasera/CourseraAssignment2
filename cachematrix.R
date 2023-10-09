## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x<<-y
    m<<- NULL
  }
  get <- function()x
  setinvmatrix <- function(solve) m<-solve
  getinvmatrix <- function() m
  list(set=set, get=get)
}


##  This function computes the inverse of the special "matrix"
##  returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
m <- x$getinvmatrix()
if(!is.null(m)) {
message("Getting cached matrix")
return(m)
}
data <-x$get()
m<-(solve(data, ...))
x$setinvmatrix(m)
}
