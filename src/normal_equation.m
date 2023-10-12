function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  [m, n] = size(FeatureMatrix);
 
 % Daca amtricea nu e patratica se preconditioneaza
  if m != n
    Y = FeatureMatrix' * Y;
    FeatureMatrix = FeatureMatrix' * FeatureMatrix;
  endif
  
  % Se verifica daca matricea este pozitiv definita
  if is_positive_definite(FeatureMatrix) == 0
    Theta = zeros(n + 1, 1);
    return;
  endif
  
  % Se realizeaza algoritmul gradientului conjugat
  r_prev = Y;
  v = r_prev;
  k = 1;
  Theta = zeros(n, 1);

  while (k <= iter) && (norm(r_prev) > tol)
    t = norm(r_prev)^2 / (v' * FeatureMatrix * v);
    
    Theta += t * v;
    r_next = r_prev - t * FeatureMatrix * v;
    
    s = norm(r_next)^2 / norm(r_prev)^2;
    v = r_next + s * v;

    r_prev = r_next;
    k = k + 1;
  endwhile
 
  % Se adauga valoarea de 1 la inceputul lui Theta
  Theta(2 : n + 1) = Theta;
  Theta(1) = 0;
endfunction