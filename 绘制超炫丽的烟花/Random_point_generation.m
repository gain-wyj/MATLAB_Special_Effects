blackPic=uint8(zeros(800,800));
distPic=imnoise(blackPic,'gaussian',0, 0.1);
distPic(distPic<254)=0;
