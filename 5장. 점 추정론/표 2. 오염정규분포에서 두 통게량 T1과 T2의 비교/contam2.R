theta = 10;  sigma = 1;  n = 40;  n1 = n*0.9;
Nrepeat = 1000;

stats = function(x, n)		# Computing Median and Mean
{
	r = rank(x);  x1 = rep(0, n);
	
	for (i in 1:n)
	{
		x1[r[i]] = x[i];
	}
	
	if (n %/%2 == 0)	{		median0 = (x1[n/2] + x1[n/2+1])/2;	}	
	else	{		median0 = x1[(n+1)/2];	}
	
	mean0 = sum(x)/n;

	result = list(mean0 = mean0, median0 = median0)
	return(result)
}


for (k in 1:5)
{
	x = rep(0, n);  M1 = rep(0, Nrepeat);  M2 = rep(0, Nrepeat);

	# Monte-Carlo Generation of Contaminated Samples
	for (m in 1:Nrepeat)
	{
		for (i in 1:n)
		{
			x[i] = theta + sigma*rnorm(1);
		}

		for (i in (n1+1):n)
		{
			x[i] = theta + k*sigma*rnorm(1);
		}

		M1[m] = stats(x, n)$mean0;  M2[m] = stats(x, n)$median0;
	}
	
	
	mean1 = sum(M1)/Nrepeat;
	var1 = (sum(M1^2) - Nrepeat*mean1*mean1)/(Nrepeat-1);
	mean2 = sum(M2)/Nrepeat;
	var2 = (sum(M2^2) - Nrepeat*mean2*mean2)/(Nrepeat-1);
	print(paste("n = ", n, "   k = ", k , "   mean1 = ", mean1, "   var1 = ", var1, "   mean2 = ", mean2, "   var2 = ", var2, sep=""))
}