#####1.10 결측값

x=c(1,6,2,NA)
ls.na(x)    #(False,False,False,True)로 나오는데, True가 결측값이라는 뜻

mean(x)	#결측값이 존재하면 NA로 출력
mean(x,na.rm=TRUE)

xx=na.omit(x)	#결측값 제거
xx

r=rank(x, na.last=TRUE) #결측값에게 가장 큰 순위 부여
r
r=rank(x, na.last=FALSE)  #결측값에 가장 작은 순위 부여
r

#####1.11 내장된 데이터셋 읽기

data()
data(Orange)
head(Orange)
Orange[1,]
Orange[,1]
Orange$age
x1=Orange$age	#벡터값으로 저장

#####1.12 데이터파일 읽기와 결과값 저장하기
###txt 파일 불러오기
zzz=read.table("C:/R/test.txt", header=TRUE)
zzz

attributes(zzz)

zzz$x
zzz$y

zzz$x[1]

###excel 파일 불러오기 (csv형태로 저장할 것!)
zz=read.csv("C:/R/testc.csv", header=TRUE)
zz

### 저장하기
mydf=c(1,2,3)
write.table(mydf, "C:/R/mydf.txt", sep=",", row.names=FALSE)#FALSE 면 번호 안붙음
write.table(mydf, "C:/R/mydf.csv", sep=",", row.names=TRUE) #TRUE 면 번호 붙음

#파일 -> 작업디렉토리변경 -> C -> R : 이 작업디렉토리에 자동적으로 생산됨

my=c(4,5,6)
mm=cbind(mydf, my)

write.table(mm, "C:/R/mydf1.txt", sep=",", row.names=FALSE)
write.table(mm, "C:/R/mydf1.csv", sep=",", row.names=FALSE)

#####1.13 데이터셋 합치기
authors<-data.frame(
surname=c("Turkey","Venables","Tierney","Ripley","McNeil"),
nationality=c("US","Australia","US","UK","Australia"))

books<-data.frame(
name=c("Turkey","Venables","Tierney","Ripley","McNeil"),
year=c(1976,1995,1996,1998,2000))

d=merge(authors, books, by.x="surname", by.y="name") #surname 과 name 같으므로

books2<-data.frame(
name=c("Turkey","Venables","Tierney","Ripley","McNeil","Kim"),
year=c(1976,1995,1996,1998,2000,2008))

d2=merge(authors, books2, by.x="surname", by.y="name")    #Kim 출력 안됨
d3=merge(authors, books2, by.x="surname", by.y="name", all=TRUE) #Kim 출력 됨(결측값 포함)

x<-1:4; y<-2:4
L1<-list(x,y)
L1
L1<-list(3.14,y)
L1[1]

b<-factor(1:3)
b[1]
mode(b)	#numeric
length(b)	#3

x<-1:4; y<-2:5
data.frame(x,y)

#####2.1 간단한 그래프
x=(0:20)*pi/10
y1=cos(x)
plot(x,y1)
y2=sin(x)
plot(x,y2)

par(mfrow=c(2,1))	#한 화면에 두 개의 그래프를 각각 보여줌 c(2,1):위아래, c(1,2):좌우
x=(0:20)*pi/10
y1=cos(x); y2=sin(x)
plot(x,y1)
plot(x,y2)

yy=cbind(y1,y2,y3)
matplot(x, yy, pch="*", type="l")
plot(x,y1,type="l")	#맨 처음 그래프는 plot 으로 시작
lines(x,y2)			#그 후 겹치는 그래프들은 lines
lines(x,y3)

par(mfrow=c(2,2))
plot(x,y1, type="p")
plot(x,y1, type="l")
plot(x,y1, type="b")
plot(x,y1, type="p", pch=19, col="red")
#pch-point characteristic : 19번으로 지정된 점 이용, 19번은 속이 찬 점 형태임

par(mfrow=c(2,2))
plot(x,y1, type="b", main="cosine graph", sub="type=b")
plot(x,y1, type="o", las=1, bty="u",sub="type=o")
plot(x,y1, type="h", bty="7", sub="type=h")
plot(x,y1, type="s", bty="n", sub="type=n") 


