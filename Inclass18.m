% In class 18
%GB comments
1. 100
2. 100
Overall:100


% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  
yeast = imread('yeast.tif');
yeast_comp = imcomplement(yeast); 
yeast_mask = yeast_comp>206;
edge_img = edge(yeast_mask, 'canny');
imshow(edge_img, []); 
[centers, radii] = imfindcircles(edge_img, [20 50], 'Sensitivity', 0.94); 
figure; imshow(edge_img, []); hold on; 
for ii = 1: length(centers)
    drawcircle(centers(ii,:), radii(ii),'m');
end 
figure; imshow(yeast,[]); hold on; 
for ii = 1:length(centers)
    drawcircle(centers(ii,:), radii(ii), 'm');
end 


% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 
a = randi([1 9], 10, 1)
b = randi([1 10], 10, 1) 

[is_sig, pval] = ttest(a, b); 
% not significant, I got is_sig = 0
% 10 
for ii =1:20
    a = randi([1 9], 10, 1);
    b = randi([1 10], 10, 1); 
    [is_sig(ii), pval(ii)] = ttest(a, b); 
end 
sum(is_sig); 
% i got 1 out of 20 runs

%100
for ii =1:20
    a = randi([1 9], 100, 1);
    b = randi([1 10], 100, 1); 
    [is_sig(ii), pval(ii)] = ttest(a, b); 
end 
sum(is_sig); 
% 4 out of 20 runs

%1000
for ii =1:20
    a = randi([1 9], 1000, 1);
    b = randi([1 10], 1000, 1); 
    [is_sig(ii), pval(ii)] = ttest(a, b); 
end 
sum(is_sig); 
%20 out of 20 runs

%as sample size increase, you get the true representation of the different
%distribution. 
