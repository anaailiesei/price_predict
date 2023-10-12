function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Se calculeaza h(theta)
  predicted_values_poly = Theta(2:end)' .* FeatureMatrix;
  
  % Se aduna pe randuri (reuzltatul e vector coloana)
  predicted_values = sum(predicted_values_poly, 2);
  m = rows(Y);
  
  % Se calculeaza suma
  sigma = sum((predicted_values - Y).^2);
  
  % Se calculeaza eroarea
  Error = sigma / (2 * m);
endfunction