
``` r
library(magrittr)
library(ggplot2)
cranlogs::cran_downloads(package = c("mlr", "mlrMBO", "mlrCPO", "mlr3", "mlr3pipelines",
                                     "caret"), 
                         from = "2012-01-01", to = "2019-10-01") %>% 
  ggplot(aes(x = date, y = count)) + 
  geom_smooth(se = FALSE, size = 0.5) +
  facet_wrap(~ package, scales = "free_y") +
  labs(title = "Daily CRAN downloads from RStudio mirror", 
       subtitle = "Data query via package 'cranlogs'.") +
  theme_minimal()
```

    ## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->
