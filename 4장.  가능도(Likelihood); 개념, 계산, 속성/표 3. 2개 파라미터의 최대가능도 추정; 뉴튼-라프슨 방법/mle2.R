theta1 = 1;  theta2 = 8.67;		# user-supplied initial values
theta = rbind(theta1, theta2);		# theta = theta1//theta2;
maxtol = 0.0001;  maxiter = 10000;

ell = function(theta1, theta2)
{
	x = c(1, 1, 2, 2, 3, 4, 4, 5, 5, 8, 8, 8, 8, 11, 11, 12, 12, 15, 17, 22, 23);
	n = 21;
	temp0 = exp(theta1*log(x));
	temp1 = exp(theta1*log(x))*log(x);
	temp2 = exp(theta1*log(x))*log(x)*log(x);

	# user-supplied log-likelihood function
	 lik = n*log(theta1/theta2) + (theta1-1)*sum(log(x)) - sum(temp0)/theta2;

	# user-supplied first derivatives
	 lik1 = n/theta1 + sum(log(x)) - sum(temp1)/theta2;
	 lik2 =-n/theta2 + sum(temp0)/(theta2*theta2);

	# user-supplied second derivatives
	 lik11 = -n/(theta1*theta1) - sum(temp2)/theta2;
	 lik22 = n/(theta2*theta2) - 2*sum(temp0)/(theta2*theta2*theta2);
	 lik12 = sum(temp1)/(theta2*theta2);

	# gradient and Hessian matrix
	grad = rbind(lik1, lik2);		#  grad = lik1//lik2;
	Hess = rbind(cbind(lik11, lik12) , cbind(lik12, lik22));		# Hess = (lik11||lik12)//(lik12||lik22);
	
	result = list(grad = grad, Hess = Hess)
	return(result)
}

iter = 0;
tol  = 1;
while ((iter <= maxiter) && (tol > maxtol))
{
	update0 = theta - solve(ell(theta1, theta2)$Hess)%*%ell(theta1, theta2)$grad;
	tol = sum((update0 - theta)^2);
	theta = update0;
	theta1 = theta[1];
	theta2 = theta[2];
	iter = iter + 1;
}


iter
theta
ell(theta1, theta2)
