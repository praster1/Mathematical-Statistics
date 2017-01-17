X = cbind(	rep(1, 16),
				c(1.691, 1.691, 1.724, 1.724, 1.755, 1.755, 1.784, 1.784, 1.811, 1.811, 1.837, 1.837, 1.861, 1.861, 1.884, 1.884)	)
y = c(1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
count = c(6, 53, 13, 47, 18, 44, 28, 38, 52, 11, 53, 6, 61, 1, 60, 0)


beta_old = c(0, 0);   tol = 1;   repeat0=1;

while (tol > 0.000001)
{
   eta = X %*% beta_old;
   bprime1 = exp(eta)/(1+exp(eta));
   bprime2 = bprime1/(1+exp(eta));
   I = t(X)%*%diag(c(count*bprime2))%*%X;
   Iinverse = solve(I);
   U = t(X)%*%diag(c(count))%*%(y-bprime1);
   beta_new = beta_old + Iinverse%*%t(X)%*%diag(c(count))%*%(y-bprime1);
   diff0 = beta_new - beta_old;
   tol = sum(diff0^2);
   print(paste("repeat = ", repeat0, "     beta_new = ", beta_new, sep=""))
   repeat0 = repeat0+1;
   beta_old = beta_new;
}

loglik = 2*(t(eta)%*%diag(c(count))%*%y - t(count)%*%log(1+exp(eta)));
se = sqrt(diag(Iinverse));

loglik
beta_new
se
