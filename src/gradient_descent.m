function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % Se implementeaza metoda gradientului descendent
  Theta_previous = zeros(n, 1);
  Theta_next = Theta_previous;

  for i = 1:iter
    % Se obtine h theta
    predicted_values_poly = Theta_previous' .* FeatureMatrix;
    predicted_values = sum(predicted_values_poly, 2);
    
    % Se  realizeaza inmultirea finala si se calculeaza gradientul
    factor = (predicted_values - Y) .* FeatureMatrix;
    sigma = sum(factor);
    gradient = sigma / m;
    
    Theta_next = Theta_previous - alpha * gradient';
    Theta_previous = Theta_next;
  endfor

  % Se adauga valoarea 1 la inceputul vectorului Theta
  Theta(1) = 0;
  Theta(2 : n + 1) = Theta_next;
endfunction