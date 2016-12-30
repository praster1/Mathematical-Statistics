p = 18/38;    q = 1-p;
k = 5;        n = 10 ;
Nrepeat=1000;
S = rep(0, Nrepeat)		# Value 1 = Ruin, Value 0 = Success
T = rep(0, Nrepeat)		# Real Value := Game Duration Time

for (i in 1:Nrepeat)
{
	position = k;
	time = 0;
	
	while((position > 0) & (position < n))
	{
		position = ifelse(runif(1)< p, position+1, position-1)
		time = time + 1;
	}
	
	if (position == 0) {	S[i] = 1;	}
	T[i] = time;
}

mean1 = sum(S)/Nrepeat
mean2 = sum(T)/Nrepeat

mean1
mean2


hist(T)	# <그림 2> 게임 수 분포 (몬테칼로 시행결과) : 유재성