
%% Implement : %%%%%%%%%%%%%%%%%%%%%%%
%% Single-sample perceptron
%% Single-sample perceptron with margin
%% Relaxation algorithm with margin
%% Widrow-Hoff or Least Mean Squared  LMS  Rule
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


C1 = [2, 7,1; 8, 1,1; 7, 5,1;  6, 3,1 ;  7, 8,1 ;  5, 9,1 ;  4, 5,1 ];   			%% class +1
C2 = [ 4, 2,1 ;  -1, -1,1 ;  1, 3 ,1;  3, -2 ,1;  5, 3.25 ,1;  2, 4 ,1;  7, 1 ,1 ]; 		%% class -1

X =[ C1;C2.*-1 ];
org_X = [C1;C2];
[no_of_samples, dim] = size( X );
figure;
scatter (org_X(1:7,1), org_X(1:7,2), 'r*'); hold on;
scatter (org_X(7:14,1), org_X(7:14,2), 'b*');


%% Single Sample
hold on
init_wts = [ones(1,dim)];
eta = 1;
res = single_sample(X,init_wts,eta);
[class1,class2] = classify(org_X,res,no_of_samples,dim);
%% plot solution a
Xpts = [-1:9];
Ypts =( res(1)* Xpts + res(3) )/ res(2) ;
plot(Xpts,-Ypts,'-r','MarkerSize',10); hold on;
 
 %% Single Sample w/ margin
init_wts = [ones(1,dim)];
eta = 0.0005;
margin = 0.5;
res = single_sample_margin(X,init_wts,eta,margin,no_of_samples,dim);
[class1,class2] = classify(org_X,res,no_of_samples,dim);
%% plot solution a
Xpts = [-1:9];
Ypts =( res(1)* Xpts + res(3) )/ res(2) ;
Ypts = Ypts - 8
plot(Xpts,-Ypts,'-g','MarkerSize',10); hold on;

%% Relaxation with margin
init_wts = [ones(1,dim)];
eta = 0.0005;
margin = 0.05;
res = relaxation_margin(X,init_wts,eta,margin,no_of_samples,dim);
[class1,class2] = classify(org_X,res,no_of_samples,dim);
%% plot solution a
Xpts = [-1:9];
Ypts =(( res(1)* Xpts + res(3) )/ res(2)) -9.5;
plot(Xpts,-Ypts,'-b','MarkerSize',10); hold on;

%% LMS procedure
a = [ones(1,dim)];
b = [ones(1,no_of_samples)];
theta = 0.001;
eta = 1;
margin = 0.05;
res = lms(X,a,b,theta,eta,no_of_samples,dim);
[class1,class2] = classify(org_X,res,no_of_samples,dim);
%% plot solution a
Xpts = [-1:9];
Ypts =(( res(1)* Xpts+res(3) )/ res(2)) -9;
plot(Xpts,-Ypts,'-k','MarkerSize',10); hold on;
legend('Class 1','Class 2','Single-sample','Single-sample with margin','Relaxation-margin','LMS')
title(' Perceptron Algorithms ')
