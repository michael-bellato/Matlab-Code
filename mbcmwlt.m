function cmwlt = mbcmwlt(wfreq,wdur,wcy,wsr)

% Complex Wavelet convolution
% Michael Bellato 11/2/2016
% Wavelet Parameters - sr, dur, freq, wavelet cycles (assumes zero phase)
%% Specify parameters
dt = 1/wsr;                             % delta time
time = -wdur/2:dt:(wdur/2)-dt;          % time vector
amp = 1;                                % amplitude
%% Complex sine wave
sinewave = exp(time*2*pi*wfreq*1i);     % complex sine wave
subplot(311)                            % specify subplot
plot(time,real(sinewave),'-k')          % plot real components
hold on                                 % hold plot
plot(time,imag(sinewave),':k')          % plot real components

%% Construct gaussian window
s = wcy/(2*pi*wfreq);                   % standard deviation of gaussian
gaussw = amp*exp(-(time).^2/(2*(s^2))); % compute gaussian window
subplot(312)                            % specify subplot
plot(time,gaussw)                       % plot gaussian window
%% Convolve sine wave with window to create Morelet Wavelet
cmwlt = sinewave.*gaussw;               % multiply vectors
subplot(313)                            % specify subplot
plot(time,real(cmwlt),'-k')             % plot real complex Morlet wavelet
hold on
plot(time,imag(cmwlt),':k')             % plot imaginary complex Mortlet wavelet
end