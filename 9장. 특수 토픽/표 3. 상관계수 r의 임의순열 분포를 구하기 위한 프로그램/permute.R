Nrepeat = 1000;
x = c(15, 26, 10, 9, 15, 20, 18, 11, 8, 20, 7, 9, 10, 11, 11, 10, 12, 17, 11, 10)
y = c(95, 71, 83, 91, 102, 87, 93, 100, 104, 94, 113, 96, 83, 84, 102, 100, 105, 121, 86, 100)
n = length(x);
r = rep(0, Nrepeat)

xbar = sum(x)/n;  ybar = sum(y)/n;
num = sum(x*y) - n*xbar*ybar;
denum = sqrt((sum(x^2)-n*xbar*xbar)*(sum(y^2)-n*ybar*ybar));
r0 = num/denum;

n
r0

u = rep(0, n);
count = 0;
for (i in 1:Nrepeat)
{
	for (j in 1:n)	{	u[j] = runif(1);	}
	rnk = rank(u, ties.method="random");  y1 = y;
	for (j in 1:n)	{	y1[rnk[j]] = y[j];	}
	y1bar = sum(y1)/n;
	num = sum(x*y1) - n*xbar*y1bar;
	denum = sqrt((sum(x^2)-n*xbar*xbar)*(sum(y1^2)-n*y1bar*y1bar));
	r1 = num/denum;
	if (r1 <= r0)	{	count=count+1;	}
	r[i] = r1;
}

pvalue = count/Nrepeat;
hist(r)
Nrepeat
pvalue
