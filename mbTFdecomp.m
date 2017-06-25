function tfDecomp = mbTFdecomp(data,fmin,fmax,wcy,SR)

% Michael Bellato: Time-Frequency Decomposition of time series data
%
% tfDecomp = mbTFdecomp(data,fmin,fmax,dur,SR)
% 
% Inputs -
%   data: time series data
%   fmin: minimum frequency to be analyzed
%   fmax: maximum frequency to be analyzed
%   dur : duration of data
%   SR  : sampling rate of data
%
% Outputs - 
%   tfDecomp: matrix of frequency by time data
%   ntime   : time vector for plotting
%
% This program does not plot the decomposed data. For long signal with 
% multiple epochs, consider applying function on entire data length and 
% segment epochs post hoc (computationally effective and avoids edge effects)

if nargin<5
    SR = 1000;                              % Sampling rate
elseif nargin<4
    SR = 1000; wcy = 3;                     % Wavelet cycles
elseif nargin<3
    SR = 1000; wcy = 3; fmax = 30;          % maximum wavelet frequency
elseif nargin<2
    SR = 1000; wcy = 3; fmax = 30;  fmin = 2;% minimum wavelet frequency
end

freqsz = (fmax - fmin) + 1;                 % number of frequencies
dur = (length(data)/SR)/2;                  % dur of wavelet
dt = 1/SR;                                  % time steps
amp = 1;                                    % amplitude (for convention)
timevec = -dur:dt:dur-dt;                   % time vector
timemat = repmat(timevec,freqsz,1);         % repeat time vec for computational efficiency
wfreqs = fmin:1:fmax;                       % frequency vector

sinewave = exp(timemat'.*2*pi.*wfreqs*1i)'; % complex sine wave
s = wcy./(2*pi*wfreqs);                     % standard deviation of gaussian
gaussw = amp*exp(-(timemat).^2./(2*(s.^2))');% compute gaussian window
cmwlt = sinewave.*gaussw;                   % multiply vectors

fftwavlet = fft(cmwlt);                     % fft of wavelet
fftsignal = fft(data);                      % fft of signal
tfDecomp  = ifft(fftwavlet.*fftsignal');    % spectral dot prod = temp conv

















