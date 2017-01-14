Nrepeat = 1000;
E  = c(90,30,30,10);
n  = sum(E);
count0=0;  count1=0;  count2=0;   count3=0;
for (i in 1:Nrepeat)
{
	F = rep(0, 4);
	
	for (j in 1:n)
	{
	  temp = runif(1);
	  if (temp <= (9/16))			{ F[1]=F[1]+1;	}
	  else if (temp <= (12/16))	{ F[2]=F[2]+1;	}
	  else if (temp <= (15/16))	{ F[3]=F[3]+1;	}
	  else								{ F[4]=F[4]+1;	}
	}


   if (min(F) != 0)
   {
   	   count0 = count0 +1;
	   G = 2*sum(F*log(F/E));
	   W = sum((F-E)*(F-E)/F);
	   S = sum((F-E)*(F-E)/E);
	   if (G >= 9.30)	{ count1=count1+1;	}
	   if (W >= 9.52) { count2=count2+1; }
	   if (S >= 9.44)	{ count3=count3+1;	}
   }
}

pvalue1 = count1/count0;
pvalue2 = count2/count0;
pvalue3 = count3/count0;


pvalue1a = 1-pchisq(9.30, 3)
pvalue2a = 1-pchisq(9.52, 3)
pvalue3a = 1-pchisq(9.44, 3)


count0
Nrepeat

# Monte-Carlo
pvalue1
pvalue2
pvalue3

#Large-Sample
pvalue1a
pvalue2a
pvalue3a
