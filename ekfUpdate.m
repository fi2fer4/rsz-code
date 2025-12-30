function [x, P, nis] = ekfUpdate(x, P, Z, H, R)
    % size(H*P*H') 
    % size(R) debug
    S = H*P*H' + R;
    K = P*H'/S;
    y_res = Z - H * x;
    x = x + K*y_res;
    P = (eye(length(x)) - K*H)*P;
    nis = y_res' / S * y_res;
    
    % ak je v stave kvaternión
    x(7:10) = x(7:10) / norm(x(7:10));
end
