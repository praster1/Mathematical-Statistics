rule = 1;
Nrepeat = 1000;
sum0 = 0;


for (i in 1:Nrepeat)
{
	t1 = runif(1);
	if (t1 <= 1/3)	{u = 1}
	else if (t1 <= 2/3)	{u = 2}
	else {u = 3;}

	t2 = runif(1);
	if (t2 <= 1/3)	{x = 1}
	else if (t2 <= 2/3)	{x = 2}
	else {x = 3;}
	
	
	if (x != u)
	{
		v = ( x%/%3 ) + 1;
		if (v == u) {	v = ( u%/%3 ) + 1;	}
	}
	
	if (x == u)
	{
		t3 = runif(1);
		v = ifelse( t3 <= 1/2 , (( u%/%3 ) + 1) , ( ( (u+1)%/%3 ) + 1) );
	}

	if (rule==0) {	y = x	}
	if (rule==1)
	{
		 y = ( x%/%3 )+1;
		 if (y == v) {	y = ( v%/%3 )+1	}
	}

	success = ifelse(u == y, 1, 0)
	sum0 = sum0 + success;
}

p = sum0 / Nrepeat;
p
