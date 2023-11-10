library(DT)
library(ggplot2)
library(shinydashboard)
library(flexdashboard)
library(shinyWidgets)
library(leaflet)
library(shinydashboardPlus)
function(input,output,session){




output$structure1 <- renderPrint(
  Education %>%
    str()
)
output$structure2 <- renderPrint(
  RLFS_Tables %>%
    str()
)

output$structure3 <- renderPrint(
  RLFS_Disabled %>%
    str()
)


output$summary1 <- renderPrint(
  Education%>%
    summary()
)

output$summary2 <- renderPrint(
  RLFS_Tables %>%
    summary()
)

output$summary3 <- renderPrint(
  RLFS_Disabled%>%
    summary()
)

output$dataT <- renderDataTable(
  Education

)

output$datay <- renderDataTable(
  project_2

)

output$datax <- renderDataTable(
  RLFS_Disabled

)

output$dataz <- renderDataTable(
  RLFS_Tables

)
output$population <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(34, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("green", "tomato")),
        label = paste("POPULATION"))

})

output$males <- renderGauge({
  value <- sample(0:13246394, 1)
  gauge(6429326, min = 0, max = 13246394,
        label = paste("MALES"))

})

output$females <- renderGauge({
  value <- sample(0:13246394, 1)
  gauge(6817068, min = 0, max = 13246394,
        label = paste("FEMALES"))

})

data_to_download <- reactive({
  Project_1
})

output$downloadDatap1 <- downloadHandler(
  filename = function(){
    paste("project_1",Sys.Date(),
          ".csv",sep = "")
  },
  content = function(file){
    write.csv(data_to_download(),file)
  }
)

output$labor <- renderPlot({

  project_2 <- data.frame(
    column1 = c("total", "males", "females"),
    laborforce = c(4463296, 2497448, 2055848)
  )
 e <- ggplot(project_2, aes(x = column1, y = laborforce)) +
    geom_bar(stat = "identity", fill = "darkgray", ) +geom_text(aes(label = laborforce),vjust = -0.5) + labs(x ="", y ="laborforce") + theme_bw()+
    labs(title = "",)   + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))

  print(e)
})
output$employed1 <- renderPlot({

  project_2 <- data.frame(
    column1 = c("total", "males", "females"),
    employed = c(3546352, 1977704, 1568648)
  )


 f <- ggplot(project_2, aes(x = column1, y = employed)) +
    geom_bar(stat = "identity", fill = "tomato", )+geom_text(aes(label = employed),vjust = -0.5) + labs(x ="", y ="employed") + theme_bw() +
    labs(title = " ")   + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))

  print(f)
})
output$unemployed <- renderPlot({

  project_2 <- data.frame(
    column1 = c("total", "males", "females"),
    unemployed = c(916944, 429744,487200)
  )


 d <- ggplot(project_2, aes(x = column1, y = unemployed)) +
    geom_bar(stat = "identity", fill = "cyan", ) +geom_text(aes(label =unemployed),vjust = -0.5) + labs(x ="", y ="unemploed") + theme_bw()+
    labs(title = "")   + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))

  print(d)
})
output$outside <- renderPlot({

  project_2 <- data.frame(
    column1 = c("total", "males", "females"),
    outsidelabourforce = c(3500290,1346420,2153870)
  )


 g <- ggplot(project_2, aes(x = column1, y = outsidelabourforce)) +
    geom_bar(stat = "identity", fill = "violet", ) +geom_text(aes(label = outsidelabourforce),vjust = -0.5) + labs(x ="", y ="outsidelabor") + theme_bw()+
    labs(title = " ")   + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))

  print(g)
})
output$laborunderutilization <- renderPlot({

  project_2 <- data.frame(
    column1 = c("total", "males", "females"),
    laborunderutilization = c(3500290,1346420,2153870)
  )


 p <- ggplot(project_2, aes(x = column1, y = laborunderutilization)) +
    geom_bar(stat = "identity", fill = "lightgreen") +geom_text(aes(label = laborunderutilization),vjust = -0.5) + labs(x ="column2", y ="underutilization") + theme_bw()+
    labs(title = " ")  + theme(panel.background = element_rect(fill = "gray")) +
   theme(axis.text.x = element_text(size = 16),
         axis.text.y = element_text(size = 16),
         axis.title.x = element_text(size = 18),
         axis.title.y = element_text(size = 18),
         plot.title = element_text(size = 20))


 print(p)

})


