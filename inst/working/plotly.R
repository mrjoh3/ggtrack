

p1 = plotly_empty(x = 1, y = 1) %>%
  layout(
    images = list(list(
      source = raster2uri(q, interpolate = FALSE),
      xref = "paper",
      yref = "paper",
      x = .5, y = .5,
      sizex = 1, sizey = 1,
      xanchor = "left", yanchor = "bottom"
    ))
  ) %>% layout(margin=list(l=10, r=10, b=0, t=0),
               xaxis=list(showticklabels=FALSE, ticks=""),
               yaxis=list(showticklabels=FALSE, ticks=""))



p2 <- plotly_empty(x = 1, y = 1) %>%
  layout(
    images = list(list(
      source = raster2uri(logo_imported),
      xref = "paper",
      yref = "paper",
      x = .5, y = .5,
      sizex = 1, sizey = 1,
      xanchor = "left", yanchor = "bottom"
    ))
  ) %>% layout(margin=list(l=10, r=10, b=0, t=0),
               xaxis=list(showticklabels=FALSE, ticks=""),
               yaxis=list(showticklabels=FALSE, ticks=""))

p3 <- plotly_empty(x = 1, y = 1) %>%
  add_text(text = 'some text here', x = .5, y = .5) %>%
  layout(margin=list(l=10, r=10, b=0, t=0),
         xaxis=list(showticklabels=FALSE, ticks=""),
         yaxis=list(showticklabels=FALSE, ticks=""))


bn <- subplot(p3, p2, p1, nrows = 1, widths = c(.6, .2, .2))

subplot(ggplotly(tracker), bn, nrows = 2, heights = c(.7,.3))



