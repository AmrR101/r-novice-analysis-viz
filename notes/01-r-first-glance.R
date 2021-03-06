## ---- include = FALSE----------------------------------------------------
source("../bin/chunk-options.R")
knitr_fig_path("01-r-brief-introduction-")

## ------------------------------------------------------------------------
1 + 1

## ------------------------------------------------------------------------
foo <- 1 + 1
foo + 1

## ------------------------------------------------------------------------
randomNumbers <- rnorm(10)
mean(randomNumbers)

## ---- eval=FALSE---------------------------------------------------------
## ?mean

## ------------------------------------------------------------------------
is.numeric(1)
is.character("foo")
is.factor(factor(c("a", "b", "c", "c")))

## ------------------------------------------------------------------------
foo <- c(1, 2, 3)
foo[2]
bar <- 1
bar[1]

## ------------------------------------------------------------------------
(foo <- matrix(c(1, 2, 3, 4, 5, 6), nrow=2))

## ------------------------------------------------------------------------
(foo <- list(bar=c(1, 2, 3), baz=matrix(c(1, 2, 3, 4, 5, 6), nrow=2)))
foo[[2]]
foo$baz

## ------------------------------------------------------------------------
growth <- read.table(file = "data/yeast-growth.csv", header = TRUE, sep = ",")

## ------------------------------------------------------------------------
head(growth)
str(growth) # what data types are the different columns?
class(growth)

## ------------------------------------------------------------------------
dim(growth)

## ------------------------------------------------------------------------
 # first value in dat
growth[1, 1]
 # middle value in dat
growth[30, 2]

## ------------------------------------------------------------------------
growth[1:4, 1:2]

## ------------------------------------------------------------------------
growth[c(3, 8, 37, 56), c(1, 3)]

## ------------------------------------------------------------------------
growth[5, ]

## ------------------------------------------------------------------------
head(growth[growth$strain == "strain-e",])

## ------------------------------------------------------------------------
max(growth[growth$strain == "strain-e", "od"])

## ------------------------------------------------------------------------
min(growth[growth$strain == "strain-e", "od"])
mean(growth[growth$strain == "strain-e", "od"])
sd(growth[growth$strain == "strain-e", "od"])

## ------------------------------------------------------------------------
tapply(growth$od, growth$strain, max)

## ---- eval=FALSE---------------------------------------------------------
## install.packages("ggplot2")

## ------------------------------------------------------------------------
library(ggplot2)

## ------------------------------------------------------------------------
ggplot(growth, aes(x=timepoint, y=od)) +
    geom_point()

## ------------------------------------------------------------------------
ggplot(growth, aes(x=timepoint, y=od)) +
    geom_point() +
    geom_line()

## ------------------------------------------------------------------------
ggplot(growth, aes(x=timepoint, y=od, color=strain)) +
    geom_point() +
    geom_line()

## ------------------------------------------------------------------------
ggplot(growth, aes(x=timepoint, y=od)) +
    geom_point() +
    geom_line() +
    facet_wrap(~strain)

