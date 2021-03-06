function [dt,alphaX,alphaY,alpha] = delta_t(U,V,dx,dy,dt_max,Re)
% vMax = max(max(sqrt(U.^2 + V.^2)));
% dt2 = 2*vMax/gather((max(max(bsxfun(@plus,arrayfun(@abs,U),arrayfun(@abs,V))))));
% dt2 = 2*vMax/gather((max(max(bsxfun(@plus,abs(U),abs(V))))));

vMax = gather(max(max(bsxfun(@hypot,U,V))));
dtx = dx^2./(4*vMax);
dty = dy^2./(4*vMax);
dt2 = 2*vMax/gather((max(max(abs(U) + abs(V)))));


dt = min([dtx dty dt2 dt_max]);

alphaX = dt/(dx^2*Re);
alphaY = dt/(dy^2*Re);
alpha = 2*alphaX + 2*alphaY;