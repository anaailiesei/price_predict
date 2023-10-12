function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % Cell array cu valorile care trebuie inlocuite
  vals_to_replace = {"yes", "no", "semi-furnished", "unfurnished", "furnished"};
  
  % Valorile cu care se inclocuieste
  replacement_vals = {1, 0, [1, 0], [0, 1], [0, 0]};
  
  % Numarul de valori singulare cu care se inlocuieste
  num_single_vals = find(cellfun(@(x) numel(x) > 1, replacement_vals), 1) - 1;
  
  % Initial construim matricea de tip cell
  [m, n] = size(InitialMatrix);
  FeatureMatrix = cell(m, n);
  
  % Cauta indecsii valorilor numerice din matricea initiala
  idx_num = cellfun(@isnumeric, InitialMatrix);
  
  % Introduce valorile numerice in matricea FeatureMatrix
  FeatureMatrix(idx_num) = InitialMatrix(idx_num);
  
  % Pentru fiecare valoare de inlocuit
  for i = 1:length(vals_to_replace)
    % Se cauta indecsii in care se regaseste valoarea de inlocuit
    idx = find(cellfun(@(x) isequal(x, vals_to_replace{i}), InitialMatrix));
 
    % Se introduce in FeatureMatrix valoarea cu care se inlocuieste
    FeatureMatrix(idx) = replacement_vals{i}(1);
    
    % Daca am ajuns la valorile cu care se inlocuieste duble
    % Se adauga o coloana
    if i == num_single_vals + 1
      [~, c] = ind2sub([m, n], idx(end));
      new_c = num2cell(zeros(m, 1));
      F = FeatureMatrix;
      F = [F(:, 1 : c), new_c, F(:, c + 1 : n)];
      FeatureMatrix = F;
    endif
    
    % Daca valoarea cu care se inlocuieste este dubla, se adauga si aceasta
    if i > num_single_vals
        FeatureMatrix(idx + m) = replacement_vals{i}(2);
    endif
  endfor
  
  % Se trasnforma matricea din cell in amtrice numerica
  FeatureMatrix = cell2mat(FeatureMatrix);
endfunction