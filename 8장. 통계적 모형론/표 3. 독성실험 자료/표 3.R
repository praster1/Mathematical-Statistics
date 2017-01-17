### 원래 SAS 코드가 없습니다. : 유재성

X = c(1.691, 1.691, 1.724, 1.724, 1.755, 1.755, 1.784, 1.784, 1.811, 1.811, 1.837, 1.837, 1.861, 1.861, 1.884, 1.884)
Y = c(1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
count = c(6, 53, 13, 47, 18, 44, 28, 38, 52, 11, 53, 6, 61, 1, 60, 0)



newX = NULL;	newY = NULL;

for (i in 1:16)
{
	if (count[i] > 0)
	{
		for (j in 1:count[i])
		{
			newX = c(newX, X[i]);		newY = c(newY, Y[i]);
		}
	}
}

model = glm(newY ~ newX, family = "binomial")
summary(model)