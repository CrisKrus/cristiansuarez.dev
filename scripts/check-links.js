const fs = require('fs');
const path = require('path');

// Directorio base donde están los archivos Markdown
const BASE_DIR = 'content/posts';

// Función para verificar si un archivo o directorio existe
const fileExists = (filePath) => fs.existsSync(filePath);

// Función para buscar y verificar enlaces en un archivo Markdown
const checkLinksInFile = (filePath) => {
    const content = fs.readFileSync(filePath, 'utf-8');
    const linkRegex = /\[.*?\]\((.*?)\)/g;
    let match;
    const brokenLinks = [];

    while ((match = linkRegex.exec(content)) !== null) {
        const link = match[1];

        // Ignorar enlaces externos
        if (link.startsWith('http://') || link.startsWith('https://')) {
            continue;
        }

        const absolutePath = path.resolve(path.dirname(filePath), link);

        if (!fileExists(absolutePath)) {
            brokenLinks.push({ file: filePath, link });
        }
    }

    return brokenLinks;
};

// Recorrer todos los archivos Markdown y verificar enlaces
const checkLinksInDirectory = (dir) => {
    const files = fs.readdirSync(dir);
    let brokenLinks = [];

    files.forEach((file) => {
        const fullPath = path.join(dir, file);

        if (fs.statSync(fullPath).isDirectory()) {
            brokenLinks = brokenLinks.concat(checkLinksInDirectory(fullPath));
        } else if (file.endsWith('.md')) {
            brokenLinks = brokenLinks.concat(checkLinksInFile(fullPath));
        }
    });

    return brokenLinks;
};

// Ejecutar el script
const brokenLinks = checkLinksInDirectory(BASE_DIR);

if (brokenLinks.length > 0) {
    console.log('Enlaces rotos encontrados:');
    brokenLinks.forEach(({ file, link }) => {
        console.log(`Archivo: ${file}, Enlace roto: ${link}`);
    });
} else {
    console.log('No se encontraron enlaces rotos.');
}