library(shiny);
library(readr);
library(dplyr);
library(ggplot2);
library(tidyr);

Summer_Olympic_Medals <- read.csv("Summer-Olympic-medals-1976-to-2008.csv");

ui <- fluidPage(
  sliderInput(inputId="n", "Year", min = 1976, max = 2008, value=1976, step=4), 
  checkboxGroupInput(inputId="boxes", label="Medal Types", choices=c("Bronze", "Silver", "Gold"), selected=c("Bronze", "Silver", "Gold")),
  checkboxGroupInput(inputId="genders", label="Gender of Winner", choices=c("Men", "Women"), selected=c("Men", "Women")),
  plotOutput(outputId = "barplot")
);

server <- function(input,output,session){
  output$barplot <- renderPlot({
    data <- Summer_Olympic_Medals %>% mutate(included=(Year==4*floor((input$n)/4) & Medal %in% input$boxes & Gender %in% input$genders)) %>% 
      select(Country_Code, included) %>% group_by(Country_Code) %>% summarise(Count=sum(included)) %>% drop_na()
    
    data %>% ggplot(aes(x=Country_Code, y=Count))+ylim(0, 350)+theme(axis.text.x = element_text(angle = 90))+labs(y="Number of Medals Won")+
      geom_bar(stat="identity")
  })
}

shinyApp(ui=ui,server=server,
         options=list(port=8080, host="0.0.0.0"))



