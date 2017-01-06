theta = 4;			# user-supplied initial value
maxtol = 0.0001;  maxiter = 10000;

ell = function(theta)
{
	lik  = 22*log(theta) - 4*theta;		# user-supplied log-likelihood
	lik1 = 22/theta - 4;						# user-supplied first derivative
	lik2 = -22/(theta*theta);				# user-supplied second derivative
	
	result = list(lik = lik, lik1 = lik1, lik2 = lik2)
	return(result);
}

iter = 0;
tol  = 1;
while ((iter <= maxiter) && (tol > maxtol))
{
	theta1 = theta - ell(theta)$lik1/ell(theta)$lik2;
	tol = abs(theta1 - theta);
	theta = theta1;
	iter = iter + 1;
}

iter
theta
ell(theta)$lik1
ell(theta)$lik2