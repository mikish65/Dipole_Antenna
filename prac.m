% Basic Antennas
a1 = dipole;
a2 = monopole;
a3 = helix;

%clear; %variables from workspace
%clc; %cmd window
%close; %figures

% View each design
%show(a1), figure, show(a2), figure, show(a3);


%What controls its resonance?
%What controls its gain?
%Which parameter changes the shape of the radiation pattern?

%freq = linspace(100e6, 1e9, 20);  
%s = sparameters(a1, freq);  
%rfplot(s)  % Return loss (S11)
% Resonance--reflectivity (S11) lowest at freq = 668MHz (-6.35dB), 2nd lowest = 810MHz
% (-6.1dB)
% Directionality--Omnidirectional in az, 
%figure, pattern(a1, 300e6)  % Far-field gain at 300 MHz, non-directional

fc = 1000e6;
lambda = physconst('LightSpeed')/fc; % =0.3

a = dipole;
a.Length = 0.5*lambda; % =5
a.Width = 0.01*lambda;  % = 0.01 %%Wider = simpler mesh
a;

freqs = [100e6, 200e6, 300e6, 400e6, 500e6, 600e6, 700e6, 800e6, 900e6, 1000e6, 1100e6];
%Z = zeros(size(freqs)); % Z=(0,0,0....0(10th));
for k = 1:length(freqs)
    f = freqs(k);
    sparam = sparameters(a, freqs);
    %disp(sparam);
    fprintf('Freq: %.1f MHz, %', f, sparam);
end
  
%%Return Loss S11
rfplot(sparam);
title('Return Loss (S11)');

s11_complex = rfparam(sparam, 1, 1); % sparam as complex no
S11_dB = 20*log10(abs(s11_complex)); % to dB

freq = sparam.Frequencies;
[minS11, idx] = min(S11_dB);
resonant_freq = freq(idx);
fprintf('\n\n S11 Resonant freq: %.2f \n', resonant_freq);

 threshold = -10;
 below_thresh = S11_dB <= threshold;
 fprintf('At length = %.2f at', a.Length);
 if any(below_thresh)
     transition = diff(below_thresh);
     start_idx = find(transition ==1,1, 'first')+1;
     end_idx = find(transition == -1,1, 'last');
     f_low = interp1(S11_dB(start_idx-1:start_idx), freq(start_idx-1:start_idx), threshold, 'linear');
     f_high = interp1(S11_dB(end_idx:end_idx+1), freq(end_idx:end_idx+1), threshold, 'linear');
     BW = f_high-f_low;
     fprintf('BW: %.2f,Low: %.2f,High: %.2f\n', BW, f_low, f_high)
     
 else
     fprintf('No BW \n')
 end
 
%%Input Impedance
Z = impedance(a, freqs);
% figure, plot(freqs, real(Z), 'b', freqs, imag(Z), 'r');
% xlabel('Freq (Hz)');
% ylabel('Impedance (Ohms)');
% legend('Real', 'Imag');
% grid on; title('Input Impedance');
% smithchart(Z);

[~, idx] = min(abs(imag(Z)));
res_freq = freq(idx);
fprintf('Z resonant freq: %.2f\n\n' , res_freq);

%%Radiation Pattern
% figure, pattern(a, fc) %300MHz


