
function result = pca_hand(ori,n)
    [hight,~] = size(ori);
    mean_ori = mean(ori);
    k = ones(hight,1);
    mean_ori = k*mean_ori;
    ori=ori-mean_ori;
    %centerlize original feature matrix
    mid=cov(ori);

    [vector,value]=eig(mid);
    [~,order]=sort(diag(value),'descend');
    vector=vector(:,order);
    T=vector(:,1:n);
    result=ori*T;

    for i = 1:n
        min1 = min(min(result(:,i)));
        max1 = max(max(result(:,i)));
        if abs(min1) > max1
            result(:,i) = -1*result(:,i);
        end
    end
end