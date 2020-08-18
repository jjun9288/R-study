#####1.5 구조적인 데이터 만들기
seq(1,10)	#1 ~ 10
rev(1,10)	#10 ~ 1
seq(1,10,by=2)
rep(1,10)	#1 10번 반복
rep(1:3,3)	#1~3 3번 반복
rep(c(2,3,5),4)

#####1.6 데이터 벡터 다루기
x=c(100,120,130,124,150,167,170,163,160,155,145,157)
x[1]	#인덱스
x[9]
x[1:3]
x[c(6,7,9)]
names(x)=seq(1,12)
x
xm1=x[-1]	#1번째 인덱스 제거
xm2=x[-c(1,12)]	#1, 12번째 인덱스 제거
xx=x[x!=150]
xp=x[x>=150]

#####1.7 벡터와 행렬표현 연산
a=c(1,3,5)
b=matrix(1:6, nrow=2)	#행을 2개로
d=matrix(1:6, ncol=2)	#열을 2개로

x=c(1,2,3,4,5)
y=c(-1,-2,-3,-4,-5)
x+y	#각 열 더해서 출력 (0,0,0,0,0)
t(x)%*%y	#행렬의 곱셈
x%*%t(x)
x*y	#각 원소의 곱
x*x

temp=c(x,y)
temp1=cbind(x,y)	#행을 2개로
temp2=rbind(x,y)	#열을 2개로

library(MASS)
a1=c(34.74,15.66)
a2=c(15.66, 378.60)
s=rbind(a1,a2)
solve(s)	#역행렬

eigen(s)
lambda=eigen(s)
lambda	#고유값, 고유벡터
attributes(lambda)
lambda$values[[1]]
lambda$values[[2]]
lambda$vectors[,1]
lambda$vectors[,2]


#####1.8 반복문
for(i in 1:4) print(i)

isum=0
for(i in 100:200) isum=isum+i
print(isum)	#100~200 까지 합

x=c(5,6,7,8)
n=length(x)
xx=rep(0,n)	#(0,0,0,0)

for(j in 1:n) {
	xx[j]=x[j]*2
	print(xx[j])
}

n=0
sum.sofar=0
while(sum.sofar<=100){
	n=n+1
	sum.sofar=sum.sofar+n
}
print(n); print(sum.sofar)

n=0
sum.sofar=0
repeat{
	n=n+1
	sum.sofar=sum.sofar+n
	if(sum.sofar>100) break
}
print(n); print(sum.sofar)

#####1.9 조건문
x=c(1,-2,-3,4,5)
pos=rep(0,5)
for(i in 1:5) {
	if(x[i]>0) pos[i]=1
	else pos[i]=0
	}
print(pos)

