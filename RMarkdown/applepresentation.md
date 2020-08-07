Apple Presentation
================

## First

[**8/6/20:applepresentation.R**](../R/applepresentation.R): I used the
officer package in R to produce a ppt. Functions like `add_slide()` and
`ph_with()` assisted in creating slides and adding content.

``` r
source("../R/applepresentation.R")
```

    ## `geom_smooth()` using formula 'y ~ x'
    ## `geom_smooth()` using formula 'y ~ x'
    ## `geom_smooth()` using formula 'y ~ x'
    ## `geom_smooth()` using formula 'y ~ x'

``` r
print(apple_pres, target = "../apple_pres.pptx")
```
