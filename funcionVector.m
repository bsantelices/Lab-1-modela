vector();

%Entrada: sin entradas
%Salida: resultados de raíz cuadrada 
function [] = vector()
    bandera=false;
    while bandera==false
        vector = input('Ingrese un vector: ');
        n= length(vector);
        % Vector mayor a 4 
        if n >= 4
            aux=true;
            %Se recorre
             for i=1:n
                 %Si no es numerico
                if isnumeric(vector(i))~=1
                    aux=false;
                end
             end 
             %Si el vector es valido, se deja pasar
             if aux == true
                bandera = true;
             end
        end
    end
    
    % Se obtienen los 4 menores y mayores
    maximos = maxk(vector,4);
    minimos = mink(vector,4);
    % Raices
    A = sqrt(sum(maximos));
    B = sqrt(sum(minimos));
    %Resta
    C = A-B
end
