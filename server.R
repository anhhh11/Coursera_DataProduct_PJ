## server.r
require('rCharts')
require('caret')
library(shiny)

data <- read.csv("ENB2012_data.csv")
col_data <- rep(0,nrow(data)+1)
col_data[nrow(data)+1]=1
col_data = as.factor(col_data)
col_data = data.frame(col=col_data)

load("learnByRf_Y1.rda")
load("learnByRf_Y2.rda")

options(error = browser)
shinyServer(function(input, output) {
  input_data <- reactive({data.frame(
    X1=input$X1,
    X2=input$X2,
    X3=input$X3,
    X4=input$X4,
    X5=input$X5,
    X6=input$X6,
    X7=input$X7,
    X8=input$X8)})
  output$data <- renderPrint({input_data()})
  Y1 <- reactive(predict(learnByRf_Y1,input_data()))
  Y2 <- reactive(predict(learnByRf_Y2,input_data()))
  output$summa <- renderPrint({
    print("Quantile Heating Load(Y1):")
    quantile(data$Y1)
  })
  output$summa2 <-renderPrint({
    print("Quantile Cooling Load(Y2):")
    quantile(data$Y2)
  })
  output$Y1 <- renderPrint({
    print("Heating Load:")
    Y1()
  })
  output$Y2 <- renderPrint({
    print("Cooling Load ")
    Y2()
    })
  output$pmyChart <- renderChart({
    input$plotButton
    isolate({
      newData<-cbind(rbind(data[,c(9,10)],data.frame(Y1=Y1(),
                                      Y2=Y2())),col_data)
      p <- nPlot(Y2~Y1,data=newData,type="scatterChart",group="col",dom='pmyChart',width=480)
      p$chart(color = c('brown', 'blue'))
      return(p)
      })
    })
  output$data_description <- renderText(read_file("./README.md"))
  output$data <- renderDataTable(data)
})