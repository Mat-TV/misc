% Creado por Mat Troncoso Villar (matro1432@gmail.com)
% (9-6-2019)
% https://github.com/Trufumut
% INPUTS:
%   HOME: ubicación del spawn o del punto al que se quiere calcular la
%   distancia. Es una matriz de (1,3) o (3,1) con posiciones (X0,Y0,Z0).
%   x: posición actual en X del personaje.
%   y: posición actual en Y del personaje.
%   z: posición actual en Z del personaje.
% OUTPUTS:
%   distancia: distancia a seguir.
%   f: cadena de texto en que se indica la dirección a seguir.
%   Q: enunciado sencillo que resume la información en palabras.
function [distancia,f] = home_distance(HOME,x,y,z)
if size(HOME,1)>size(HOME,2)
    HOME=HOME';
end
x0 = HOME(1,1);
y0 = HOME(1,2);
z0 = HOME(1,3);
v = [x0-x, y0-y, z0-z];
distancia = norm(v);
if v(1,3)>0
    if v(1,1)>0
        if v(1,3)>v(1,1)
            f='sur';
        elseif v(1,1)>v(1,3)
            f='este';
        else
            f='sudeste';
        end
    elseif v(1,1)<0
        if abs(v(1,1))>v(1,3)
            f='oeste';
        elseif abs(v(1,1))<v(1,3)
            f='sur';
        else
            f='suroeste';
        end
    end
elseif v(1,3)<0
    if v(1,1)>0
        if abs(v(1,3))>v(1,1)
            f='norte';
        elseif v(1,1)>abs(v(1,3))
            f='este';
        else
            f='noreste';
        end
    elseif v(1,1)<0
        if abs(v(1,1))>abs(v(1,3))
            f='oeste';
        elseif abs(v(1,1))<abs(v(1,3))
            f='norte';
        else
            f='noroeste';
        end
    end
end
fprintf('El objetivo se encuentra a %f cuadros en dirección %s \n',distancia,f);
end