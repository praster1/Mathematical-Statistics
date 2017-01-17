II = 4;  n = 5;  Nrepeat = 99999;
Y = matrix(0, II,n);
PairDiff = matrix(0,II,II);
Q = rep(0, Nrepeat);   Qsort = rep(0, Nrepeat);

for (i in 1:Nrepeat)
{
	for (j in 1:II)
	{
		for (k in 1:n)
		{
			Y[j,k] = rnorm(1);
		}
	}
	
	Ybar = apply(Y, 1, sum)/n
	Residual = Y - Ybar%*%matrix(1, 1, n);
	s = sqrt(sum(Residual^2)/(II*n-II));
	
	for  (j in 1:II)
	{
		for (k in 1:II)
		{
			PairDiff[j,k] = abs(Ybar[j] - Ybar[k]);
		}
	}
	
	Q[i] = max(PairDiff)/s*sqrt(n);
}

R = rank(Q, ties.method="random");
for (i in 1:Nrepeat)
{
	Qsort[R[i]] = Q[i];
}
Q05 = Qsort[(Nrepeat+1)*0.95];

Nrepeat
Q05

hist(Q)		# 반복 수 : Nrepeat