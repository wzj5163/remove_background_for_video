# install.packages('ndtv', dependencies=T)

# dynamic network

rm(list = ls())

setwd("~/Documents/Code/Network_structure_based_portfolio/Gephi_project/dynamic network/TimeWindow_1120")

# Load Functions and other Files
source('./PackagesNetworkPortfolio.R')
source('./FunctionsNetworkPortfolio.R')

# load data
prices<-read_excel("SP500 securities.xlsx")
ZOO <- zoo(prices[,-1], order.by=as.Date(as.character(prices$Dates), format='%Y-%m-%d'))

#return
return<- Return.calculate(ZOO, method="log")
return<- return[-1, ]
returnstd<-xts(return)
p=dim(return)[2]

# set label
node.label=colnames(returnstd)
node.label<-gsub("Equity","",node.label)
node.label<-gsub("UN","",node.label)
node.label<-gsub("UW","",node.label)
names(returnstd) = node.label

# rolling window
W<-list()
for(t in 0: 166){
  W[[(t+1)]]=returnstd[(1+t*7):(500+t*7),]
}
W_in<-list()
W_out<-list()
for(t in 0: 166){
  W_in[[(t+1)]]=W[[t+1]][c(1:493),]
  W_out[[(t+1)]]=W[[t+1]][c(494:500),]
}
T.windows<-length(W)
# correlation matrix, Expected return, covariance matrix
d=data.frame()
for (t in 1:T.windows) {
  d[t,1]=index(W_in[[t]])[1]
  d[t,2]=index(W_in[[t]])[dim(W_in[[t]])[1]]
}
write.table(d, "FromTo.txt",  sep = " ", dec = ".",
            row.names = FALSE, col.names = FALSE)
