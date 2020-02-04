function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
m = length(y); 
J_history = zeros(num_iters, 1);
x1=X(:,2);
for iter = 1:num_iters

XX=X*theta;
XX1=XX-y;
Xy=XX1.*x1;
Xy=sum(Xy);
mn=alpha/m;
ll=mn*Xy;
theta(2)=theta(2)-ll;
sum1=sum(XX1);
l=mn*sum1;

theta(1)=theta(1)-l;   
   J_history(iter)=computeCost(X, y, theta);

end

end