data_to_download <- reactive({
 project_2
})

output$downloadDatap <- downloadHandler(
  filename = function(){
    paste("project_2",Sys.Date(),
          ".csv",sep = "")
  },
  content = function(file){
    write.csv(data_to_download(),file)
  }
)

output$none <- renderPlot({

  Education <- data.frame(
    column2 = c("total", "males", "females"),
    none = c(3581239,1672594,1908646)
  )


  i <- ggplot(Education, aes(x = column2, y = none)) +
    geom_bar(stat = "identity", fill = "darkgray") +geom_text(aes(label =none),vjust = -0.5) + labs(x ="column2", y ="none") + theme_bw()+
    labs(title = "")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(i)
})
output$pri <- renderPlot({

  Education <- data.frame(
    column2 = c("total", "males", "females"),
    primary = c(2619100,1215943,1403157)
  )


  j <- ggplot(Education, aes(x = column2, y = primary)) +
    geom_bar(stat = "identity", fill = "darkmagenta") +geom_text(aes(label = primary),vjust = -0.5) + labs(x ="column2", y ="primary") + theme_bw()+
    labs(title = " ")  +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))

  print(j)
})
output$lower <- renderPlot({

  Education <- data.frame(
    column2 = c("total", "males", "females"),
    lowersecondary = c(745539,341982,403557)
  )


  k <- ggplot(Education, aes(x = column2, y =lowersecondary)) +
    geom_bar(stat = "identity", fill = "chocolate") +geom_text(aes(label = lowersecondary),vjust = -0.5) + labs(x ="", y ="lowersecondary") + theme_bw()+
    labs(title = "")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(k)
})
output$upper <- renderPlot({

  Education <- data.frame(
    column2 = c("total", "males", "females"),
    uppersecondary = c(689138,336569,352569)
  )


  l <- ggplot(Education, aes(x = column2, y = uppersecondary)) +
    geom_bar(stat = "identity", fill = "skyblue") +geom_text(aes(label = uppersecondary),vjust = -0.5) + labs(x ="", y ="uppersecondary") + theme_bw()+
    labs(title = " ")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(l)
})
output$university <- renderPlot({

  Education <- data.frame(
    column2 = c("total", "males", "females"),
    university = c(328571,186781,141790)
  )


  m <- ggplot(Education, aes(x = column2, y = university)) +
    geom_bar(stat = "identity", fill = "coral") +geom_text(aes(label =university),vjust = -0.5) + labs(x ="", y ="university") + theme_bw()+
    labs(title = " ")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(m)
})
output$substance <- renderPlot({

  Education <- data.frame(
    column2 = c("total", "males", "females"),
    currentlystudying = c(994230,494636,499594)
  )


  n <- ggplot(Education, aes(x = column2, y =currentlystudying)) +
    geom_bar(stat = "identity", fill = "orchid") +geom_text(aes(label = currentlystudying),vjust = -0.5) + labs(x ="", y ="currentlystudying") + theme_bw()+
    labs(title = "")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(n)
})

output$notsubstance <- renderPlot({

  Education <- data.frame(
    column2 = c("total", "males", "females"),
    notcurrentlystudying = c(6969356,3259233,3710124)
  )


  o <- ggplot(Education, aes(x = column2, y =notcurrentlystudying)) +
    geom_bar(stat = "identity", fill = "lightgreen") +geom_text(aes(label = notcurrentlystudying),vjust = -0.5) + labs(x ="", y ="notcurrentlystudying") + theme_bw() +
    labs(title = " ")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(o)
})

data_to_download <- reactive({
  Education
})

output$downloadData <- downloadHandler(
  filename = function(){
    paste("education",Sys.Date(),
          ".csv",sep = "")
  },
  content = function(file){
    write.csv(data_to_download(),file)
  }
)


