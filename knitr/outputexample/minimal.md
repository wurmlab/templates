# A minimal R Markdown example

I know the value of pi is 3.1416, and 2 times pi is 6.2832.
To compile me type: 

    library(knitr); knit('minimal.Rmd')

A _paragraph_ here. A code chunk below:


```r
1+1
```

```
## [1] 2
```

```r
.4-.7+.3 # what? it is not zero!
```

```
## [1] 5.551e-17
```

Graphics work too


```{r graphics, message=FALSE, fig.cap='A scatterplot of `cars`',
      fig.width=4, fig.height=2, dev='pdf'}
library(ggplot2)
qplot(speed, dist, data = cars) + geom_smooth()
```
