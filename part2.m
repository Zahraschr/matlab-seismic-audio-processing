clc
clear 
close all
warning off

fs = 44100;
duration = 5; 
freq = 1000;
speed = 45; 
angleRange = [-90, 90]; 
angleIncrement = speed / fs;
leftChannel = zeros(1, duration * fs);
rightChannel = zeros(1, duration * fs);
t = linspace(0, duration, duration * fs);
sineWave = sin( 2 * pi * freq * t);


currentAngle = angleRange(1);
positionX = sind(currentAngle);
positionY = cosd(currentAngle);
for i = 1:length(t)
    positionX = sind(currentAngle);
    positionY = cosd(currentAngle);
    itdSamples = round(positionX * fs / 2);
    if itdSamples >= 0
        leftChannel(i) = sineWave(i);
        rightChannel(i + itdSamples) = sineWave(i);
    else
        leftChannel(i - itdSamples) = sineWave(i);
        rightChannel(i) = sineWave(i);
    end
    currentAngle = currentAngle + angleIncrement;
    if currentAngle > angleRange(2)
        currentAngle = angleRange(1);
    end
end

stereoAudio = [leftChannel, rightChannel];

audiowrite('out_audio.wav', stereoAudio, fs);