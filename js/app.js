// Import support for Amazon Music

function addAmazonMusicImport() {
    const amazonTabButton = document.createElement('button');
    amazonTabButton.innerText = 'Amazon Music';
    amazonTabButton.onclick = openAmazonMusicPanel;
    document.querySelector('.import-tabs').appendChild(amazonTabButton);

    const amazonPanel = document.createElement('div');
    amazonPanel.className = 'import-panel amazon-music-panel';
    amazonPanel.innerHTML = `
        <h3>Import from Amazon Music</h3>
        <input type='file' id='amazon-csv' accept='.csv'>
        <p class='help-text'>Select your Amazon Music CSV file with playlist data.</p>
        <p class='warning-text'>Warning: Ensure your CSV format matches the required structure.</p>
    `;
    document.querySelector('.import-modal').appendChild(amazonPanel);
}

function openAmazonMusicPanel() {
    // Logic to switch to Amazon Music panel
    document.querySelectorAll('.import-panel').forEach(panel => panel.style.display = 'none');
    document.querySelector('.amazon-music-panel').style.display = 'block';
}

document.getElementById('amazon-csv').addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
        parseCSV(file, (progress) => {
            console.log('Parsing Progress:', progress);
        }).then((result) => {
            displayImportResult(result);
        });
    }
});

// Call function to initialize Amazon Music import support
addAmazonMusicImport();