output$downloadplot <- downloadHandler(
  filename = function(){
    paste("education",Sys.Date(),
          ".pdf",sep = "")
  },
  content = function(file){
    write.pdf(file,plot =output$notsubstance())
  }
)

output$laborforce1 <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(56, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("green", "tomato")),
        label = paste("% LABOR FORCE"))
})
output$noneg <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(63, min = 0, max = 100,
        gaugeSectors(success =c(0, 49),

                     danger = c(50,100),
                     colors = c("tomato","green")),
        label = paste("% NONE"))
})
output$prig <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(54, min = 0, max = 100,   gaugeSectors(success =c(0, 49),

                                               danger = c(50,100),
                                               colors = c("tomato","green" )),
        label = paste("% PRIMARY"))
})
output$lowerg <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(45, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("yellow", "tomato")),
        label = paste("% LOWER"))
})
output$upperg <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(34, min = 0, max = 100,
        gaugeSectors(success = c(0, 49),

                     danger = c(50,100),
                     colors = c("yellow", "tomato")),
        label = paste("% UPPER"))
})
output$universityg <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(12, min = 0, max = 100,
        gaugeSectors(success = c(0, 49),

                     danger = c(50,100),
                     colors = c("tomato","green" )),
        label = paste("%UNIVERSITY"))
})



output$agri <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(46.8, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("green", "tomato")),
        label = paste("% agriculture"))
})
output$service <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(35.9 , min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c( "tomato","green")),
        label = paste("% service"))
})



output$industry <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(17.3 , min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("tomato", "green")),
        label = paste("% industry"))
})




output$laborpie <- renderPlot({
  Education <- labor_force_data()

  ggplot(Education, aes(x = "", y = none, fill = column2)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar(theta = "y") +
    labs(fill = "none") +
    theme_void()
})


labor_force_data <- function() {
  Education <- data.frame(
    column2 = c("agriculture", "services","industry"),
    none = c(46.8,35.9,17.3)
  )
  return(Education)

}
output$image2 <- renderImage({
  Education <- labor_force_data()  # Replace with your actual labor force data
  png("plot.png", width = 500, height =200, res = 52)
  print(plot)
  dev.off()


  list(src = "force.png", width = 1200, height = 500)
},deleteFile = FALSE)




output$image3 <- renderImage({
  Education <- labor_force_data()



  png("plot.png", width = 650, height = 250, res = 52)
  print(plot)
  dev.off()


  list(src = "about2.png", width = 1200, height = 430)
},deleteFile = FALSE)


output$outsidelabor <- renderPlot({

  labor_force <- data.frame(
    column3 = c("males", "females","total" ),
    outside = c(1346420,2153870,3500290)
  )

  n <- ggplot(labor_force, aes(x = column3, y =outside)) +
    geom_bar(stat = "identity", fill = "darkgreen") +geom_text(aes(label = outside),vjust = -0.5) + labs(x ="", y ="outside") + theme_bw()+
    labs(title = "")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(n)
})
output$employed <- renderPlot({

  labor_force <- data.frame(
    column3 = c("males", "females","total" ),
    employed= c(1977704,1568648,3546352)
  )


  a <- ggplot(labor_force, aes(x = column3, y =employed)) +
    geom_bar(stat = "identity", fill = "brown") +geom_text(aes(label = employed),vjust = -0.5) + labs(x ="", y ="employed") + theme_bw()+
    labs(title = "")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(a)
})
output$employedrate <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(44.5, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c( "tomato","green")),
        label = paste("% employed"))
})
output$unemployedrate <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(43.9, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("green", "tomato")),
        label = paste("% outside"))
})
output$unemployed <- renderPlot({

  labor_force <- data.frame(
    column3 = c("males", "females","total" ),
    unemployed= c(1977704,1568648,3546352)
  )


  b <- ggplot(labor_force, aes(x = column3, y =unemployed)) +
    geom_bar(stat = "identity", fill = "lightblue") +geom_text(aes(label = unemployed),vjust = -0.5) + labs(x ="", y ="unemployed") + theme_bw()+
    labs(title = "")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(b)
})
output$outsiderate <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(20.5, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("green", "tomato")),
        label = paste("% unemployed"))
})

