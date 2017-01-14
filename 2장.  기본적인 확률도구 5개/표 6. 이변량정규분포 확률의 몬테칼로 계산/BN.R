rho = 0.5;
Nrepeat = 10000;
sum = 0;

for (i in 1:Nrepeat)
{
	z1 = rnorm(1);
	z2 = rnorm(1);
	x1 = z1;
	x2 = rho*z1 + sqrt(1-rho*rho)*z2;
	success = ifelse( (x1 >= 1) & (x2 >= 1), 1, 0 )
	sum = sum + success;
}

p = sum/Nrepeat;
p
