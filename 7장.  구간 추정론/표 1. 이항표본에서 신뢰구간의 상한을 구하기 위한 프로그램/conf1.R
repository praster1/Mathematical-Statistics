theta0=0;  theta1=1;  diff=1;  n = 100;  s = 57;  iter = 1;
while(diff > 0.0001)
{
	theta = (theta0+theta1)/2;
	temp1 = 1; temp2 = (1-theta)^n;
	cumprob = temp2;
	for (k in 1:s)
	{
		temp1 = temp1*(n-k+1)/k*theta/(1-theta);
		prob = temp1*temp2;
		cumprob = cumprob + prob;
	}
	diff = abs(cumprob-0.025);
	
	if (cumprob < 0.025)	{		print(paste("iter = ", iter, "   cumprob = ", cumprob, "   theta = ", theta, sep=""))	}
	
	if (cumprob > 0.025)	{		theta0 = theta;	}
	else 							{		theta1 = theta;	}
	
	iter = iter + 1;
}