% Vectorize the images
spock = double(imread('spock.jpg'));
r2d2 = double(imread('r2d2.jpg'));
bender = double(imread('bender.jpg'));

% Ensure that the kurtosis is positive
kurtosis(spock(:))
kurtosis(r2d2(:))
kurtosis(bender(:))

% Plot the superposition of the signals
imagesc(spock+r2d2+bender)
colormap gray
