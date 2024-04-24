%Signal and Noise Probability Program
numPts = 1000;      %Number of data points
noiseStrength = 0.5;   %Controls how much noise there is
threshold = 1;       %Threshold for good data (Adjustable)

%Generate "correct" Normal Distribution Data Signal
correctData = normrnd(0, 1, numPts, 1); % Mean = 0, Std Dev = 1
%correctData = exprnd(1, numPts, 1);

%Generate Random Noise Signal Using randn
noisySignal = randn(numPts, 1) * noiseStrength;

%Combine "correct" data signal with noise signal
combinedSignal = correctData + noisySignal;

%Plot "correct" data signal
subplot(2, 1, 1); %Plot correct signal on row 1
%plot(correctData);  %Uncomment this if a normal plot is wanted
histogram(correctData, 'Normalization', 'probability'); %Use histogram for better plot with
title('Correct Data Signal');                           %normalization and probability attributes
xlabel('Value');
ylabel('Probability');

%Plot combined signal with noise
subplot(2, 1, 2); %Plot combined signal on row 2
%plot(combinedSignal);  %Uncomment this if a normal plot is wanted
histogram(combinedSignal, 'Normalization', 'probability'); %Use histogram for noisy signal with
title('Combined Signal with Noise');                       %normalization and probability attributes
xlabel('Value');
ylabel('Probability');


%--------------------------------------------------------------------------
%Calculate probability of receiving good data by taking sum 
% of all values that are greater than less than the threshold
goodDataCount = sum(abs(combinedSignal) < threshold); %Need abs() because distribution has negative values
goodDataProbability = goodDataCount / numPts;
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Calculate the Signal-to-Noise Ratio (SNR)
SNR = abs(mean(correctData) / mean(noisySignal));

% Estimate Probability of "Good" Data
goodDataProbability2 = 1/(1+ exp(-SNR)); % Probability decreases exponentially with increasing SNR
%--------------------------------------------------------------------------

%Display probabilities in console
disp(['Probability of receiving "correct" data: ', num2str(goodDataProbability)]);
%disp(['Probability of receiving noise data: ', num2str(1-goodDataProbability)]);
disp(['Signal-to-Noise Ratio (SNR): ', num2str(SNR)]);
disp(['Estimated Probability of Good Data from SNR: ', num2str(goodDataProbability2)]);

