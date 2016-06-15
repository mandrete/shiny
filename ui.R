library(shiny)
library(scatterD3)

fluidPage(
  titlePanel("Cell signaling"),
  div(class="row",
      div(class="col-md-12",
          div(class="alert alert-warning alert-dismissible",
              HTML('<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'),
              HTML("<strong>What you can try here :</strong>
                   <ul>
                   <li>Zoom on the chart with the mousewheel</li>
                   <li>Pan the plot</li>
                   <li>Hover over a dot to display info</li>
                   <li>Try the lasso plugin with the toggle button or by using Shift+click</li>
                   </ul>")))),
  sidebarLayout(
    sidebarPanel(
      sliderInput("scatterD3_nb", "Number of cells",
                  min = 3, max = nrow(t), step = 1, value = nrow(t)),
      selectInput("scatterD3_r", "Reporter :",
                  choices = c("ERK" = "erk",
                              "JNK" = "jnk"),
                  selected = "jnk"),
      sliderInput("scatterD3_opacity", "Points opacity :", min = 0, max = 1, value = 1, step = 0.05),
      tags$p(actionButton("scatterD3-reset-zoom", HTML("<span class='glyphicon glyphicon-search' aria-hidden='true'></span> Reset Zoom")),
             actionButton("scatterD3-lasso-toggle", HTML("<span class='glyphicon glyphicon-screenshot' aria-hidden='true'></span> Toggle Lasso"), "data-toggle" = "button"),
             tags$a(id = "scatterD3-svg-export", href = "#",
                    class = "btn btn-default", HTML("<span class='glyphicon glyphicon-save' aria-hidden='true'></span> Download SVG"))),
      tags$ul(tags$li(tags$a(href = "https://github.com/juba/scatterD3", "scatterD3 on GitHub")),
              tags$li(tags$a(href = "https://github.com/juba/scatterD3_shiny_app", "This app on GitHub")))
    ),
    mainPanel(scatterD3Output("scatterPlot", height = "500px"))
  ))