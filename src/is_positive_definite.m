% Functie care verifica daca o matrice este pozitiv definita
% Input: matrice
% Output: valoare 1 daca e positiv definita / 0 daca nu

function logical = is_positive_definite(Matrix)
  [m, n] = size(Matrix);
  logical = 0;

  % Daca matricea nu e aptratica se inmulteste cu transpusa
  if m != n
    Matrix = Matrix' * Matrix;
  endif

  % Se calculeaza valorile proprii ale matricei
  eigen_vals = eig(Matrix);
  
  % Daca toate valorile proprii sunt pozitive, matricea e pozitiv definita
  % Altfel, nu e pozitiv definita
  logical = all(eigen_vals > 0);
endfunction