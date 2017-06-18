## Reactive End (Frontend)

shinyUI(shinyUI(navbarPage("Word Predictor",theme = "bootstrap.css",
                           tabPanel("WordPrediction",fluidRow(
                               column(1),    
                               column(6,
                                      br(),h4("Input"),
                                      textInput("inputText", "Enter text here:", value=" "),
                                      fluidRow(
                                                 p("Welcome to the word predictor app. This application is designed to predict the next word based on phrases the user enters"),
                                                 br(),h4("How to use this app"),
                                                 p("The app predicts the next word based on user input. To use the app, please enter text in the input field. The algorithm is run every time the spacebar is used by the user and attempts to predict the next word based on the 4 previous words (if available). More information about the algorithm can be found in the documentation tab"),
                                                 br(),p("The prediction is displayed under the input field. The algorithm selects the 5 most likely words and assigns a score to each word. The score should not be understood as a percentage in the sense of 'The predictor is x % confident', it only shows the relative prediction between different words.")
                                                )
                              ),
                              column(1), 
                              column(5,
                                      h4("Prediction"),
                                      tableOutput("tbl")
                               )
                           )
                           ),
                           tabPanel("Make a Sentence",
                            fluidRow(column(12,
                                h4("Explanation"),p("The make a sentence tab allows the user to generate a sentence based on word prediction. The user can enter the number of additional words the app should predict and one or several words to start the sentence with. Then he has to enter the submit button to generate the sentence. There is also a randomizer funciton. If it yes, the words will be selected at random within the five highest ranked words the algorithm predicts. If it is no, the highest word will be chosen"),br()
                                )
                                ),
                            fluidRow(
                               column(3,
                                      h4("Number of Words"),
                                      sliderInput("n",NULL,min=1,max=10,value=5)
                                      ),
                               column(3,
                                      h4("Input"),
                                      textInput("inputText2", "Enter text here:", value="")
                               ),
                               column(1,
                                      h4("Submit"),
                                      br(),actionButton("Submit","Submit")
                                      ),
                               column(3,
                                      h4("Your sentence"),
                                      br(),textOutput("sntnce")
                               ), 
                               column(2,
                                      h4("Randomizer"),
                                      br(),radioButtons("s",label=NULL, choices=c("Yes","No"))
                                      )
                           )
                           ),
                           tabPanel("Documentation",
                                    br(),p("The app is documented in the markdown document and presentation that are linked below. You can also find the Github repository and a link to the source data."),
                                    h4("Links and Sources"),
                                    a("Markdown document describing this project",href="http://rpubs.com/MarkusAMS/WordPredictor"),br(),
                                    a("Presentation describing this project",href="https://rpubs.com/MarkusAMS/WordPredictorPresentation"),br(),
                                    a("Github Repository",href="https://github.com/markusams/WordPredictor"),br(),
                                    a("Find Source Data here",href="https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"),br(),
                                    a("This app uses the superhero theme via Bootstrap",href="http://bootswatch.com/superhero/"),br(),
                                    a("The algorithm is based on the Stupid Backoff algorithm",href="http://www.aclweb.org/anthology/D07-1090.pdf"))
)))
