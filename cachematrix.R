## Put comments here that give an overall description of what your
## functions do
## I hve used coursera guide which provided on coursera assignment page (mean function calculation) 
## Also take reference from stackoverflow and other R groups/git resource and formus 
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
 m_inverse <- NULL      #Inititalize with NULL
  set <- function(y) {
    x <<- y
    m_inverse <<- NULL   #Inititalize with NULL
  }
  get <- function() x
  set_mat_inverse <- function(inverse) m_inverse <<- inverse
  get_mat_inverse <- function() m_inverse
  list(set=set, get=get, set_mat_inverse=set_mat_inverse, get_mat_inverse=get_mat_inverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

 m_inverse <- x$get_mat_inverse()      # If Inverse already available in cache then return that
  if(!is.null(m_inverse)) {
    message("We are getting data from cache.")
    return(m_inverse)
  }
  data <- x$get()                 #else compute inverse with provided data from othe fucntion
  m_inverse <- solve(data)
  x$set_mat_inverse(m_inverse)
  m_inverse


}

x = rbind(c(2, -4/7), c(-4/7, 2)) # Initialize matrix
m = makeCacheMatrix(x) #pass matrix to function
m$get()
cacheSolve(m)   # Identify that inverse is available or not
