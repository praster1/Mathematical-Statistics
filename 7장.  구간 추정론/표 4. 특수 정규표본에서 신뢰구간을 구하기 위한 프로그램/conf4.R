x = c(116.7, 94.7, 87.8, 110.4, 93.5);
s1 = sum(x);  s2 = sum(x^2);   n = length(x);
mean0 = s1/n;  sd0 = sqrt((s2 - s1*s1/n)/(n-1));

n
mean0
sd0



theta = 90;
maxtol = 0.0001;  maxiter = 10000;

ell  = function(theta0, n0, s10, s20)
{
	lik  = -s20/(2*0.01*(theta0**2))+s10/(0.01*theta0)-n0*log(theta0);
	lik1 = s20/(0.01*(theta0**3)) - s10/(0.01*(theta0**2)) - n0/theta0;
	lik2 = -3*s20/(0.01*(theta0**4))+2*s10/(0.01*(theta0**3))+n0/(theta0**2);
	
	result = list(lik = lik, lik1 = lik1, lik2 = lik2)
	return(result)
}


iter = 0;
tol  = 1;

while((iter <= maxiter) && (tol > maxtol))
{
	ell_res = ell(theta, n, s1, s2)
	theta1 = theta - ell_res$lik1/ell_res$lik2;
	print(theta1)
	print(tol)
	tol = abs(theta1 - theta);
	theta = theta1;
	iter = iter + 1;
}


iter
theta
ell_res$lik2
ell_res$lik
