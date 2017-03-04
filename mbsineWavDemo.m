sr = 44100;
dt = 1/sr;
dur = 1;
df = 1/dur;
t = dt:dt:dur;
ntime = length(t);
nfreqs = 55;                %number of frequencies to plot
frequencies = [0:nfreqs-1]*df;          %frequencies in hz

phz = 2*pi*rand(1,5);
fvhz = 5*sin(2*pi*t*5+phz(1));
twhz = 12*sin(2*pi*t*20+phz(2));
tnhz = 10*sin(2*pi*t*10+phz(3));
trhz = 4*sin(2*pi*t*30+phz(4));
fthz = 7*sin(2*pi*t*40+phz(5));
sumwav = fvhz+twhz+tnhz+trhz+fthz;

xax = linspace(1,1000,44100);

figure
subplot(511); plot(xax,fvhz)
hold on
ylim([-12 12])
subplot(512); plot(xax,twhz); ylim([-12 12])
subplot(513); plot(xax,tnhz); ylim([-12 12])
subplot(514); plot(xax,trhz); ylim([-12 12])
subplot(515); plot(xax,fthz); ylim([-12 12])

% figure
% plot(xax,sumwav)

sumwavfft = fft(sumwav)/ntime;
sumwavfft = abs(sumwavfft).^2; %sumwavfft = abs(sumwavfft)*2; %for exact power recovery
sumwavspec = sumwavfft;

figure; subplot(211); plot(xax,sumwav);
subplot(212); bar(frequencies,sumwavspec(1:nfreqs))
