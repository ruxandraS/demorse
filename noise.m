function noise(wavfile);
  %% constructing Gauss noise and wrong code, input string, corresponding array is X.
  %normalNoise is Gauss noise, wrongCode is wrong code sin wave
  %noise_orimorsecode is wave form with Gauss noise and wrong code

  [x, Fs] = audioread(wavfile);
  len = length(x);
  threshold = 0.05;

  % constructing Gauss noise
  noiseMean = 0;
  ori_morsecode = x;
  noiseStd = std(ori_morsecode)/10;
  normalNoise = normrnd(noiseMean, noiseStd, length(ori_morsecode), 1);
  noise_orimorsecode = x + normalNoise;

  % constructing wrong code
  wrongCode = threshold * sin([0:0.001:2*pi]);
  noise_orimorsecode = [noise_orimorsecode(1:len/2); wrongCode'; noise_orimorsecode(len/2+1:end)];

  % writing to file
  [filename, ext] = strsplit (wavfile, '.') {1,:};
  filename = [filename '_noisy.' ext];
  audiowrite(filename, noise_orimorsecode, Fs);

endfunction
