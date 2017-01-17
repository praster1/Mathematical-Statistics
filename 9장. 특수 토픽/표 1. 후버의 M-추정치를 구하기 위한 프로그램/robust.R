x = c(20, 25, 25, 27, 28, 31, 33, 34, 36, 37, 44, 50, 59, 85, 86)
n = length(x);
mean0 = sum(x)/n;  sd0 = sqrt((sum(x^2)-n*mean0*mean0)/(n-1));

y = rep(0, n);  r = rank(x, ties.method="random");
for (i in 1:n)	{	y[r[i]] = x[i];	}
median0 = ifelse( (n%/%2) != 0 ,  y[(n+1)/2], (y[n/2] + y[n/2+1])/2 )

x1 = abs(x - median0*rep(1,n));
r1 = rank(x1, ties.method="random");
for (i in 1:n)	{	y[r1[i]] = x1[i];	}
mad0 = ifelse( (n%/%2) != 0 , y[(n+1)/2]/0.6745, (y[n/2] + y[n/2+1])/2/0.6745 )

n
mean0
sd0
median0
mad0

k = 1.5;   theta0 = median0;   iter=0;   diff0=1;
while (diff0 > 0.0001)
{
	temp = (x-theta0*rep(1,n))/mad0;
	num = temp;  denum = rep(1,n);
	for (i in 1:n)
	{
		if( temp[i] > k ) { num[i] = k; }
		else if (temp[i] < -k )  { num[i] = -k; }
		
		if (abs(temp[i]) > k)	{	denum[i] = 0;	}
	}

	theta = theta0 + mad0*sum(num)/sum(denum);
	diff0 = abs(theta-theta0);
	iter = iter + 1;
	theta0 = theta;
}
se = mad0*sqrt(sum(num*num)/(sum(denum)*sum(denum)));


iter
theta
se