## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  message = FALSE,
  warning = FALSE,
  fig.width = 6,
  fig.height = 4
)

## ----setup--------------------------------------------------------------------
library(ggcharts)
library(dplyr)

## -----------------------------------------------------------------------------
scatter <- ggplot(mtcars, aes(hp, mpg)) + geom_point(color = "darkorange")
scatter + theme_hermit()

## -----------------------------------------------------------------------------
scatter + theme_hermit(axis = "xy", ticks = "xy")

## -----------------------------------------------------------------------------
scatter + theme_hermit(grid = "XY")

## ----message=FALSE, warning=FALSE---------------------------------------------
hist <- ggplot(diamonds, aes(price)) +
  geom_histogram(fill = "darkorange", color = "white") +
  scale_y_continuous(expand = expand_scale(mult = c(0, .05)))
hist + theme_nightblue()

## -----------------------------------------------------------------------------
hist + theme_nightblue(grid = "X")

## -----------------------------------------------------------------------------
hist + theme_nightblue(grid = "X", axis = "x", ticks = "x")

## -----------------------------------------------------------------------------
lollipop_chart(diamonds, cut, highlight = "Good")
ggcharts_set_theme("theme_ng")
lollipop_chart(diamonds, cut, highlight = "Good")

## -----------------------------------------------------------------------------
scatter + theme_ggcharts(axis = "xy")

## -----------------------------------------------------------------------------
hist + theme_ggcharts(axis = "x", grid = "X")

## -----------------------------------------------------------------------------
scatter + theme_ng(grid = "XYxy")

## -----------------------------------------------------------------------------
hist + theme_ng(axis = "xy", ticks = "y")

## -----------------------------------------------------------------------------
biomedicalrevenue %>%
  filter(year %in% c(2011, 2013, 2015, 2017)) %>%
  lollipop_chart(company, revenue, facet = year, highlight = "Roche", line_color = "yellow", top_n = 5) +
  theme_hermit(axis = "y", grid = "Y")

## -----------------------------------------------------------------------------
biomedicalrevenue %>%
  filter(company == "Novartis") %>%
  ggplot(aes(year, revenue)) +
  geom_line(color = "darkorange", size = 1) +
  theme_nightblue(axis = "x", ticks = "x", grid = "XY")

