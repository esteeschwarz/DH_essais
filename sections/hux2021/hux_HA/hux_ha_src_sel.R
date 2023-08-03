#selection<-c(0,0,0,1,1,0)
#groupvsall<-"SM"

dta_rtc<-get_rtc(dta) #create rtc column in dataset
draw.data<-function(check,setd){
  # NEU:
  #  tm1<--0
  # t0<--50
  #  t1<--0
  #  gilt<-1
  #  ctrl<--0
  #  out<--0
  out<-check
  # setout<-now.data(setd,tm1,t0,t1,out,gilt,ctrl)
}
draw.setvso<-function(check){
  out<-check
}
now.data<-function(setd,chose){
  dta_rtc<-get_rtc(setd) #create rtc column in dataset
  dta1<-dta_rtc
  dtat<-dtatarget(dta1,chose[1],chose[2],chose[3])
  if(chose[1]=="not"&chose[2]=="not"&chose[3]=="not"){dtat<-dta_rtc}
  dtag<-dtat
  ifelse(chose[5]==1,dtag<-subset(dtat,dtat$gilt==1),dtag<-dtat)
  dta_o<-dtag
  ifelse(chose[4]==1,dta_o<-outl.fun.rtc(dtag),dta_o<-dtag)
  dtac<-dta_o
  ifelse(chose[6]==1,dtac<-adcontrol(dta_o,ti0,ticontrol,ti2),dtac<-dta_o)
  return(dtac)
}

# Server -----------------------------------------------------------------------
#server <- function(input, output) {
#selection<-c(0,0,0,0,1,0)
#mydata<-selection
  # mydata <- reactive({
  #   draw.data(c(input$tm1,input$t0,input$t1,input$out,input$gilt,input$ctrl),dta)
  # })
#mydata_2<-groupvsall
  # mydata_2<-reactive({
  #   draw.setvso(input$groups)
  # })
  #### outputs:
  # output$info <- renderPrint({
  #   br()
  #   print("datenset according to selection")
  #   y<-mydata()
 #   y<-mydata
    dset<-now.data(dta,y)     
    # cat("dataset:",dim(dset)[1],"observations",dim(dset)[2],"variables")
 # }) # x<-proof_desc(mydata) #nur mit glt=1 (x,1,x)
  # ####
  # output$plot<- renderPlot({
  #   y<-mydata()
  #  y<-mydata
   # dset<-now.data(dta,y)     
    bar_df<-plot_desc(dset)
  #  ggplot(data=bar_df,mapping=aes(x=group,y=LZ,fill=RT)) + geom_col(position = "dodge")
#  })
  # output$eval<-renderPrint({
  #   y<-mydata()
  #  y<-mydata
   #     dset<-now.data(dta,y)
 #   cat("mean reading times (LZ) in ms per category\n")
   # print(bar_df<-plot_desc(dset)[,2:4])
    #x<-mydata_2()
  #  x<-mydata_2
    #print(x)
    #y<-mydata()
   # y<-mydata
    #dset<-now.data(dta,y)
    #print(dim(dset))
    dsetvso<-setvsx(dset,x,"Other")
    #print(dim(dsetvso))
  #  cat("comparing categories:",unique(dsetvso$category),"\n")
  #  print(plot_desc_compare(dsetvso,x,"All")[,2:4])
    # output$daten<-renderPrint({
    #   y<-mydata()
    #y<-mydata
     # dset<-now.data(dta,y)
    #  print(dset[1:10,1:30])
  #  })
  #})
  # output$compare<-renderPrint({
  #   x<-mydata_2()
  #   print(x)
  #   y<-mydata()
  #   dset<-now.data(dta,y)
  #   print(dim(dset))
  #   dsetvso<-setvsx(dset,x,"Other")
  #   print(dim(dsetvso))
  #   print(unique(dsetvso$category))
  #   print(plot_desc_compare(dsetvso,x,"All"))
  #     })
#  output$box<-renderPlot({
    #x<-mydata_2()
    # x<-mydata_2
    # #print(x)
    # other<-"Other"
    # #y<-mydata()
    # y<-mydata
    # dset<-now.data(dta,y)
    # #print(dim(dset))
    # dsetvso<-setvsx(dset,x,other)
    # #print(dim(dsetvso))
    # #print(unique(dsetvso$category))
    # #print(plot_desc_compare(dsetvso,x,"All"))
    # # bar_df<-cbind(dsetvso$timeinterval[group!=other],dsetvso$timeinterval[group==other])
    # boxplot(dset$timeinterval~group)
  #})
  #output$bars<-renderPlot({
    #x<-mydata_2()
  #  x<-mydata_2
    #print(x)
    other<-"Other"
   # y<-mydata
    #y<-mydata()
    #dset<-now.data(dta,y)
    #print(dim(dset))
    #dsetvso<-setvsx(dset,x,other)
    #print(dim(dsetvso))
    #print(unique(dsetvso$category))
    #print(plot_desc_compare(dsetvso,x,"All"))
  #  bar_df<-(plot_desc_compare(dsetvso,x,"All"))
   # ggplot(data=bar_df,mapping=aes(x=group,y=LZ,fill=RT)) + geom_col(position = "dodge")
    #p<-ggplot(df, aes(1:length(sentiment), sentiment, colour = book)) + 
      
    # p<-ggplot(data=bar_df, aes(x=group,y=LZ,fill=RT)) + 
    #   geom_col(position = "dodge")
    # p +  labs(x="group vs. All", y="Lesezeit", title="compare group vs. All")
    # 
 # })
  # output$frameout<-renderText({file=mdsrc_01})
  
  ### here subset dataset according to selection
  
  #   ####
#}
