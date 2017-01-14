k = 7;
maxtol = 0.0001;  maxiter = 10000;

theta1 = 3;    theta2 = 5;			# user-supplied initial values
maxl = 22*log(5.5) - 4*5.5;		# user-supplied max log-likelihood


ell = function(theta, maxl, k)
{
	l = 22*log(theta) - 4*theta;	# user-supplied log-likelihood
	g = l - maxl + log(k);
	result = list(l = l, g = g);
	return(result);
}

iter = 0;
theta = theta1;  g1 = ell(theta, maxl, k)$g;
theta = theta2;  g2 = ell(theta, maxl, k)$g;

if (g1*g2 > 0)	{	print("Initial values are improper!!!");	}
tol = theta2 - theta1;

while ((iter <= maxiter) && (tol > maxtol))
{
	theta = (theta1 + theta2)/2;
	if (g1*ell(theta, maxl, k)$g < 0)	{		theta2 = theta;  g2 = ell(theta, maxl, k)$g; 	}
	else	{		theta1 = theta;  g1 = ell(theta, maxl, k)$g; 	}	 
	iter = iter + 1;
	tol = theta2 - theta1;
}
  

theta = (theta1 + theta2)/2;

iter
theta1
theta2
theta