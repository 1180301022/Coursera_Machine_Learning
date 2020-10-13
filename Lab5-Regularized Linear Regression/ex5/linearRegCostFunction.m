function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
y_pred = X * theta;
theta_copy = theta;
theta_copy(1,1) = 0;
J = sum((y_pred - y) .^ 2) / (2 * m) + lambda * sum(theta_copy .^ 2) / (2 * m);
%grad = [(lambda * theta(1, 1) / m) + sum(X(:,1)) / m ; (lambda * theta(2, 1) / m) + sum(X(:,2)) / m ; (lambda * theta(3, 1) / m) + sum(X(:,3)) / m];
theta_copy = theta_copy * lambda / m;
grad = X' * (y_pred - y) / m + theta_copy;




% =========================================================================

%grad = grad(:);

end
