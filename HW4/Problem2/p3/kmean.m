function [center,result] = kmean(set,k)
    [num,dimension] = size(set);
    label = zeros(num,1);
    center = zeros(k,dimension);
    d = floor(num/k);
    for i = 1:k
        center(i,:) = set(i*d,:);
    end
    flag = 1;
    while flag == 1
        center_update = zeros(k,dimension);
        center_account = zeros(k,1);
        label_update = zeros(num,1);
        for i = 1 : num
            distance = 3276700000000000;
            mark = 0;
            d = set(i,:);
            for j = 1:k
                p = d - center(j,:);
                p = p .* p;
                p = sum(sum(p));
                if p < distance
                    distance = p;
                    mark = j;
                end
            end
           
            
            center_update(mark,:) = center_update(mark,:)+ d;
            center_account(mark) = center_account(mark) +1;
            label_update(i) = mark;
        end
        for j = 1:k
            center_update(j,:) = center_update(j,:)/center_account(j);
        end
        center = center_update;
        mark = 0;
        for j = 1:num
            if label(j) ~= label_update(j)
                mark = 1;
            end
        end
        label = label_update;
        if mark == 0
            flag = 0;
        end
    end
    
    result = label';
end