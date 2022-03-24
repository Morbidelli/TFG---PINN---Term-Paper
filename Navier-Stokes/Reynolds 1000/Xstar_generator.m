%Código para gerar arquivo X_star que mapeia as coordenadas espaciais das
%grandezas u,v,p ao longo do domínio
%==========================================================

%Input dos dados referentes ao espaço amostral do dataset
length = 1.5; %Limite de x à direita
init_length = 0.1; %Limite de x à esquerda (logo após obstáculo) 
Nx = 100; %Número de elementos desejados ao longo de x
height = 0.5; %Limite superior de y contado a partir de zero
init_height = -0.5; %Limite inferior de y contado a partir de zero
Ny = 50; %Número de elementos desejados ao longo de y

%=========================================================
%Cálculo dos passos ao longo de x e y
step_length = round((length-init_length)/(Nx-1),5,"significant"); %Passo em x
step_height = round((height-init_height)/(Ny-1),5,"significant"); %Passo em y


%Geração da coluna da coordenada x
xStart = init_length;
dx = step_length;
a = xStart + (0:Nx-1)*dx;
ar = round(a,5,"significant"); %arrendonda o 5° alg. sig. para ser inteiro
x = transpose(ar);

%Geração da coluna da coordenada y
yStart = init_height;
dy = step_height;
b = yStart + (0:Ny-1)*dy;
br = round(b,5,"significant"); %arrendonda o 5° alg. sig. para ser inteiro
y = transpose(br);

%Organização de como os valores devem se repetir para entrada na PINN
f = (repmat(x,Ny,1));
u = repelem(y,Nx);

%Combinação das colunas com repetições corretas em uma única variável
xstar = [f u];

%Geração do arquivo X_star na extensão .dat
dlmwrite('X_star.dat', xstar);  
   
 