function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Se calculeaza patratele elementelor din theta
  theta_squared = Theta .^ 2;
  
  % Se inssumeaza elementele
  sigma = sum(theta_squared);
  
  % Calculeaza eroarea de la regresia liniara
  error_linear = linear_regression_cost_function(Theta, Y, FeatureMatrix);
  
  % Eroarea ridge
  Error = error_linear + lambda * sigma;
endfunction