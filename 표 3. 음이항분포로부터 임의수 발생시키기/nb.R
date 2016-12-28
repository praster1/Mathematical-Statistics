r = 4; theta = 0.25
Nrepeat = 100
sum = 0

for (i in 1:Nrepeat)
{
	sum1 = 0; sum0 = 0;
	
	while(sum1 < r)
	{
		success = NULL;
		success = ifelse(runif(1) < theta,  1, 0)
		sum1 = sum1 + success;
		sum0 = sum0 + 1 - success;
	}
	
	x = sum0
	print(paste("x: ", x, sep=""))
	sum = sum + x;
}

mean = sum/Nrepeat;
mean