n = 10;
Nrepeat1 = 999;
Nrepeat2 = 100;

t025 = rep(0, Nrepeat2)
t050 = rep(0, Nrepeat2)
t100 = rep(0, Nrepeat2)


for (i in 1:Nrepeat2)
{
	T = rep(0, Nrepeat2)
	S = rep(0, Nrepeat2)
	
	for (j in 1:Nrepeat1)
	{
		sum1 = 0;  sum2 = 0;
		
		for (k in 1:n)
		{
			x = runif(1)*2-1;
			# x = -2*log(1-uniform(0))+2*log(1-uniform(0));	# case2
            # x = normal(0);		# case3
            sum1 = sum1 + x;
            sum2 = sum2 + x*x;
		}
		 xbar = sum1/n;
         s2 = (sum2 - n*xbar*xbar)/(n-1);
         T[j] = abs(xbar/sqrt(s2/n))
	}
	
	R = rank(T, ties.method="random");
	for (j in 1:Nrepeat1)
	{
		S[R[j]] = T[j];
	}
	t025[i] = S[0.95*(Nrepeat1+1)];
	t050[i] = S[0.90*(Nrepeat1+1)];
	t100[i] = S[0.80*(Nrepeat1+1)];	
}

t100m = sum(t100)/Nrepeat2;
t100s = sqrt((sum(t100^2)-Nrepeat2*t100m*t100m)/(Nrepeat2*(Nrepeat2-1)));
t050m = sum(t050)/Nrepeat2;
t050s = sqrt((sum(t050^2)-Nrepeat2*t050m*t050m)/(Nrepeat2*(Nrepeat2-1)));
t025m = sum(t025)/Nrepeat2;
t025s = sqrt((sum(t025^2)-Nrepeat2*t025m*t025m)/(Nrepeat2*(Nrepeat2-1)));


t100m
t100s
t050m
t050s
t025m
t025s
