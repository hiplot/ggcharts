## ---- include=FALSE-----------------------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE,
  fig.width = 7,
  fig.height = 5
)

## -----------------------------------------------------------------------------
library(dplyr)
library(ggplot2)
library(ggcharts)

dreaded_lang <- tibble::tribble(
  ~language, ~pct,
  "VBA", 75.2,
  "Objective-C", 68.7,
  "Assembly", 64.4,
  "C", 57.5,
  "PHP", 54.2,
  "Erlang", 52.6,
  "Ruby", 49.7,
  "R", 48.3,
  "C++", 48.0,
  "Java", 46.6
)

(chart <- lollipop_chart(dreaded_lang, language, pct, highlight = "R"))

## -----------------------------------------------------------------------------
chart <- chart +
  labs(
    x = NULL,
    y = "Developers Who are Developing with the Language but\nHave not Expressed Interest in Continuing to Do so",
    title = "Top 10 Most Dreaded Programming Languages",
    subtitle = "R Placed 8th",
    caption = "Source: Stackoverflow Developer Survey 2019"
  )
print(chart)

## -----------------------------------------------------------------------------
chart <- chart +
  scale_y_continuous(
    labels = scales::percent_format(scale = 1),
    expand = expand_scale(mult = c(0, .05)),
    limits = c(0, 80)
  )
print(chart)

## -----------------------------------------------------------------------------
chart <- chart +
  theme_classic(base_size = 15) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(face = "italic"),
    axis.text = element_text(color = "black")
  )
print(chart)

