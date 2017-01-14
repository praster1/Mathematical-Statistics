p = 0.5;  n=20;
nn = 2*n+1;
FIRE1 = matrix('.', nn,nn);
FIRE2 = matrix('.', nn,nn);
MAP = matrix('.', nn,nn);
status = 1;
FIRE1[n+1,n+1] = '0';
time = 0;

while (status > 0)
{
	status = 0;
	
	for (i1 in 1:nn)
	{
		for (i2 in 1:nn)
		{
			if (FIRE1[i1,i2] == '0')
			{
				if (i1 < nn)
				{
					if ((runif(1) < p) && (MAP[i1+1,i2] == '.'))	{	FIRE2[i1+1,i2] = '0';  status = 1;	}
				}
			
				if (i1 > 1)
				{
					if ((runif(1) < p) && (MAP[i1-1,i2] == '.'))	{	FIRE2[i1-1,i2] = '0';  status = 1;	}
				}

				if (i2 < nn)
				{
					if ((runif(1) < p) && (MAP[i1,i2+1] == '.'))	{	FIRE2[i1,i2+1] = '0';  status = 1;	}
				}
			
				if (i2 > 1)
				{
					if ((runif(1) < p) && (MAP[i1,i2-1] == '.'))	{	FIRE2[i1,i2-1] = '0';  status = 1;	}
				}
				
				MAP[i1,i2] = '1';
			}
		}
	}
	
	FIRE1 = FIRE2;
	FIRE2 = matrix('.', nn,nn);
	time = time + 1;
	#  print time MAP[format=1.0];
	#  print time FIRE1[format=1.0];
}

count=0;
for (i1 in 1:nn)
{
	for (i2 in 1:nn)
	{
		if (MAP[i1,i2] == '1') {	count=count+1;	}
	}
}

data.frame(MAP)










##### 아래는 조금 더 Graphical하게 출력하여 보았습니다. : 유재성
p = 0.5;  n=20;
nn = 2*n+1;
FIRE1 = matrix('.', nn,nn);
FIRE2 = matrix('.', nn,nn);
MAP = matrix('.', nn,nn);
status = 1;
FIRE1[n+1,n+1] = '0';
time = 0;

while (status > 0)
{
	status = 0;
	
	for (i1 in 1:nn)
	{
		for (i2 in 1:nn)
		{
			if (FIRE1[i1,i2] == '0')
			{
				if (i1 < nn)
				{
					if ((runif(1) < p) && (MAP[i1+1,i2] == '.'))	{	FIRE2[i1+1,i2] = '0';  status = 1;	}
				}
			
				if (i1 > 1)
				{
					if ((runif(1) < p) && (MAP[i1-1,i2] == '.'))	{	FIRE2[i1-1,i2] = '0';  status = 1;	}
				}

				if (i2 < nn)
				{
					if ((runif(1) < p) && (MAP[i1,i2+1] == '.'))	{	FIRE2[i1,i2+1] = '0';  status = 1;	}
				}
			
				if (i2 > 1)
				{
					if ((runif(1) < p) && (MAP[i1,i2-1] == '.'))	{	FIRE2[i1,i2-1] = '0';  status = 1;	}
				}
				
				MAP[i1,i2] = '1';
			}
		}
	}
	
	FIRE1 = FIRE2;
	FIRE2 = matrix('.', nn,nn);
	time = time + 1;
	#  print(MAP);
	#  print(FIRE1)
	
	
	
	#	print(data.frame(MAP))	#	Console에서도 출력하려면, 이 부분의 주석을 풀어주면 됩니다.: 유재성
	
	# 아래는 그림을 그려주는 부분입니다.
	tempMAP = MAP
	tempMAP[tempMAP=="."] = 0;	tempMAP[tempMAP=="1"] = 1;	tempMAP = apply(tempMAP, 2, as.numeric)

	image(1:ncol(tempMAP), 1:nrow(tempMAP), t(tempMAP), col = terrain.colors(60), axes = FALSE)
	
	Sys.sleep (2)		# 반복문 속도를 여기에서 조절하여 줄 수 있습니다.: 유재성
}



count=0;
for (i1 in 1:nn)
{
	for (i2 in 1:nn)
	{
		if (MAP[i1,i2] == '1') {	count=count+1;	}
	}
}

data.frame(MAP)

tempMAP = MAP
tempMAP[tempMAP=="."] = 0
tempMAP[tempMAP=="1"] = 1
tempMAP = apply(tempMAP, 2, as.numeric)

image(1:ncol(tempMAP), 1:nrow(tempMAP), t(tempMAP), col = terrain.colors(60), axes = FALSE)