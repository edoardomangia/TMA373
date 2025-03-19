function plotmygrid(N,T,P)
clf; axis('equal');

for i=1:size(T,1)
    if (abs(P(i)-8.85e-12.*pi*4e-7)<=1e-30) % in the air
        patch(N(T(i,1:3),1),N(T(i,1:3),2),[1 1 0]);
    else % in the chicken
        patch(N(T(i,1:3),1),N(T(i,1:3),2),[173 255 47]/256);
    end

    for j=1:3
        line([N(T(i,j),1) N(T(i,mod(j,3)+1),1)], ...
             [N(T(i,j),2) N(T(i,mod(j,3)+1),2)], ...
             'Color', 'b', 'LineWidth',T(i,j+3)*3+1);
    end
end

m=size(N,1);
if m<100
    for i=1:m
        text(N(i,1)+.02,N(i, 2)+.02,num2str(i));
    end
end

% print("G0", '-dsvg');

end

