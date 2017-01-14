d = 2;
Nrepeat = 10000;
pi0 = 4;
count = 0;
success = 0;

for (i in 1:Nrepeat)
{
	theta = runif(1)*pi0;
	y = runif(1)*d/2;
	temp = sin(theta);
	if (temp >= 0) {	count = count + 1;	}
	if (y <= (0.5*temp)) {	success = success + 1;	}
}

p = success/count;
estimate = 2/(d*p);

p
estimate