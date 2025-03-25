clear 
close all
clc %limpiar ventana de comandos 
warning('off','MATLAB:hg:EraseModeIgnored')
%% Constantes 
l0 = 0.1;
l1 = 0.1; 
l2 = 0.2; 
l3 = 0.2;
l4 = 0.2;
l5 = 0.15;
%% Variables 
t1 = 0*pi/180; 
t2 = 0*pi/180; 
t3 = -90*pi/180; 
d3 = 0.05;
%% Transformacion de 1 en 0 
R10 = [ cos(t1) -sin(t1) 0; %Matriz de rotacion 
        sin(t1) cos(t1)  0;
        0           0    1];
P10 = [0 0 l0]'; % Punto de origen de 1 en 0 (filas, columnas)
T10 = [R10  P10; %matriz de transformacion 
       0 0 0 1];  
%% Transformacion de 2 en 1 
R21 = [ cos(t2) 0 -sin(t2); %Matriz de rotacion 
        0       1      0 ;
       sin(t2)  0  cos(t2)];
P21 = [0 0 l1]'; % Punto de origen 
T21 = [R21  P21; %matriz de transformacion 
       0 0 0 1];  
T20 = T10*T21; 
P20 = T20*[0 0 0 1]'; 
P20 = P20(1:3);
%% Transformacion de 3 en 2 
R32 = [ cos(t3) 0 -sin(t3) ; %Matriz de rotacion 
          0     1     0;
        sin(t3) 0  cos(t3)];
P32 = [l4 0 l2]'; % Punto de origen 
T32 = [R32 P32; %matriz de transformacion 
       0 0 0 1];  
T30 = T10*T21*T32; 
P30 = T30*[0 0 0 1]'; 
P30 = P30(1:3);
%% Transformacion de 4 en 3 
R43 = [ 1 0 0 ; %Matriz de rotacion 
        0 1 0;
        0 0 1];
P43 = [l5 d3 l3]'; % Punto de origen 
T43 = [R43 P43; %matriz de transformacion 
       0 0 0 1];  
T40 = T10*T21*T32*T43;
P40 = T40*[0 0 0 1]'; 
P40 = P40(1:3);
 
%% Efector final en O 
T40 = T10*T21*T32*T43; 
P40 = T40*[0 0 0 1]';
P40 = P40(1:3); %Origen de 4 en 0 
 
EF0 = P40(1:3); %Efector final 
%% Grafica 
B = [P10 P20 P30 P40 EF0]; 
T00 = eye(4,4); 
plot3(B(1,:), B(2,:), B(3,:),'o-k'); 
hold on 
frame (T00,'k',0.15);
frame (T10,'b', 0.1); frame (T20,'r', 0.1); frame(T30,'g',0.1); frame(T40,'y',0.1);
grid on;
axis equal; %%dibujar ejes con la misma escala