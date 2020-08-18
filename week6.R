#####유의성 검정
###일집단 t검정

x=c(8.30,9.50,9.60,8.75,8.40,9.10,8.15,8.80)
t.test(x, mu=8.5)	#양측검정 (alt="two.sided" 는 default 값)	#H1: mu!=8.5
t.test(x, mu=8.5, alt="greater") #H1: mu>8.5
t.test(x, mu=8.5, alt="less")    #H1: mu<8.5

###이집단 t검정
x1=c(1.1,2.3,4.3,2.2,5.3)
x2=c(2.3,4.3,3.5)
t.test(x1,x2, var.equal=TRUE, alternative="two.sided")  #등분산일 경우 TRUE
t.test(x1,x2, var.equal=FALSE, alternative="two.sided") #아닐 경우 FALSE

t.test(x1,x2, var.equal=TRUE, alt"greater")	#H1: mu1>mu2
t.test(x1,x2, var.equal=TRUE, alt="less")		#H1: mu1<mu2

dd=read.table("C:/R/method.txt",header=T)
dd

t.test(x~method, var.equal=T, data=dd)	#등분산 가정일 경우 (var.equal=T)
t.test(x~method, var.equal=F, data=dd)	#등분산 아닐 경우 (var.equal=F)

#등분산 검정
var.test(x~method, data=dd)

#####짝지어진 표본에 대한 t검정
pre=c(77,56,64,60,58,72,67,78,67,79)
post=c(99,80,78,65,59,67,65,85,74,80)
t.test(post,pre,paired=T)

#####일집단 비율에 대한 검정
prop.test(x=110,n=150,p=0.85,alt="two.sided")	p^ = x/n