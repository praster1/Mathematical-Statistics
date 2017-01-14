Nrepeat = 100;   ttheta = 0.5;    n = 20;       # ttheta = true theta value
MLE = rep(0, Nrepeat);

for (i in 1:Nrepeat)
{
	ncount = 1;  x = rep(0, n);
	
	while (ncount <= n)
	{
		xtemp = 2*runif(1)-1;   y = runif(1);   ytemp = (1+ttheta*xtemp)/2;
		if (y <= ytemp)		{			x[ncount] = xtemp;  ncount = ncount + 1; 		}
	}
	
	theta = 0;		# user-supplied initial value
	maxtol = 0.0001;  maxiter = 10000;

	ell = function(x, theta)
	{
		lik = 0;  lik1 = 0;  lik2 = 0;
		for (j in 1:n)
		{
			lik1 = lik1 + x[j]/(1+theta*x[j]);			# user-supplied first derivative
			lik2 = lik2 - (x[j]/(1+theta*x[j]))**2;		# user-supplied second derivative
		}
	  
		result = list(lik = lik, lik1 = lik1, lik2 = lik2)
		return(result)
	}


	iter = 0
	tol = 1

	while ((iter <= maxiter) && (tol > maxtol))
	{
		theta1 = theta - ell(x, theta)$lik1/ell(x, theta)$lik2;
		tol = abs(theta1 - theta);
		theta = theta1;
		m = 3*sum(x)/n;
		iter = iter + 1;
	}

	if (theta <= -1)	{	theta = -1;	}
	if (theta >= 1)	{	theta = 1;	}

	MLE[i] = theta;
}

mean0 = sum(MLE) / Nrepeat;
variance0 = (sum(MLE^2) - Nrepeat*mean0*mean0)/(Nrepeat-1);

MLE
Nrepeat
n
ttheta
mean0
variance0
