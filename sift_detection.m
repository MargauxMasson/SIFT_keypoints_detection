I = imread('NotreDame5.jpg') ;

figure(1);
image(I) ;
I = single(rgb2gray(I)) ;
[f,d] = vl_sift(I) ; 
% f is a feature frame and has the format [X;Y;S;TH], 
% where X,Y is the (fractional) center of the frame, 
% S is the scale and TH is the orientation (in radians)

length = size(f,2);
% we take only the 200 last keypoints because
% they are the highest response keypoints (highest scale)
last_200_points = length-200:length;
highest_response_keypoints = f(:,last_200_points);

h1 = vl_plotframe(highest_response_keypoints);
x = f(1,last_200_points);
y = f(2,last_200_points);

h2 = vl_plotframe(highest_response_keypoints) ;
set(h2,'color','g','linewidth',1) ;

figure(2);
plot(x,-y,'o');


A = [x; y];
fileID = fopen('results/NotreDame5.txt','w');
fprintf(fileID,'%6s %12s\n','x','y');
fprintf(fileID,'%6.2f %12.8f\n',A);
fclose(fileID);

