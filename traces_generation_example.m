%% Script to generate CAM intervals and sizes
% This script shows how to generate an arbitrary number of CAM sizes
% and intervals using the the markov chain model proposed in:
% Paper title: Empirical Models for the Realistic Generation of Cooperative Awareness Messages in Vehicular Networks
% Authors: Rafael Molina-Masegosa, Miguel Sepulcre, Javier Gozalvez, Friedbert Berens and Vincent Martinez

%% Parameters

% number of CAMs that will be generated
n_cam = 1e5;

% scenario ('highway', 'suburban', 'urban' or 'universal')
scenario = 'highway';

% car manufacturer profile ('volkswagen' or 'renault')
profile = 'volkswagen';

% generate complete model (intervals+sizes), only intervals, or only sizes
% (use 'complete', 'intervals' or 'sizes')
model = 'complete';

%% Load the transition matrix M and PDF 
% Load the transition matrix M and the PDF for the corresponding traces,
% depending on the model, scenario and profile selected
[M,pdf] = load_M_PDF(scenario, profile, model);

% Number of states in the Markov chain model, N
N = length(pdf);

%% Generation

switch model
    case 'complete'
        % Arrays to store the generated sizes and intervals, where interval 
        % 'k' is the interval before CAM with size 'k+1' in the arrays
        CAMsizes = zeros(1,n_cam);
        CAMintervals = zeros(1,n_cam-1);  %For 'n' cams, there are 'n-1' intervals
        
        %Arrays to plot results at the end
        CAMsizesIndex = zeros(1,n_cam);
        hist_corr = zeros(10,N/10);

        % First trace: random state following PDF
        r = rand;
        for i = 1:N
            if r <= sum(pdf(1:i))
                current_state = i;
                break;
            end
        end
        
        CAMsizes(1) = sizeBytes(profile,mod(current_state-1,N/10)+1);
        
        % Following traces: use the model
        for k = 2:n_cam
            r = rand;
            for i = 1:N                
                if r <= sum(M(current_state,1:i))
                    current_state = i;
                    break;
                end
            end
            
            %Store size
            CAMsizes(k) = sizeBytes(profile,mod(current_state-1,N/10)+1);
            CAMsizesIndex(k) = mod(current_state-1,N/10)+1;
            %Store interval in miliseconds and add the jitter
            CAMintervals(k-1) = (floor((current_state-1)/(N/10))+1) * 100 + normrnd(0,jitter_std_ms(scenario,profile));
            
            hist_corr((floor((current_state-1)/(N/10))+1),CAMsizesIndex(k)) = hist_corr((floor((current_state-1)/(N/10))+1),CAMsizesIndex(k)) + 1;
        end
        
        %correlated interval-size PDF
        figure
        bar(hist_corr./sum(hist_corr(:)));
        xlabel('Interval (x100 ms)');
        ylabel('PDF');
        switch profile
            case 'volkswagen'
                legend('200 bytes','300 bytes','360 bytes','455 bytes');                
            case 'renault'
                legend('200 bytes','330 bytes','480 bytes','600 bytes','800 bytes'); 
            otherwise
                error('''profile'' parameter value is not valid. Try ''volkswagen'' or ''renault''');
        end
        
        %jitter PDF
        figure
        histogram(CAMintervals - (round(CAMintervals/100)*100),-10.5:1:10.5,'Normalization','probability');
        ylabel('PDF');
        xlabel('CAM time-interval jitter (ms)');   
        
    case 'intervals'
        % Array to store the generated intervals
        CAMintervals = zeros(1,n_cam-1);  %For 'n' cams, there are 'n-1' intervals      
        
        % First trace: random state following PDF
        r = rand;
        for i = 1:N
            if r <= sum(pdf(1:i))
                current_state = i;
                break;
            end
        end
        
        % Following traces: use the model
        for k = 1:n_cam-1
            r = rand;
            for i = 1:N               
                if r <= sum(M(current_state,1:i))
                    current_state = i;
                    break;
                end
            end
            %Store in miliseconds and add the jitter
            CAMintervals(k) = current_state * 100 + normrnd(0,jitter_std_ms(scenario,profile));
            
        end
        
        %intervals PDF
        figure
        histogram(CAMintervals,50:100:1050,'Normalization','probability');
        ylabel('PDF');
        xlabel('CAM time-interval (ms)');
        
        %jitter PDF
        figure
        histogram(CAMintervals - (round(CAMintervals/100)*100),-10.5:1:10.5,'Normalization','probability');
        ylabel('PDF');
        xlabel('CAM time-interval jitter (ms)');
        
    case 'sizes'
        % Array to store the generated sizes
        CAMsizes = zeros(1,n_cam);        
        
        % First trace: random state following PDF
        r = rand;
        for i = 1:N
            if r <= sum(pdf(1:i))
                current_state = i;
                break;
            end
        end
        
        CAMsizes(1) = sizeBytes(profile,current_state);
        
        % Following traces: use the model
        for k = 2:n_cam
            r = rand;
            for i = 1:N              
                if r <= sum(M(current_state,1:i))
                    current_state = i;
                    break;
                end
            end
            CAMsizes(k) = sizeBytes(profile,current_state);
        end
        
        figure
        histogram(CAMsizes,'Normalization','probability');
        ylabel('PDF');
        xlabel('CAM size (bytes)');
        
    otherwise
        error('''model'' parameter value is not valid. Try ''complete'', ''intervals'' or ''sizes''');
end