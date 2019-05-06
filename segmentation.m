rgbImage = imread('frutas.jpg');
% Separe individual colors
R = double(rgbImage(:,:,1));
G = double(rgbImage(:,:,2));
B = double(rgbImage(:,:,3));
blueRatio = uint8(((100 * B)./(1+R+G)) .* (256./(1+B+R+G)));
%% Display images
fontSize = 28;
% Original image
subplot(2, 3, 1);
imshow(rgbImage);
title('Original RGB Image', 'FontSize', fontSize);
% Dark image
subplot(2, 3, 3);
imshow(uint8(B)); % Must be uint8 for display
title('Dark image', 'FontSize', fontSize);
%% Segmentated image
subplot(2, 3, 5);
a = uint8(B);
level = graythresh(a);
segment = imbinarize(a,level);
imshow(segment);
title('Segmented image', 'FontSize', fontSize);
%% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);