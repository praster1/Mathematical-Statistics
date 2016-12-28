n = 10; theta = 0.25
Nrepeat = 100
sum = 0

for (i in 1:Nrepeat)
{
	sum1 = 0;
	
	for (j in 1:n)
	{
		success = ifelse(runif(1) < theta,  1, 0)
		sum1 = sum1 + success;
	}
	
	x = sum1;
	print(paste("x: ", x, sep=""))
	sum = sum + x;
}

mean = sum/Nrepeat;
mean