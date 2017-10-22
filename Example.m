#First, create a FIS, specifying its name.
a = newfis('tipper');
#Add the first input variable for the service quality using addvar.
a = addvar(a,'input','service',[0,8]); 
a = addmf(a,'input',1,'very poor','gaussmf',[0.5,2]);
a = addmf(a,'input',1,'poor','gaussmf',[1.5,3]);
a = addmf(a,'input',1,'medium','gaussmf',[2,5]);
a = addmf(a,'input',1,'good','gaussmf',[4,6]);
a = addmf(a,'input',1,'very good','gaussmf',[5,8]);
a = addmf(a,'input',1,'excellent','gaussmf',[7,10]);
#Add the second input variable for the food quality and add two trapezoidal membership functions.
a = addvar(a,'input','food',[0,10]);
a = addmf(a,'input',2,'awful','trapmf',[0.5,1,2,3]);
a = addmf(a,'input',2,'rancid','trapmf',[1,2,3,4]);
a = addmf(a,'input',2,'medium','trapmf',[3,4,5,6]);
a = addmf(a,'input',2,'good','trapmf',[4,5,6,7]);
a = addmf(a,'input',2,'delicious','trapmf',[5,8,9,10]);
#Add the output variable for the tip, and add three triangular membership functions.
a = addvar(a,'output','tip',[0,10]);
a = addmf(a,'output',1,'very cheap','trimf',[-1,1,3]);
a = addmf(a,'output',1,'cheap','trimf',[2,3,4]);
a = addmf(a,'output',1,'average','trimf',[3,4,6]);
a = addmf(a,'output',1,'very good','trimf',[5,7,9]);
a = addmf(a,'output',1,'generous','trimf',[5,8,10]);
#Specify the following three rules for the FIS as an array:
ruleList = [1.20 1.30 1.50 1 1;
            2 0 2 1 2;
            3 3 3 1 1; 
	    4 4 4 1 1];
#Add the rules to the FIS.
a = addrule(a,ruleList);
showrule(a)
#To evaluate the output of a fuzzy system for a given input combination, use the evalfis command.
evalfis([1 2],a)
#You can also evaluate multiple input combinations using an array where each row represents one input combination.
inputs = [2,3;4,5;6,7];
evalfis(inputs,a)
plotmf(a,'input',1);
plotmf(a,'input',2);
plotmf(a,'output',1);
gensurf(a);
showfis(a)           
