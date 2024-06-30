# Frontend app 

This app was bootstrapped using the [Vite React template](https://vitejs.dev/guide/).

## Setting up the dev environment 
```bash
npm install 

npm run dev 

# Dev server with HMR available at http://localhost:5173/
```

## How to build the app 
You can build the app locally with: 

```bash
npm run build
```

When building to deploy the app to an S3 bucket you should run:

```bash
npm run build-production
```

[Read about what this command does.](#how-npm-run-build-production-works)

## How `npm run build-production` works
This command builds the app and then creates a copy of the build files inside `dist/archive/<time-stamp>/`. So it looks like this:

```
📁 dist/
├── 📁 assets/
│   ├── 🎨 index-akla2l2.css
│   ├── 📜 index-kava2s.js
│   ├── 🏞️ website-image.svg
├── 📄 index.html
└── 📁 archive/
    └── 📁 20240315-120530/
        ├── 📄 index.html
        └── 📁 assets/
            ├── 🎨 index-akla2l2.css
            ├── 📜 index-kava2s.js
            └── 🏞️ website-image.svg
```

When the `dist/` directory is copied to S3, the app's build files will overwrite the previous build's files, but the latest timestamp will be added to the archive folder along side the previous archive builds. This allows for easy fast rollbacks. 