output$underutilization <- renderPlot({

  project_2 <- data.frame(
    column1 = c("males", "females","total" ),
    laborunderutilization= c(1459070,1829402,3288472)
  )


  f <- ggplot(project_2, aes(x = column1, y =laborunderutilization)) +
    geom_bar(stat = "identity", fill = "navy") +geom_text(aes(label = laborunderutilization),vjust = -0.5) + labs(x ="", y ="laborunderutilization") + theme_bw()+
    labs(title = "")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(f)
})
output$under <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(57.6, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("tomato","green" )),
        label = paste("% underutilization"))
})
output$piechart1 <- renderPlotly({
  labor_force <- pie_data
 labels <- paste(pie_data$column3,":",pie_data$employed)
  piechart1 <- plot_ly(

    labels = ~labels,
    values = ~count,
    theme_void(),
    type = 'pie'
  )
  piechart1 %>%
    layout(title ="sector distribution")
})
pie_data <- function() {
  labor_force <- data.frame(
    column3= c("agriculture", "services","industry"),
    employed = c(46.8,35.9,17.3)
  )
  return(labor_force)

}

output$laboryouth <- renderPlot({

  youth <- data.frame(
    column4 = c("males", "females","total" ),
    laborforce= c(1459070,1829402,3288472)
  )


  q <- ggplot(youth, aes(x = column4, y =laborforce)) +
    geom_bar(stat = "identity", fill = "lightgreen") +geom_text(aes(label = laborforce),vjust = -0.5) + labs(x ="", y ="laborforce") + theme_bw()+
    labs(title = "")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(q)
})
output$lyouth <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(34.6, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("tomato","green" )),
        label = paste("% youth in labor"))
})

output$employedyouth <- renderPlot({

  youth <- data.frame(
    column4 = c("males", "females","total" ),
    employed= c(1357468,753667,603801)
  )


  pq <- ggplot(youth, aes(x = column4, y =employed)) +
    geom_bar(stat = "identity", fill = "lightyellow") +geom_text(aes(label = employed),vjust = -0.5) + labs(x ="", y ="employed") + theme_bw()+
    labs(title = "")  + theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(pq)
})

output$unemployedyouth <- renderPlot({

  youth <- data.frame(
    column4 = c("males", "females","total" ),
    unemployed= c(1005408,215941,251641)
  )


  lq <- ggplot(youth, aes(x = column4, y =unemployed)) +
    geom_bar(stat = "identity", fill = "lightblue") +geom_text(aes(label = unemployed),vjust = -0.5) + labs(x ="", y ="unemployed") + theme_bw()+
    labs(title = "")  +theme(panel.background = element_rect(fill = "gray")) +
    theme(axis.text.x = element_text(size = 16),
          axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          plot.title = element_text(size = 20))


  print(lq)
})
output$eyouth <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(34.6, min = 0, max = 100,
        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("tomato","green" )),
        label = paste("% employed youth"))

})

output$uyouth <- renderGauge({
  value <- sample(100000:15000000, 1)
  gauge(34.6, min = 0, max = 100,


        gaugeSectors(success = c(50,100),

                     danger = c(0, 49),
                     colors = c("tomato","green" )),
        label = paste("% unemployed youth "))

})
output$disability<- renderImage({
  Education <- labor_force_data()



  png("plot.png", width = 650, height = 250, res = 52)
  print(plot)
  dev.off()


  list(src = "disability.png", width = 1200, height = 450)
},deleteFile = FALSE)


output$activities <- renderImage({
  Education <- labor_force_data()



  png("plot.png", width = 650, height = 250, res = 52)
  print(plot)
  dev.off()


  list(src = "activities.png", width = 1200, height = 430)
},deleteFile = FALSE)


output$educationy <- renderImage({
  Education <- labor_force_data()



  png("plot.png", width = 650, height = 250, res = 52)
  print(plot)
  dev.off()


  list(src = "education p.png", width = 1200, height = 430)
},deleteFile = FALSE)




}











