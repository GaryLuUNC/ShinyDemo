library(shiny);
library(readr);
library(ggplot2);

Summer_Olympic_Medals <- read.csv("Summer-Olympic-medals-1976-to-2008.csv");

ui <- fluidPage(
  sliderInput(inputId="n", "Year", min = 1976, max = 2008, value=1976, step=4), 
  plotOutput(outputId = "barplot")
);

server <- function(input,output,session){
  output$barplot <- renderPlot({
    data <- Summer_Olympic_Medals %>% mutate(in_year=(Year==4*floor((input$n)/4))) %>% select(Country_Code, in_year) %>% group_by(Country_Code) %>% summarise(Count=sum(in_year)) %>% drop_na()
    
    data %>% ggplot(aes(x=Country_Code, y=Count))+ylim(0, 350)+theme(axis.text.x = element_text(angle = 90))+labs(y="Number of Medals Won")+geom_bar(stat="identity")
  })
}

shinyApp(ui=ui,server=server,
         options=list(port=8080, host="0.0.0.0"))

