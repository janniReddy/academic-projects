function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));


% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
X=[ones(m,1) X];
a=sigmoid(X*(Theta1)');
a=[ones(m,1) a];
htheta=sigmoid([ones(m,1) sigmoid(X*(Theta1)')]*(Theta2)');
%fprintf("size of htheta is %d %d",size(htheta,1),size(htheta,2));
yy=zeros(m,num_labels);
for i=1:m
yy(i,y(i))=1;
end
%fprintf("size of yy is %d %d",size(yy,1),size(yy,2));
y=yy;
J=(sum(sum((-y.*(log(htheta)))-((1-y).*(log(1-htheta))))))/m;
regularization = lambda / (2 * m) * (sum(sum(Theta1(:, 2:end) .^ 2)) + sum(sum(Theta2(:, 2:end) .^ 2)));
J = J + regularization;

%J=((sum(sum((-y.*(log(htheta)))-((1-y).*(log(1-htheta))))))/m)+((lambda/(2*m))*((sum(sum(Theta1.^2)))+(sum(sum(Theta2.^2)))));
d3=htheta-y;
d2=(d3*Theta2).*[ones(m,1) sigmoidGradient(X*(Theta1)')];
d2=d2(:,2:end);
delta1=zeros(size(Theta1));
delta2=zeros(size(Theta2));
delta1=delta1+(d2'*X);
delta2=delta2+(d3'*a);
delta1=delta1/m;
delta2=delta2/m;
d=delta1(:,2:end);
t1=Theta1(:,2:end);
d=d+((lambda/m)*t1);
Theta1_grad=[delta1(:,1) d];
d=delta2(:,2:end);
t2=Theta2(:,2:end);
d=d+((lambda/m)*t2);
Theta2_grad=[delta2(:,1) d];

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
