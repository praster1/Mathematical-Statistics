Nrepeat = 100
sum = 0

for (i in 1:Nrepeat)
{
	u = runif(1)
	x = -2*log(1-u)
	print(paste("u: ", u, "   x: ", x, sep=""))
	sum = sum+x
}

mean = sum / Nrepeat
mean