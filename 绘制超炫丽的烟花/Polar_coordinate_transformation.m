polarPic=polarTransf(windPic(:,end:-1:1)');

    function resultPic=polarTransf(oriPic)
        oriPic=double(oriPic);
        [m,n]=size(oriPic);
        [t,r]=meshgrid(linspace(-pi,pi,n),1:m);
        
        M=2*m;
        N=2*n;
        [NN,MM]=meshgrid((1:N)-n-0.5,(1:M)-m-0.5);
        T=atan2(NN,MM);
        R=sqrt(MM.^2+NN.^2);
        
        resultPic=interp2(t,r,oriPic,T,R,'linear',0);
        resultPic=uint8(resultPic);
    end
