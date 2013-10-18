function [ patch  ] = patchesGenerate( im  )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

patch = double(im2col(im, [5,5] , 'sliding'));

[w, h] = size(patch);
for i = 1: h
   single_patch = patch(:, i);
   single_patch = (single_patch - mean(single_patch)*ones(w,1))./mean(single_patch);
   patch(:,i) = single_patch;
end


end

