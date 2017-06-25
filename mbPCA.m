function [pcDec,eigPer] = mbPCA(data)

%% Michael Bellato: Principal Components Analysis
%
% prcomp = mbPCA(data)
% 
% Inputs -
%   data: input data
%
% Outputs - 
%   prcomp: Principal Components of data in descending order
%
%   Principal components are converted to Percentage of variance
%
%%
datalth = size(data,2);
datawdt = size(data,1);

dataMu = squeeze(mean(data,3));                 % compute mean
dataSub = bsxfun(@minus,dataMu,mean(dataMu,2)); % subtract mean
CoVarMat = (dataSub*dataSub')./(datalth-1);     % compute covariance matrix

[pc,eigvals] = eig(CoVarMat);                   % compute eigenvalues
seleigval = diag(eigvals);                      % select eigenvalues

pcDec = pc(:,end:-1:1);                         % PCs in descending order
eigDec = seleigval(end:-1:1);                   % Eigenvalues in dec order
eigPer = 100*eigDec./sum(eigDec);               % Percentage of variance
