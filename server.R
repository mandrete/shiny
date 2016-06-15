library(shiny)
library(scatterD3)

function(input, output) {
  
  data <- reactive({
    t[1:input$scatterD3_nb,]
  })
  
  # output$scatterPlot <- renderScatterD3({
  #   size_var <- if (input$scatterD3_r == "None") NULL else data()[,input$scatterD3_r]
  #   scatterD3(x = data()[,input$x],
  #             y = data()[,input$y],
  #             lab = rownames(data()),
  #             xlab = input$x,
  #             ylab = input$y,
  #             col_var = input$inf,
  #             col_lab = input$inf,
  #             size_var = size_var,
  #             size_lab = input$scatterD3_r,
  #             key_var = rownames(data()),
  #             point_opacity = input$scatterD3_opacity,
  #             labels_size = input$scatterD3_labsize,
  #             lasso = TRUE,
  #             lasso_callback = "function(sel) {alert(sel.data().map(function(d) {return d.lab}).join('\\n'));}")
  # })
  
  output$scatterPlot <- renderScatterD3({
    size_var <- if (input$scatterD3_r == "None") NULL else data()[,input$scatterD3_r]
    scatterD3(x = t$x[1:input$scatterD3_nb],
              y = t$y[1:input$scatterD3_nb],
              xlab = 'X position',
              ylab = 'Y position',
              size_var = size_var,
              size_lab = print(paste0(input$scatterD3_r, ' Activity')),
              col_var = t$inf[1:input$scatterD3_nb],
              col_lab = print('Infection Status'),
              colors = c('firebrick','dodgerblue'),
              key_var = rownames(data()),
              point_size=70,
              size_range = c(10,500),
              transitions = TRUE,
              point_opacity = input$scatterD3_opacity,
              lasso = TRUE,
              lasso_callback = "function(sel) {alert(sel.data().map(function(d) {return 'HEY YOU'}).join('\\n'));}")
  })
}