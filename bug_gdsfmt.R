library(gdsfmt)

gds_file <- 'bug.gds'

unlink(gds_file)

cnts <- TRUE

createfn.gds(gds_file, allow.duplicate = TRUE)

####################################################################
#                       FIRST
gds <- openfn.gds(gds_file, FALSE, TRUE, TRUE)
add.gdsn(gds, 'SAMPLES', val = iris, compress = '')
print('1. new node ok')
closefn.gds(gds)

if (cnts) {
  gds <- openfn.gds(gds_file, FALSE, TRUE, TRUE)
  add.gdsn(gds, 'CNTS', val = matrix(1:100, ncol = 10), valdim = c(10, 10))
  closefn.gds(gds)
}
####################################################################

####################################################################
#                       SECOND (NEW NODE)
gds <- openfn.gds(gds_file, FALSE, TRUE, TRUE)
add.gdsn(gds, 'SAMPLES2', val = rbind(iris, iris), compress = '')
print('2. new node ok')
closefn.gds(gds)

if (cnts) {
  gds <- openfn.gds(gds_file, FALSE, TRUE, TRUE)
  add.gdsn(gds, 'CNTS2', val = matrix(1:100, ncol = 10), valdim = c(10, 10))
  print('CNTS2')
  closefn.gds(gds)
}
####################################################################

####################################################################
#                       THIRD (REPLACE NODE)
gds <- openfn.gds(gds_file, FALSE, TRUE, TRUE)
add.gdsn(gds, 'SAMPLES', val = rbind(iris, iris), compress = '', replace = TRUE)
print('3. replace ok')
closefn.gds(gds)

if (cnts) {
  gds <- openfn.gds(gds_file, FALSE, TRUE, TRUE)
add.gdsn(gds, 'CNTS3', val = matrix(1:100, ncol = 10), valdim = c(10, 10))
print('CNTS3')
closefn.gds(gds)
}
####################################################################

####################################################################
#                       FOURTH (REPLACE NODE)
gds <- openfn.gds(gds_file, FALSE, TRUE, TRUE)
add.gdsn(gds, 'SAMPLES', val = rbind(iris, iris), compress = '', replace = TRUE)
print('4. replace ok')
closefn.gds(gds)

if (cnts) {
gds <- openfn.gds(gds_file, FALSE, TRUE, TRUE)
add.gdsn(gds, 'CNTS4', val = matrix(1:100, ncol = 10), valdim = c(10, 10))
print('CNTS4')
closefn.gds(gds)
}
####################################################################
