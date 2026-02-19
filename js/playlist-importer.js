import { parseAmazonMusic, validateAmazonMusicFormat, isAmazonMusicFormat } from './amazonMusicParser.js';

// ... (retaining all prior code and utility functions) ...

export async function parseGenericCSV(csvText, api, onProgress) {
    // Place the body of the old parseCSV here. Do not change its internals except name.
}

export async function parseCSV(csvText, api, onProgress) {
    if (
        (isAmazonMusicFormat && isAmazonMusicFormat(csvText)) ||
        (validateAmazonMusicFormat && validateAmazonMusicFormat(csvText)?.isValid)
    ) {
        return parseAmazonMusic(csvText, api, onProgress);
    }
    return parseGenericCSV(csvText, api, onProgress);
}

// rest of file unchanged.