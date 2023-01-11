idxSet=[
3,1
3,2
3,4
5,3
6,5
];

for i=1:size(idxSet,1)
    k1=idxSet(i,1);
    k2=idxSet(i,2);
    filename=sprintf('1-10-6-FET-idvd-vbg-3-3(21points)-%d-%d',k1,k2);
    idvdmat=readmatrix(['exp_data',filesep,'FET',filesep,filename,'.xlsx']);

    idvdpac{idxSet(i,1),idxSet(i,2)}=idvdmat;
end

z1=size(idvdpac,1);
z2=size(idvdpac,2)-1;

newcolor21

set(groot,'defaultAxesColorOrder',color21,...
      'defaultAxesLineStyleOrder','-|--|:')

figure
for i=1:size(idxSet,1)

    k1=idxSet(i,1);
    k2=idxSet(i,2);
 
    idvdmat = idvdpac{k1,k2};
    vgslis = idvdmat(:,1);
    idsmat = idvdmat(:,2:end);
    stag = sprintf('AT#%d-%d',k1,k2);

    subplot(2,3,i)
    plot(vgslis,idsmat)
    ylim([0 1e-4])
    title(stag)
end

set(groot,'defaultAxesLineStyleOrder','remove')

set(groot,'defaultAxesColorOrder','remove')
