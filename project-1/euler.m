function [tn, yn] = euler(f, t0, tend, y0, h)
%
% Solve the ODE y' = f(t, y) with Eulers method. 
% Input: f       : Function handle to the rhs. of the ODE. 
%        t0, tend: The integration interval. 
%        y0      : Initial value.   
%        h       : Stepsize.
% Output: tn     :
%         yn     : The solution at the points tn.

% Use zeros to allocate for optimization
t = t0;    % Current solution
y = y0;

tn = t0;   % Store the solution
yn = y0;

while t < tend
    if t + h > tend;
        h = tend - t;
    end
    
    % The Euler step
    %y = y + h * feval(f, t, y);
    y = y + h*f(t,y);
    t = t + h;
    
    % Store the solution
    tn = [tn, t];
    yn = [yn, y];
end

