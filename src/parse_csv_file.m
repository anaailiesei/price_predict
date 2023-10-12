function [Y, InitialMatrix] = parse_csv_file(file_path)
  % Se importeaza datele
  tab = importdata(file_path, ',', 1);

  % Datele numerice
  matrix = tab.data;
  [m, n] = size(matrix);
  
  % Y prima coloana
  Y = matrix(:, 1);

  % InitialMatrix submatrice de tip cell array a matricei date numerice
  InitialMatrix = num2cell(matrix(:, 2 : n));
  
  % InitialMatrix va avea valori de NaN in loc de stringuri si gasim idxs 
  nan_idxs = cellfun(@isnan, InitialMatrix);
  nan_cols = any(nan_idxs == 1, 1);
  
  % Numarul de coloane cu text
  num_nan_cols = sum(nan_cols);
  
  % Se extrag datele text
  text = tab.textdata;
  
  % Se remodeleaza datele text
  text_array = reshape(text(2:end), num_nan_cols, m)';
  
  % Se inlocuieste submatricea cu NaN cu cell array-ul cu text
  InitialMatrix(:, nan_cols) = text_array;
endfunction