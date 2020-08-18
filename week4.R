#####3.1 연속분포
###정규분포
#예1)
pnorm(-1,mean=0,sd=1,lower.tail=TRUE)	#P(X<=-1) mean,sd는 생략 가능
							#lower.tail=TRUE 는 default 이므로 생략 가능
x<-seq(-5,5,length=200)
y=dnorm(x,mean=0,sd=1)
plot(x,y,type="l",lwd=2,col="red")	#확률밀도함수 생성
x=seq(-5,-1,length=100)
y=dnorm(x,0,1)
polygon(c(-5,x,-1),c(0,y,0),col="gray")	# 해당 영역을 회색으로 칠함

#예2)
pnorm(-1,0,1,lower.tail=FALSE)	#P(X>-1)

x<-seq(-5,5,length=200)
y=dnorm(x,0,1)
plot(x,y,type="l",lwd=2,col="red")
x=seq(-1,5,length=100)
y=dnorm(x,0,1)
polygon(c(-1,x,5),c(0,y,0),col="gray")

#예3)
rnorm(1,100,16)

#예4)
#(a)
rnorm(5,mean=280,sd=10)		#or rnorm(5,280,10)
#(b)
pnorm(270,mean=280,sd=10)	#or pnorm(270,280,10)
#(c)
qnorm(0.1,mean=280,sd=10,lower.tail=TRUE)	#or qnorm(0.1,280,10)

#예5)
#(a)
qnorm(0.05,0,1)
#(b)
x=rnorm(100)
hist(x,probability=TRUE,  main="normal mu=0,sigma=1")
curve(dnorm(x), add=T)

par(mfrow=c(2,2))
#t분포
x=rt(1000,df=5)
y=dt(x,df=5)
plot(x,y,sub="t-dist")

#표준정규분포
x=rnorm(1000,0,1)
y=dnorm(x,0,1)
plot(x,y,sub="standard normal dist")

#지수분포
x=rexp(1000,rate=1)
y=dexp(x,rate=1)
plot(x,y,sub="exponential dist")

#포아송분포
x=rpois(1000,lambda=3)
y=dpois(x,lambda=3)
plot(x,y,sub="Poisson dist")


#####3.2 이산분포
###베르누이분포와 이항분포
#예) size=10, prob=0.3
#(a)
bin=dbinom(0:5, size=10, prob=0.3)
#(b)
x=c(1,6,8)
pbinom(x,size=10,prob=0.3)
#(c)
cump=c(0.2,0.5,0.8)
qbinom(cump,size=10,prob=0.3)
#(d)
rbinom(5,size=10,prob=0.3)

###포아송분포 (등호 조심!!)
#예) 평균3인 포아송분포 -> lambda=3
#(a)
ppois(1:4,lambda=3)
#(b)
qpois(0.2, lambda=3)
#(c)
rpois(10,lambda=3)
#(d)
ppois(3, lambda=3)	#or ppois(3,lambda=3,lower.tail=T) = P(X<=3)
#(e)
1-ppois(3,lambda=3)	#or ppois(3,lambda=3,lower.tail=F)
#(f)
ppois(5,lambda=3)-ppois(2,lambda=3)
#(g)
1-ppois(5,lambda=3,lower.tail=T)	#or ppios(5,lambda=3,lower.tail=F)

#####3.3 정규성 검정
###histogram
par(mfrow=c(2,3))	#->2행 3열 (5개 그래프 생성해서 넣기)
x=seq(6.5,13.5,by=0.01)
for(i in 1:5){
	y<-rnorm(50,mean=10,sd=1)	#난수 발생
	hist(y,prob=TRUE,xlim=c(6.5,13.5),ylim=(0,0.5))	#히스토그램
	lines(x,dnorm(x,10,1))	#정규분포곡선 추가
} 

###Q-Q plot
x=rnorm(20)
hist(x)
qqnorm(x)
qqline(x)
#H0:정규분포를 따른다 H1:정규분포를 따르지 않는다
x=rnorm(10)
shapiro.test(x)	#검정

#p-value가 0.9655가 나오는 것을 확인할 수 있고, 0.9655 > 0.5 이므로 
#유의수준 5%에서 H0를 기각하지 못한다.(채택)
#즉, x는 정규분포를 따른다고 할 수 있다.


par(mfrow=c(2,2))
#정규분포
x=rnorm(50)
qqnorm(x,sub="Normal")
qqline(x)
#균등분포
x=runif(50,min=0,max=1)
qqnorm(x,sub="Uniform")
qqline(x)
#지수분포
x=rexp(50,rate=1)
qqnorm(x,sub="Exponential")
qqline(x)
#포아송분포
x=rpois(50,lambda=3)
qqnorm(x,sub="Poisson")	#이산형이라서 계단 형태가 나오는 것을 확인할 수 있다.
qqline(x)	