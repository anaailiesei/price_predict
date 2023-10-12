function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Norma lui Theta
  theta_norm = norm(Theta, 1);
  
  % Se calculeaza eroarea de la linear regression
  err_linear = linear_regression_cost_function(Theta, Y, FeatureMatrix);
  
  % Se calculeaza eroarea de la lasso regression
  Error = 2 * err_linear + lambda * theta_norm;
endfunction