% Real Wavelet convolution
% Michael Bellato 11/2/2016
%% Specify parameters
sr = 44100;                             % sampling rate
dt = 1/sr;                              % delta time
dur = 2;                                % duration
time = -dur/2:dt:(dur/2)-dt;            % time vector
freq = 15;                              % frequency of wave
amp = 1;                                % amplitude
wcy = 6;                                % wavelet cycles
%% Construct sine wave
sinewave = cos(time*2*pi*freq);         % sine wave of frequency "freq"
subplot(311)                            % specify subplot
plot(time,sinewave)                     % plot sinewave
hold on                                 % hold plot
%% Construct gaussian window
s = wcy/(2*pi*freq);% standard deviation of sine wave
gaussw = amp*exp(-(time).^2/(2*(s^2))); % compute gaussian window
subplot(312)                            % specify subplot
plot(time,gaussw)                       % plot gaussian window
%% Convolve sine wave with window to create Morelet Wavelet
mwlt = sinewave.*gaussw;                % multiply vectors
subplot(313)                            % specify subplot
plot(time,mwlt)                         % plot Morlet wavelet