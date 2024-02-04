text = 'This is a short text';

% Remove spaces and convert to lowercase
text = lower(strrep(text, ' ', ''));

% Get unique characters in the text
uniqueChars = unique(text);

% Count occurrences of each character
charCount = zeros(1, numel(uniqueChars));
for i = 1:numel(uniqueChars)
    charCount(i) = sum(text == uniqueChars(i));
end

% Calculate probabilities of occurrence
totalChars = sum(charCount);
probabilities = charCount / totalChars;

% Calculate entropy
entropy = -sum(probabilities .* log2(probabilities));

% Display probabilities of occurrence
fprintf('Probabilities of occurrence of characters:\n');
for i = 1:numel(uniqueChars)
    fprintf('%c: %.4f\n', uniqueChars(i), probabilities(i));
end

% Display entropy
fprintf('Entropy: %.4f\n', entropy);


