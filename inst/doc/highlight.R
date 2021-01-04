## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  warning = FALSE,
  fig.width = 5.5,
  fig.height = 5.5
)

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(ggcharts)
library(dplyr)
data("biomedicalrevenue")
revenue2018 <- biomedicalrevenue %>%
  filter(year == 2018)

## ---- warning=FALSE-----------------------------------------------------------
bar_chart(
  revenue2018,
  company,
  revenue,
  top_n = 10,
  highlight = "Roche"
)

## -----------------------------------------------------------------------------
ggcharts_set_theme("theme_ng")
bar_chart(
  revenue2018,
  company,
  revenue,
  top_n = 10,
  highlight = "Roche"
)

## -----------------------------------------------------------------------------
ggcharts_set_theme("theme_ggcharts")
spec <- highlight_spec(
  what = "Roche",
  highlight_color = "black",
  other_color = "lightgray"
)
bar_chart(
  revenue2018,
  company,
  revenue,
  top_n = 10,
  highlight = spec
)

## -----------------------------------------------------------------------------
bar_chart(
  revenue2018,
  company,
  revenue,
  top_n = 10,
  highlight = c("Roche", "Novartis")
)

## -----------------------------------------------------------------------------
spec <- highlight_spec(
  what = c("Roche", "Novartis"),
  highlight_color = c("steelblue", "darkorange")
)
lollipop_chart(
  revenue2018,
  company,
  revenue,
  top_n = 10,
  highlight = spec
)

## ---- fig.width=8, fig.height=8-----------------------------------------------
biomedicalrevenue %>%
  filter(year %in% c(2012, 2014, 2016, 2018)) %>%
  bar_chart(
    company,
    revenue,
    facet = year,
    top_n = 12,
    highlight = "Bayer"
  )

