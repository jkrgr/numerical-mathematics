% Vectorize the images
spock = double(imread('spock2.jpg'));
vader = double(imread('vader.jpg'));
eric= double(imread('eric.jpg'));

% Ensure that the kurtosis is positive
kurtosis(spock(:))
kurtosis(vader(:))
kurtosis(eric(:))

% Plot the superposition of the signals
imagesc(spock+vader+eric)
colormap gray
