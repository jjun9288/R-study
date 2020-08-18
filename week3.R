#####2.2 그래프 조절 변수
data(cars)
attach(cars)
mean(speed); mean(dist)

par(mfrow=c(2,2))
plot(speed, dist, pch=1)
 abline(v=15.4)
plot(speed, dist, pch=2)
 abline(h=42.98)
plot(speed, dist, pch=3)
 abline(-17,4)	#y=-17+4x
plot(speed, dist, pch=8)
 abline(v=15.4)
 abline(h=42.98)

#####2.3 그래프 좌표축에 수식 쓰기
p=(1:100)/100
plot(p,sqrt(p*(1-p)),ylab=expression(sqrt(p(1-p))),type="b",main="Standard deviation")
plot(p, p*p, ylab=expression(p^2), type="l", las=1)

#####2.4 lattice 패키지
x=(0:20)*pi/10
y=cos(x)
z=sin(x)
win.graph()
plot(x,y)
win.graph()
plot(x,z)

library(lattice)
show.settings()

library(lattice)
head(Orange)
dim(Orange)	#행, 열의 갯수

#산점도
xyplot(circumference~age|Tree, data=Orange, main="Orange Trees")
#히스토그램
histogram(~circumference|Tree, data=Orange, main="Orange Trees")
#둘레 상자그림
bwplot(circumference~Tree, data=Orange, main="Orange Trees")
#나이 상자그림
bwplot(age~Tree, data=Orange, main="Orange Trees")

###산점도 행렬
data(iris)
iris[1,]
library(lattice)
splom(iris[1:4])

###구름 삼차원 산점도
data(iris)
iris[1,]
library(lattice)
cloud(Sepal.Length~Petal.Length*Petal.Width, data=iris, main="Cloud Plot", sub="iris darta")

###평행선 그림
parallel(~iris[1:4]|Species, data=iris)

###모자이크 그림
a=rbind(c(50,30), c(50,70))
colnames(a)=c("male", "female")
rownames(a)=c("survive","nosurvive")
mosaicplot(a,col=2:3)

data(HairEyeColor)
mosaicplot(HairEyeColor, shade=T)

#####2.5 3차원 그래프
x1<-seq(-3,3,length=50)
x2<-seq(-4,4,length=60)
f=function(x1,x2){x1^2+x2^2+x1*x2}
y=outer(x1,x2,FUN=f)
persp(x1,x2,y)	#3차원
contour(x1,x2,y)	#등고선

mu1<-0; mu2<-0; s11<-10; s12<-15; s22<-10; rho<-0.5
x1<-seq(-10,10,length=41); x2<-x1
f<-function(x1,x2){
term1<-1/(2*pi*sqrt(s11*s22*(1-rho^2)))
term2<-1/(2*(1-rho^2))
term3<-(x1-mu1)^2/s11
term4<-(x2-mu2)^2/s22
term5<-2*rho*((x1-mu1)*(x2-mu2))/(sqrt(s11)*sqrt(s22))
term1*exp(-term2*(term3+term4+term5))
}

z<-outer(x1,x2,f)
persp(x1,x2,z,main="Two dimensional Normal Distribution")
contour(x1,x2,z,xlab="x1",ylab="x2",mani="contour plot")

#####2.6 도형 그리기
###사각형
x=c(1,-1,-1,1,1)
y=c(1,1,-1,-1,1)
plot(x,y,type="l", axes=F, xlab="", ylab="")
title("Rectangle")

###원
z=seq(0,2*pi,length=500)
x=sin(z)
y=cos(z)
par(pin=c(5,5))
plot(x,y,type="l", axes=F, xlab="", ylab="")
title("Circle")

###나선
z=seq(6*pi, 30*pi, length=1000)
x=sin(z)/(0.1*z)
y=cos(z)/(0.1*z)
par(pin=c(5,5))
plot(x,y,type="l",axes=F, xlab="", ylab="")
title("Spiral")