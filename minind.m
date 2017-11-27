function [MIN W K]=minind(X)
[a b]=max(X);
[q p]=max(a);
MIN=q;
K=p;
W=b(p);
end

