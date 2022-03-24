%Código para criar o arquivo final referente à esteira de vórtices que
%entra na PINN a partir dos arquivos ut.xlsx; vt.xlsx; p_star.xlsx; 
%X_star.dat; t.dat.
%========================================================

%Importação das planilhas u e v como matrizes
ut = readmatrix('ut.xlsx'); 
vt = readmatrix('vt.xlsx'); 

%transf. as matrizes 2D em matrizes 3D com 5000 linhas, 1 col e 200 de profundidade
a = reshape (ut, [5000 1 200]); 
b = reshape (vt, [5000 1 200]);

%Concatenação das duas matrizes coluna gerando uma matriz 5000x2x200
U_star = cat(2,a,b); 

%Remoção das variávies intermediárias
clear a b ut vt 

%Importação dos valores de x, y, p, t 
p_star = readmatrix('p_star.xlsx');
load X_star.dat 
load t.dat

%Geração do arquivo final que deve ser inserido na PINN
save('cylinder_ndim_Re500', 'U_star', 'X_star', 'p_star', 't'); 