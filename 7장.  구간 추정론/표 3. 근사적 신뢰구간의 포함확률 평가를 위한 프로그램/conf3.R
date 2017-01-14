n = 4;  theta = 2;
Nrepeat = 10000;
Ncover=0;
for (i in 1:Nrepeat)
{
	sum = 0;
	for (j in 1:n)
	{
		count = -1;
		sum1 = 0;
		while(sum1 < 1)
		{
			t = -(1/theta)*log(1-runif(1));
			sum1 = sum1 + t;
			count = count + 1;
		}
		X = count;
		sum = sum + X;
	}
	
	Xbar = sum / n;
	U = Xbar + 1.96*sqrt(Xbar/n);
	L = Xbar - 1.96*sqrt(Xbar/n);
	cover=0;
	
	if (theta <= U)
	{
		if (theta >= L)
		{
			cover=1;
		}
	}
	Ncover = Ncover + cover;
}

coverage = Ncover / Nrepeat;

theta
Nrepeat
coverage

