n = 4;  s = 22;

### for upper limit
ntheta0=0.01;  ntheta1=20*n;  diff=1;  iter=1;
while(diff > 0.0001)
{
	ntheta = (ntheta0+ntheta1)/2;
	temp1 = 1; temp2 = exp(-ntheta);
	cumprob = temp2;
	for (k in 1:s)
	{
		temp1 = temp1*ntheta/k;
		prob = temp1*temp2;
		cumprob = cumprob + prob;
	}
	diff = abs(cumprob-0.025);
	theta = ntheta/n;
	
	if (cumprob < 0.025)	{		print(paste("Upper : iter = ", iter, "   cumprob = ", cumprob, "   theta = ", theta, sep=""))	}
	
	if (cumprob > 0.025)	{		ntheta0 = ntheta;	}
	else 							{		ntheta1 = ntheta;	}
	
	iter = iter + 1;
}



### for lower limit
ntheta0=0.01;  ntheta1=20*n;  diff=1;  iter=1;
while(diff > 0.0001)
{
	ntheta=(ntheta0+ntheta1)/2;
	temp1 = 1; temp2 = exp(-ntheta);
	cumprob = temp2;
	for (k in 1:(s-1))
	{
		temp1 = temp1*ntheta/k;
		prob = temp1*temp2;
		cumprob = cumprob + prob;
	}
	diff = abs(cumprob-0.975);
	theta = ntheta/n;
	
	if (cumprob < 0.975)	{		print(paste("Lower : iter = ", iter, "   cumprob = ", cumprob, "   theta = ", theta, sep=""))	}
	
	if (cumprob > 0.975)	{		ntheta0 = ntheta;	}
	else 							{		ntheta1 = ntheta;	}
	
	iter = iter + 1;
}
