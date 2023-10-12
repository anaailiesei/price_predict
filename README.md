# price_predict
Matlab algorithm for apartaments' price prediciton

# evaluate
- Used data from Housing.csv file (with pricing information) and divided them in 2 files:
* housing_training.csv (for training the model)
* housing_test.csv (for testing the model)

- Results are included in results file
  
*parse_data_set_file.m*

    1. Se importeaza datele (cu separatorul " ")
    2. Se extrag datele numerice
    3. Se extrage coloana Y din datele numerice
    4. Restul din datele numerice se pun in Initial matrix de tip cell array
    5. Unde ar fi fost normal text, matricea are valori de NaN
    6. Se cauta coloanele de NaN si se afla numarul lor
    7. Se extrag datele text si se creaaza un cell array cu ele (cu ajutorul reshape)
    8. Se inlocuiesc coloanele cu NaN cu coloanele de date text

*prepare_for_regression*

    1. Formam un cell array cu valorile care trebuei sa fei inlocuite
    2. Formam un cell array cu valorile cu care se inlocuieste (unele sunt valori numerice, altele sunt vectori linie de 2 elemente)
    3. Se calculeaza numarul de valori cu numerice cu care trebuie sa se inlocuieasca
    4. Se creeaza un cell array FeatureMatrix de dimensiunile matricei InitialMatrix
    5. Cauta indecsii valorilor numerice din Initial Matrix si introduce elementele numerice in Feature Matrix
    6. Se itereaza prin vectorul de valori de schimbat
    7. Se cauta valoarea de inlocuit si se inlocuieste in Matricea Feature cu valoarea corespunzatoare
    8. Daca s-a ajuns la valorile care trebuie sa fie inlocuite cu cate doua valori, se adauga o coloana in Feature Matrix
    9. In aceasta coloana nou creata se vor adauga valorile secundare din valorile cu care se inlocuieste (din vectorul cu valori, cea de-a doua valoare de la fiecare)
    10. Se transforma Feature Matrix la final intr-o matrice numerica

*linear_regression_cost_function.m*

    1. Se calculeaza h theta vectorizat, o matrice cu polinoamele valorilor predicted
    2. Se aduna randurile din h theta (rezultatul e evctor coloana)
    3. Se calculeaza suma din enunt
    4. Se calculeaza si eroarea

*parse_csv_file.m*

    1. Se importeaza datele (cu separatorul ",")
    2. Se extrag datele numerice
    3. Se extrage coloana Y din datele numerice
    4. Restul din datele numerice se pun in Initial matrix de tip cell array
    5. Unde ar fi fost normal text, matricea are valori de NaN
    6. Se cauta coloanele de NaN si se afla numarul lor
    7. Se extrag datele text si se creaaza un cell array cu ele (cu ajutorul reshape)
    8. Se inlocuiesc coloanele cu NaN cu coloanele de date text
    * Functia e foarte similara cu cea de *parse_data_set_file*

*gradient_descent.m*

    1. Se implementeaza metoda gradientului descendent conform formulelor din material
    2. Initial, theta este umplut cu 0
    3. Se calculeaza h theta vectorizat, o matrice cu polinoamele valorilor predicted
    4. Se aduna randurile din h theta (rezultatul e vector coloana)
    5. Se scade din h theta vectorul y
    6. Trebuie inmultite cu xj(i), adica fiecare element didn vectorul rezultat se inmulteste cu fiecare element din matricea FeatureMatrix (primul element din prima linie a vectorului cu primul element de pe fiecare coloana a matricei samd)
    7. Se insumeaza matricea rezultata pe randuri (rezulta un vector coloana) si se imparte la numarul de randuri pentru gradient
    8. Se calculeaza theta la pasul curent cu formula theta de la pasul anterior - alpha * gradient
    9. Se itereaza de iter ori
    10. Se adauga valorea de 1 la inceputul vectorului Theta rezultat

*normal_equation.m*

    1. Daca matricea nu e patratica se inmulteste cu transpusa si se rezolva sistemul rezultat (Se inmulteste si vectorul Y cu matricea transpusa)
    2. Se verifica daca matricea este pozitiv definita
    3. Se realizeaza algoritmum gradientului conjugat prezentat in material
    4. Se adauga 1 la inceputul vectorului Theta

Am folosit urmatoarea functie ajutatoare care verfiica daca o matrice este pozitiv definita;

*is_positive_definite.m*

    1. Daca matricea nu e patratica se inmulteste cu transpusa
    2. Se calculeaza valorile proprii ale matricei rezultate (sau initiale)
    3. Daca toate valorile sunt pozitive, matricea e pozitiv definita si se returneaza 1, altfel matricea nu e pozitiv definita si se returneaza 0

*lasso_regression_cost_function.m*

    1. Se calculeaza norma lui theta
    2. Se calculeaza eroarea liniara de la regresia liniara
    3. Se calculeaza erroarea lasso cu formula din material

*ridge_regression_cost_function.m*

    1. Se calculeaza patratul elemenetelor din theta
    2. Se calculeaza suma elementelor (suma patratelor)
    3. Se calculeaza eroarea de la regresia liniara
    4. Se calculeaza eroarea de la ridge regression cu formula din material
