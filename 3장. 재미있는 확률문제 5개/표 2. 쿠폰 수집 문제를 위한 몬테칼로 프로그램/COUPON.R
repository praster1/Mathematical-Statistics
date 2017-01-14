n = 365;
Nrepeat = 1000;
Xrecord = rep(0, Nrepeat)
sum1 = 0;

for (i in 1:Nrepeat)
{
	sum0=0;
	
	for (coupon in 2:n)
	{
		theta=1-(coupon-1)/n;
		success = 0;
		
		while(success == 0)
		{
			if (runif(1) < theta) {	success=1;	}
			sum0 = sum0 + 1- success;
		}
		
		x = n + sum0;
		Xrecord[i] = x;
	}
	
	sum1 = sum1 + x;
}

mean0 = sum1/Nrepeat;
mean0

hist(Xrecord)	# <그림 3> 쿠폰 수 분포 (n=365, 몬테칼로 시행결과) : 유재성