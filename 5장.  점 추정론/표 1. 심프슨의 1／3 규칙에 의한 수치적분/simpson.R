a = 0;  b = 3;
N = 1000;

g = function(x1, x2, x3)
{
	g1 = x1*630*((1-exp(-x1))**4)*exp(-5*x1);
	g2 = x2*630*((1-exp(-x2))**4)*exp(-5*x2);
	g3 = x3*630*((1-exp(-x3))**4)*exp(-5*x3);

	result = list(g1 = g1, g2 = g2, g3 = g3)
	return(result)
}


sum0 = 0;
for (i in 1:N)
{
	x1 = (b-a)/N*(i-1);
	x3 = (b-a)/N*i;
	x2 = (x1+x3)/2;
	
	g_res = g(x1, x2, x3);
	sum0 = sum0 + (b-a)/N*(g_res$g1+4*g_res$g2+g_res$g3)/6;
}


sum0