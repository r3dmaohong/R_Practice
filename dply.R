##��O�ϯä��R�a

library(plyr)
# Let's extract the number of teams and total period of time
# covered by the baseball dataframe
summarise(baseball,
          duration = max(year) - min(year),
          nteams = length(unique(team)))
# Combine with ddply to do that for each separate id
head(ddply(baseball, "id", summarise,
           duration = max(year) - min(year),
           nteams = length(unique(team))))

head(ddply(baseball, .(id,team), c("nrow", "ncol")))

#####
#####

# Summarize a dataset by two variables
dfx <- data.frame(
  group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  sex = sample(c("M", "F"), size = 29, replace = TRUE),
  age = runif(n = 29, min = 18, max = 54)
)

# Note the use of the '.' function to allow
# group and sex to be used without quoting
ddply(dfx, .(group, sex), summarize,
      mean = round(mean(age), 2),
      sd = round(sd(age), 2))
ddply(dfx, c('group', 'sex'), summarize,
      mean = round(mean(age), 2),
      sd = round(sd(age), 2))


dfx <- data.frame(
  '�s��' = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  '�ʧO' = sample(c("M", "F"), size = 29, replace = TRUE),
  '�~��' = runif(n = 29, min = 18, max = 54)
)
ddply(dfx, c('�s��', '�ʧO'), summarize,
      mean = round(mean(�~��), 2),
      sd = round(sd(�~��), 2))

# An example using a formula for .variables
ddply(baseball[1:100,], ~ year, nrow)
# Applying two functions; nrow and ncol
ddply(baseball, .(lg), c("nrow", "ncol"))

# Calculate mean runs batted in for each year
rbi <- ddply(baseball, .(year), summarise,
             mean_rbi = mean(rbi, na.rm = TRUE))
# Plot a line chart of the result
plot(mean_rbi ~ year, type = "l", data = rbi)

# make new variable career_year based on the
# start year for each player (id)
base2 <- ddply(baseball, .(id), mutate,
               career_year = year - min(year) + 1
)



###
rm(list = ls()) #�h���u�@�Ŷ����Ҧ�����
gc() #�O��������
path<-"C:\\Documents and Settings\\wjhong\\�ୱ\\��Ʊ���\\�ϯä��R"
setwd(path)

##���媺�ϯüg�k
satisfy <- read.csv('Ū�̺��N�פ��R_1041129.csv')
##�p��U�����O���Ӽ�
ddply(satisfy, c('X2.�����O','X1.�ʧO'), nrow)

##�p��U�����O���������N��
ddply(satisfy , 'X2.�����O', summarize, mean = round(mean(X6.�P���A�ȻP�A��), 2), sd = round(sd(X6.�P���A�ȻP�A��), 2))

ddply(satisfy , c('X2.�����O','X1.�ʧO'), summarize, mean = round(mean(X6.�P���A�ȻP�A��), 2), sd = round(sd(X6.�P���A�ȻP�A��), 2))

##�p��U�����O�ʧO���������N��
rbi <- ddply(satisfy, 'X2.�����O', summarize, mean = round(mean(X6.�P���A�ȻP�A��), 2))
plot(mean ~ X2.�����O, type = "l", data = rbi)
#head(ddply(baseball, .(id,team), c("nrow", "ncol")))

# Calculate mean runs batted in for each year
rbi <- ddply(satisfy, 'X2.�����O', nrow)
# Plot a line chart of the result
png(paste("C:\\Documents and Settings\\wjhong\\�ୱ\\plyr\\����", ".png", sep = ''), 
    width=1200, height=700)#, units="in", res=700)
plot(V1 ~ X2.�����O, type = "p", data = rbi)
dev.off()


#
#plot type =l =�u
#=p = �I
#=b =�I�u
#=h= histogram