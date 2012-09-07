% Solving a fifth degree equation in octave/matlab
% using the stopping criteria 10^-8 < |f(x)|
f = @(x) x^5 + x + 1;
df= @(x) 5*x^4 + 1;
x = 0;
tol = 10^-8;
while tol < abs(f(x))
  x = x - f(x)/df(x);
end
disp(x);
