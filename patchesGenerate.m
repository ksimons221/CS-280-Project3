function [ patch  ] = patchesGenerate( imPath  )

im = imread(imPath);
patch = double(im2col(im, [5,5] , 'sliding'));

[w, h] = size(patch);
for i = 1: h
   single_patch = patch(:, i);
   meanOfPatch = mean(single_patch);
   if meanOfPatch == 0
        single_patch = zeros(25,1);
   else
        single_patch = (single_patch - mean(single_patch)*ones(w,1))./mean(single_patch);
   end
   patch(:,i) = single_patch;
end

patch = patch';

end

