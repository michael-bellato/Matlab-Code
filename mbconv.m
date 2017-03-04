function conv = mbconv(vec1,vec2)

% Michael Bellato
% mbconv computes the time doamin convlution between a signal and a kernel
% signal and kernel are assumed to be vectors

kerlth = length(vec1);
siglth = length(vec2);
if siglth > kerlth
    kernel = vec1; signal = vec2;
else
    signal = vec1; kernel = vec2;
end
zpad = zeros(1,length(kernel)-1);
convsig = [zpad signal zpad];
convker = flip(kernel);
conv = zeros(1,length(kernel)+length(signal)-1);
for j = 1:(length(convsig)-(length(convker)-1))
conv(j) = sum(convker.*convsig(j:j+length(convker)-1));
end
% trim = length(kernel)/2;
% conv = conv(trim:end-trim);
