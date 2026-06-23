
const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

async function generatePDF(inputFile, outputFile) {
  console.log(`📄 Generating PDF from ${inputFile}...`);
  
  const browser = await puppeteer.launch({
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox', '--disable-gpu']
  });
  
  const page = await browser.newPage();
  await page.goto(`file://${path.resolve(inputFile)}`, { waitUntil: 'networkidle0' });
  await page.pdf({
    path: outputFile,
    format: 'A4',
    printBackground: true,
    margin: { top: '0mm', bottom: '0mm', left: '0mm', right: '0mm' }
  });
  
  await browser.close();
  console.log(`✅ ${outputFile} generated (${fs.statSync(outputFile).size} bytes)`);
}

const args = process.argv.slice(2);
const inputFile = args[0];
const outputFile = args[1] || inputFile.replace('.html', '.pdf');

generatePDF(inputFile, outputFile).catch(err => {
  console.error('❌ Error:', err.message);
  process.exit(1);
});
