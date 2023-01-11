function write_fet_func(idvdset,fet_tag)
funcname=sprintf('%s%d%d','fet_func',fet_tag);
fileID=fopen([funcname,'.m'],"w");
fprintf(fileID,'function idvdset_test=%s(vgslis_test,vdslis_test)\n',funcname);
for i=1:21
    fprintf(fileID,'idvdset(:,%d)=[\n',i);
    fprintf(fileID,'%.6e\n',idvdset(:,i));
    fprintf(fileID,'];\n');
end

fprintf(fileID,'vdslis=linspace(0,3,101);\n');
fprintf(fileID,'vgslis=linspace(-3,3,21);\n');
fprintf(fileID,'[vgsmat,vdsmat]=meshgrid(vgslis,vdslis);\n');

% vdslis=linspace(0,3,101);
% vgslis=linspace(-3,3,21);
% [vgsmat,vdsmat]=meshgrid(vgslis,vdslis);

fprintf(fileID,'[vgsmat_test,vdsmat_test]=meshgrid(vgslis_test,vdslis_test);\n');
fprintf(fileID,'idvdset_test=interp2(vgsmat,vdsmat,idvdset,vgsmat_test,vdsmat_test);\n');
% [vgsmat_test,vdsmat_test]=meshgrid(vgslis_test,vdslis_test);
% idvdset_test=interp2(vgsmat,vdsmat,idvdset,vgsmat_test,vdsmat_test);

fclose(fileID);
end