load clown.mat;
[U,S,V]=svd(X);
size(U);
rank(X);

%k=5;


strl=['D:\MATLAB\2\23\Joker_k='];
for k=5:5:50
    %strl='D:\MATLAB\joker';
    colormap('gray');
    image(U(:,1:k)*S(1:k,1:k)*V(:,1:k)');
    saveas(gcf,[strl,num2str(k)],'jpg');
    close;
end

%saveas(gca,strl,'jpg')';
%close;
%save('joker.mat',X);