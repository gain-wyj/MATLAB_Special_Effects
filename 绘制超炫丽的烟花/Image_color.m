matSize=[1600,1600];
point=[800,800];
colorList=[255   253   255
   255   255   244
   250   255   219
   212   242   156
    90   167     3
    32    96     0
    56    82     0];
colorMat=cColorMat(matSize,point,colorList);

colorMatR=colorMat(:,:,1);
colorMatG=colorMat(:,:,2);
colorMatB=colorMat(:,:,3);
fwPicR=double(colorMatR).*double(polarPic)./255;
fwPicG=double(colorMatG).*double(polarPic)./255;
fwPicB=double(colorMatB).*double(polarPic)./255;
fwPic(:,:,1)=fwPicR;
fwPic(:,:,2)=fwPicG;
fwPic(:,:,3)=fwPicB;
fwPic=uint8(fwPic);
imshow(fwPic)


    function colorMat=cColorMat(matSize,point,colorList)
    % matSize=[800,600];
    % point=[400,100];
    % colorList=[195    53    93
    %    211   102   141
    %    231   179   192
    %    229   182   172
    %    227   178   137
    %    238   191   147
    %    236   195   113];
    % colorMat=cColorMat(matSize,point,colorList);
    % imshow(colorMat)

    [xMesh,yMesh]=meshgrid(1:matSize(2),1:matSize(1));
    zMesh=sqrt((xMesh-point(2)).^2+(yMesh-point(1)).^2);
    zMesh=(zMesh-min(min(zMesh)))./(max(max(zMesh))-min(min(zMesh)));

    colorFunc=colorFuncFactory(colorList);
    colorMesh=colorFunc(zMesh);

    colorMat(:,:,1)=colorMesh(end:-1:1,1:matSize(1));
    colorMat(:,:,2)=colorMesh(end:-1:1,matSize(1)+1:2*matSize(1));
    colorMat(:,:,3)=colorMesh(end:-1:1,2*matSize(1)+1:3*matSize(1));

    colorMat=uint8(colorMat);

    end

    function colorFunc=colorFuncFactory(colorList)
        x=(0:size(colorList,1)-1)./(size(colorList,1)-1);
        y1=colorList(:,1);y2=colorList(:,2);y3=colorList(:,3);
        colorFunc=@(X)[interp1(x,y1,X,'linear')',interp1(x,y2,X,'linear')',interp1(x,y3,X,'linear')'];
    end
