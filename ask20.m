% Define the message sequence
myname = 'my name is <insert name here>';

% Create source alphabet and calculate symbol probabilities
alphabet = unique(myname);  % Unique symbols in the message
probabilities = histcounts(double(myname), 0.5:numel(alphabet)+0.5) / numel(myname);  % Calculate symbol probabilities

% Create Huffman codebook
huffDict = huffmandict(alphabet, probabilities);

% Perform Huffman encoding of the message
huffEncoded = huffmanenco(myname, huffDict);

% Calculate entropy of the source
entropySource = -sum(probabilities .* log2(probabilities));

% Calculate performance of the code
bitrateSource = entropySource * numel(myname);  % Number of bits needed to represent the source
bitrateCode = numel(huffEncoded);  % Number of bits needed to represent the Huffman-encoded message
performance = bitrateSource / bitrateCode;

% Calculate redundancy
redundancy = 1 - (1 / performance);

% Display results
disp('Huffman Coding Results:')
disp(['Entropy of the source: ' num2str(entropySource) ' bits'])
disp(['Performance of the code: ' num2str(performance)])
disp(['Redundancy of the code: ' num2str(redundancy)])
