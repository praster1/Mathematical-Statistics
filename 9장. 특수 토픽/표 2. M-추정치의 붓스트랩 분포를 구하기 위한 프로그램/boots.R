x = c(20, 25, 25, 27, 28, 31, 33, 34, 36, 37, 44, 50, 59, 85, 86)
n = length(x);
B = 999;
theta_M = rep(0, B);
xstar = rep(0, n);


for (ii in 1:B)
{
	n = length(x);
	for (i in 1:n)
	{
		xstar[i] = x[as.integer(n*runif(1))+1];
	}

	mean0 = sum(xstar)/n;  

	y = rep(0,n);  r = rank(xstar, ties.method="random");
	for (i in 1:n)	{	y[r[i]] = xstar[i];	}
	median0 = ifelse( (n%/%2) != 0, y[(n+1)/2], (y[n/2] + y[n/2+1])/2 )

	x1 = abs(xstar - median0*rep(1,n));
	r1 = rank(x1, ties.method="random");
	for (i in 1:n)	{	y[r1[i]] = x1[i];	}
	mad0 = ifelse( (n%/%2) != 0, y[(n+1)/2]/0.6745, ((y[n/2] + y[n/2+1])/2)/0.6745 )

	k = 1.5;   theta0 = median0;   iter=0;   diff0=1;

	while (diff0 > 0.0001)
	{
		temp = (xstar-theta0*rep(1,n))/mad0;
		num = temp;  denum = rep(1,n);
		
		for (i in 1:n)
		{
			if( temp[i] > k ) { num[i] = k; }
			else if (temp[i] < -k )  { num[i] = -k; }
			
			if (abs(temp[i]) > k)	{	denum[i] = 0;	}
		}
		 
		 theta = theta0 + mad0*sum(num)/sum(denum);
		 diff0 = abs(theta-theta0);
		 iter = iter+1;
		 theta0 = theta;
	}

	theta_M[ii] = theta;	
}
 
 
m1 = sum(theta_M)/B;
se = sqrt((sum(theta_M^2)-B*m1*m1)/(B-1));

m1
se

theta_O = rep(0, B);  r2 = rank(theta_M, ties.method="random");
for (k in 1:B)	{	theta_O[r2[k]] = theta_M[k];	}
l=theta_O[(B+1)*0.025];  u=theta_O[(B+1)*0.975];

l
u

hist(theta_M)		# 그림 2. M-추정량의 붓스트랩 분포