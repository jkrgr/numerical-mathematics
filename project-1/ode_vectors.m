function f = ode_vectors(t,y)
  f = y;
  f(1) = -sin(f(2));
  f(2) = f(1);
end
