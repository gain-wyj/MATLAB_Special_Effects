windPic=wind(distPic,180,0.99);

    function resultPic=wind(oriPic,len,ratio)
        oriPic=double(oriPic);
        for i=1:len
            tempPic=[zeros(size(oriPic,1),1),oriPic(:,1:(end-1))].*ratio;
            oriPic(oriPic<tempPic)=tempPic(oriPic<tempPic);  
        end
        resultPic=uint8(oriPic);
    end
