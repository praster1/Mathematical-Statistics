Nrepeat = 100;
sum = 0;
for (i in 1:(Nrepeat/2))
{
	R2 = -2*log(1-runif(0));
	theta = runif(0);
	x1 = sqrt(R2)*cos(2*pi*theta);
	x2 = sqrt(R2)*sin(2*pi*theta);
	
	print(paste("u: ", u, "   x1: ", x1, "   x2: ", x2, sep=""))
	sum = sum+x1+x2
}

mean = sum / Nrepeat;
mean