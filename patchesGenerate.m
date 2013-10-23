function [ patch  ] = patchesGenerate( imPath  )

im = imread(imPath);
patch = double(im2col(im, [5,5] , 'sliding'));

[h, w] = size(patch);
for i = 1: w
   single_patch = patch(:, i);
   meanOfPatch = mean(single_patch);
   if meanOfPatch == 0
        single_patch = zeros(25,1);
   else
        single_patch = (single_patch - mean(single_patch)*ones(h,1))./mean(single_patch);
   end
   patch(:,i) = single_patch;
end

patch = patch';

%keyboard;
%%means = mean(patch);
%meanColunms = ones(w,1) * means;
%patch = patch-meanColunms;
%patch = ones(h,w)*.0000001 + patch; %noise
%patch = normc(patch);
%patch = patch';


end

