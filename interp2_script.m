idxSet=[
3,1
3,2
3,4
5,3
6,5
];

i=1;
idvdmat=idvdpac{idxSet(i,1),idxSet(i,2)};
ratio=0.1;
idvdmaT=ratio.*idvdmat(1:101,:)+(1-ratio).*flipud(idvdmat(102:202,:));
idvdset=idvdmaT(:,2:22);

vdslis=linspace(0,3,101);
vgslis=linspace(-3,3,21);
[vgsmat,vdsmat]=meshgrid(vgslis,vdslis);

figure
surf(vdsmat,vgsmat,idvdset)

vds_test=1;
vgs_test=0;

vdslis_test=linspace(0,3,1001);
vgslis_test=linspace(-3,3,201);
[vgsmat_test,vdsmat_test]=meshgrid(vgslis_test,vdslis_test);


idvdset_test=interp2(vgsmat,vdsmat,idvdset,vgsmat_test,vdsmat_test);
figure
surf(vdsmat_test,vgsmat_test,idvdset_test)

for fet_idx=1:size(idxSet)
    k1=idxSet(fet_idx,1);
    k2=idxSet(fet_idx,2);
    idvdmat=idvdpac{k1,k2};
    ratio=1.0;
    idvdmaT=ratio.*idvdmat(1:101,:)+(1-ratio).*flipud(idvdmat(102:202,:));
    idvdset=idvdmaT(:,2:22);
    fet_tag=[k1,k2];
    write_fet_func(idvdset,fet_tag)
end