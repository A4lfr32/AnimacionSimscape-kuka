function rotx = rotx(alfa)
% devuelve Matriz de rotación 4x4, para una rotación en el eje x con ángulo
% (alfa) de entrada expresado en radianes.
    rotx=[1,0,0,0;0,cos(alfa),-sin(alfa),0;0,sin(alfa),cos(alfa),0;0,0,0,1];
end