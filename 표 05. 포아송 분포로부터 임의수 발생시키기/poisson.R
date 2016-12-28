Nrepeat = 100;
theta = 2;
sum = 0;

for (i in 1:Nrepeat)
{
	count = -1;
	sum1 = 0;
	while(sum1 < 1)
	{
		t = -(1/theta)*log(1-runif(1));
		sum1 = sum1 + t;
		count = count + 1
	}
	N = count;	
	
	print(paste("N: ", N, sep=""))
	sum = sum + N;
}

mean = sum / Nrepeat;
mean