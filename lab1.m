
%%%%%%%%%%%%%%%%%%%%%%% Main %%%%%%%%%%%%%%%%%%%%%%% 

%% Primera parte %%

%1.1 
x = 0:15*pi;                %Variable de entrada x
a = primeraFuncion(x);      %Función a(x)
b = segundaFuncion(x);      %Función b(x)

%Bloque para graficar
fprintf('Graficando función a(x): \n')
graficar(a,x,'Funcion a(x)','x','8log5(4x + 12)','*r');
fprintf('Graficando función b(x): \n')
graficar(b,x,'Funcion b(x)','x','sen(6(log2(x + 9))) + cos(7(log6(4x + 32)))','+g');
fprintf('Graficando funciones a(x) y b(x): \n')
graficarDosFunciones(a,b,x);

%1.2
x = -10:10;                 %Variable de entrada x
c = terceraFuncion(x);      %Función c(x)

%Bloque para graficar
fprintf('Graficando función c(x): \n')
graficar(c,x,'Funcion c(x) en intervalo [-10, 10]','x','6 * exp(x+18)','--bs');
fprintf('Graficando función c(x) logaritmica: \n')
graficaLogaritmica(c,x,'Funcion c(x) escala logaritmica en [-10, 10]','x','6 * exp(x+18)','--r');


%% Segunda parte %%

%1.1 

[pol,iter,tol,x0] = ingresarParametrosPolinomio();  %Párametros de entrada
newtonRaphson(str2sym(pol),iter,tol,x0);            %Newton Raphson


%%%%%%%%%%%%%%%%%%%%%%% Detalle de funciones %%%%%%%%%%%%%%%%%%%%%%% 

%% Primera parte %%

%1.1 

%Entrada: valor numérico x
%Salida: función a(x)
%Descripción: Función que retorna función a(x)
function [a] = primeraFuncion(x)
    a = 8 * (log(4 * x + 12) / log(5));
end

%Entrada: valor numérico x
%Salida: función b(x)
%Descripción: Función que retorna función b(x)
function [b] = segundaFuncion(x)
    b = sin(6 * (log(x + 9) / log(2))) + cos(7 * (log(4*x + 32) / log(6)));
end

%1.2

%Entrada: valor numérico x
%Salida: función c(x)
%Descripción: Función que retorna función c(x)
function [h] = terceraFuncion(x)
    aux = exp(x + 18);
    h = 6 * aux;
end

%% Segunda parte %%

%Entrada: sin entradas 
%Salida: polinomio, cantidad de iteraciones, tolerancia y valor inicial de
%x0
%Descripción: Función que crea polinomio con un valor inicial, tolerancia y
%cantidad de iteraciones para realizar Newton Raphson
function [pol,iter,tol,x0] = ingresarParametrosPolinomio()
    pol = input('Ingrese el polinomio: ','s');
    iter = input('Ingrese la cantidad de iteraciones: ');
    tol = input('Ingrese la tolerancia: ');
    x0 = input('Ingrese el valor inicial x0: ');  
end

%Entrada: sin entradas 
%Salida: polinomio, cantidad de iteraciones, tolerancia y valor inicial de
%x0
%Descripción: Función que crea polinomio con un valor inicial, tolerancia y
%cantidad de iteraciones para realizar Newton Raphson
function raizR = newtonRaphson(polinomio,iteraciones,tolerancia,x0)         
    iteraciones = iteraciones-1;
    syms x;
    f=polinomio;
    % Evaluando x0
    f0=double(subs(polinomio,x0));
    df= diff(f);    % Derivada
    df0= double(subs(df,x0));
    
    % Calculo Xn siguiente
    xn= vpa(x0 -(f0/df0));
    f0;
    df;
    df0;
    if abs(xn-x0)< tolerancia
        raizR=xn;
        return;
    end
    if iteraciones == 0
        raizR =x0;
        return; 
    end
    %enviando nuevos parametros a función recursiva
    newtonRaphson(polinomio,iteraciones,tolerancia,xn)
end

%Entrada: función a graficar, parámetro de función, nombre eje x, nombre
% eje y, color de gráfico 
%Salida: Gráfico 
%Descripción: Función que gráfica función de entrada
function [] = graficar(f,x,titulo,nombreX,nombreY,color)
    figure, plot(x, f, color);
    title(titulo);
    xlabel(nombreX);
    ylabel(nombreY);
    grid on
end

%Entrada: primera función a graficar, segunda función a graficar y
%parametro de funciones
%Salida: Gráfico 
%Descripción: Función que gráfica dos funciones de entrada
function [] = graficarDosFunciones(f,g,x)
    yline(0);
    figure, plot(x, f, '*r');
    title('Ambas funciones en intervalo');
    xlabel('Eje x')
    ylabel('Eje y') 
    
    % Se usa hold on para colocar otra funcion al grafico
    hold on
    
    % Se grafica la segunda funcion
    plot(x, g, '+g')
    legend('8log5(4x + 12)', 'sen(6(log2(x + 9))) + cos(7(log6(4x + 32)))', 'Location', 'northwest')
    
    hold off
    
end

%Entrada: función a graficar, parámetro de función, nombre eje x, nombre
% eje y, color de gráfico. 
%Salida: Gráfico  logaritmico
%Descripción: Función que gráfica función logaritmica de entrada 
function [] = graficaLogaritmica(f,x,titulo,nombreX,nombreY,color)
    %En escala logaritmica
    figure, semilogy(x, f, color);
    title(titulo)
    xlabel(nombreX)
    ylabel(nombreY)
    grid on
    
    
end





