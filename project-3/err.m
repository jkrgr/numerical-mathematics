%Calculates the difference in the non-Gaussianity measure as a measure of
%error.
function difference=err(Wk, Wkneg1,xx)
    difference=abs(phif(Wk,xx)-phif(Wkneg1,xx));
end