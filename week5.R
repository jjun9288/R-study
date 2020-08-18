#####4.일변량 데이터
###4.1 범주형 데이터

res=c("y","n","y","y","y","n","n","y","y","y")
table(res)

#4.1.2막대 그래프
barplot(table(res),xlab="response",ylab="frequency")  #horiz=F 는 default 값
barplot(table(res),xlab="response",ylab="frequency",horiz=T)  #그래프가 수평으로 나옴

#4.1.3파이 그림
pie(table(res),main="response")

#4.1.4점 그림
dotchart(table(res),main="dotchart")

sales=c(50,39,47,45)
names(sales)=c("Amy","John","Jack","Lisa")
dotchart(sales,xlab="Amount of sales", main="dotchart")

#####4.2 숫자형 데이터

#4.2.1줄기-잎 그림
x=c(45,86,34,98,67,78,56,45,85,75,64,75,75,58,45,83,74)
stem(x)
stem(x,scale=2)

#4.2.2상자 그림
boxplot(x,main="Box plot",sub="basketball game scores")
boxplot(x,horizontal=T,main="Box plot",sub="basketball game scores")

#4.2.3히스토그램
hist(x)

hist(x,prob=TRUE,main="Histogram of scores with density line", sub="basketball")
lines(density(x))

###기술통계량
#4.2.4~4.2.5
mean(x)
median(x)
var(x)
sd(x)
IQR(x)	#사분위수범위(75%~25%사분위수)
range(x)	#범위 (최소값, 최대값)
quantile(x,c(0.1, 0.25, 0.5, 0.75, 0.9))	#사분위수
summary(x)	#기본적인 몇 가지 기초통계량 한번에 출력

#4.2.6표준화 점수
y=c(2,5,7,9,3)
scale(y)	#각 데이터에 대한 표준화된 값 출력
yy=round(scale(y), digit=2)	#소수점 둘 째 자리까지

######5. 이변량 데이터
###5.1 범주형 데이터의 이원분할표
matrix(c(54,3,7,12))
#or
rbind(c(54,7),c(3,12))
cbind(c(54,3),c(7,12))
x=matrix(c(54,3,7,12), nc=2)
rownames(x)=c("p.buckled","p.unbuckled")
colnames(x)=c("c.buckled","c.unbuckled")
#주변분포
margin.table(x,1) 
margin.table(x,2)
addmargins(x)
prop.table(x)	#비율값 출력
#막대그래프
par(mfrow=c(1,2))
barplot(x,main="child seatbelt usage")	#진한 부분=p.buckled, 연한 부분=p.unbuckled
barplot(x,main="child seatbelt usage", legent.text=T, beside=TRUE) #따로 나타내고 싶으면

nico=read.csv(file="c:/r/nicotin.csv",sep=",",header=T)
nico
attach(nico)
y=table(nicotin,stopsmoke)

###5.2 상관계수(r)
#-1<=r<=1 이며 상관계수값이 0에 가까울수록 상관성이 없고 1에 가까울수록 강한 양의 상관성,
-1에 가까울수록 강한 음의 상관성을 갖는다.

blood=read.table("c:/R/blood.txt",header=TRUE)
blood
attach(blood)	#이거 안 하면 cor 할 때 객체 찾을 수 없다 뜸
rowMeans(blood[,2:3])	#1행~n행의 2~3열의 평균
colMeans(blood[,2:3])	#2열, 3열 평균

cor(machine,expert)

cor.test(machine,expert)
#p-value 값이 0.05보다 작으므로 유의수준 5%에서 기각, 즉 기계,간호사의 혈압측정값 간의
상관관계가 유의하다.