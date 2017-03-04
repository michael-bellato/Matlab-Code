% Michael Bellato
% KNN classifier
% compute Euclidian distance (EucD)
% Train data 65%
% Test data  35%
%% To test classifier; create fake data
x1 = linspace(1,50,1000)';          % similar to 15hz power
y1 = linspace(1,50,1000)';          % similar to DV
r1 = (randn(1000,1)*10)+20;         % add noise
y1 = r1+y1; classdata1 = repmat({'rough'},1000,1);

x2 = x1;
y2 = (randn(1000,1)*10); classdata2 = repmat({'loud'},1000,1);

scatter(x1,y1,'b')
hold on
scatter(x2,y2,'k')
% granddata = [x1,ydata1;x2,ydata2]; % Concatenate both data sets
data.one = [x1 y1]; data.two = [x2 y2];
data.class1 = classdata1; data.class2 = classdata2;
% data.granddata = [x1,ydata1;x2,ydata2]; % Concatenate both data sets
%% Parse data for train (65%) and test (35%) - testid & trnid
k = 3;                          % Number of nearest neighbors
lth = length(data.one);
trnsz = 0.65*lth;
trnid = [randperm(lth,trnsz)' randperm(lth,trnsz)'];
trnid = sort(trnid);
testsz = (1:lth)';
testones = ones(lth,2);
testones(trnid(:,1),1) = 0;
testones(trnid(:,2),2) = 0;
testid = [testsz(testones(:,1)~=0) testsz(testones(:,2)~=0)];
data.trnid = trnid; data.testid = testid;

figure
scatter(data.one(trnid(:,1),1),data.one(trnid(:,1),2),'y')
hold on
scatter(data.two(trnid(:,2),1),data.two(trnid(:,2),2),'y')
scatter(data.one(testid(:,1),1),data.one(testid(:,1),2),'k')
scatter(data.two(testid(:,2),1),data.two(testid(:,2),2),'k')

data.trnclass = [data.class1(trnid(:,1)) data.class2(trnid(:,2))];
data.tstclass = [data.class1(testid(:,1)) data.class2(testid(:,2))];
data.train = [data.one(data.trnid(:,2)) data.two(data.trnid(:,2))];
%%
data.testoutcome(j) = NaN(350,2);
for j = 1:length(testid) % test data from dataset one
    testvec = repmat(data.one(j,:),trnsz);
    EucD = sqrt(((data.train(:,1)-testvec(:,1)).^2)+((data.train(:,2)-testvec(:,2)).^2));
    EucDid = [EucD trnid(:,1)];
    knn = sort(EucDid); knn = knn(1:k,:);
    knnid = knn(:,2);
    knnclass = class1(knnid);
    data.testoutcome(j,1) = ; % compare (==) with tstclass
end

for j = 1:length(testid)  % test data from dataset two

    testvec = repmat(data.x2(j,:),trnsz);
    EucD = sqrt(((traindata(:,1)-testvec(:,1)).^2)+((traindata(:,2)-testvec(:,2)).^2));
    knn = sort(EucD); knn = knn(1:k,:);
    
end

cellfun(@strcmp,x,y)

%%
% traindata = granddata(trnid,:);
% trainclass = grandclass(trnid,:);
% testdata  = granddata(testid,:);
% testclass = grandclass(testid,:);











% EucD = sqrt(((x2-x1)^2)+((y2-y1)^2));