% Solving a fifth degree equation in octave/matlab
% using four iterations of Newton's method.
f = @(x) x^5 + x + 1;
df= @(x) 5*x^4 + 1;
x = 0;
stop = 4;
for i = 1:stop
  x = x - f(x)/df(x);
end
disp(x);
