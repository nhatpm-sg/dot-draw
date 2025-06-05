# Excalidraw

[![npm](https://img.shields.io/npm/v/@excalidraw/excalidraw.svg)](https://www.npmjs.com/package/@excalidraw/excalidraw)
[![GitHub](https://img.shields.io/github/license/excalidraw/excalidraw.svg)](https://github.com/excalidraw/excalidraw/blob/master/LICENSE)

Excalidraw is a virtual collaborative whiteboard tool that lets you easily sketch diagrams that have a hand-drawn feel to them.

## ✨ Features

- **Free & Open Source** - Forever free and completely open source
- **Hand-drawn Feel** - All drawings have a distinctive hand-drawn style
- **Real-time Collaboration** - Multiple users can work on the same canvas simultaneously
- **Export Options** - Export your drawings as PNG, SVG, or JSON
- **Local-first** - Your data stays on your device by default
- **Zero Dependencies** - Runs entirely in the browser
- **Dark Mode** - Support for both light and dark themes
- **Mobile Friendly** - Works great on mobile devices
- **Keyboard Shortcuts** - Extensive keyboard support for power users

## 🚀 Quick Start

### Using the Web App

Visit [excalidraw.com](https://excalidraw.com) to start drawing immediately - no installation required!

### Installation

```bash
# Using npm
npm install @excalidraw/excalidraw

# Using yarn
yarn add @excalidraw/excalidraw
```

### Basic Usage

```jsx
import { Excalidraw } from "@excalidraw/excalidraw";

export default function App() {
  return (
    <div style={{ height: "500px" }}>
      <Excalidraw />
    </div>
  );
}
```

## 🛠️ Development

### Prerequisites

- Node.js 18+ 
- Yarn (recommended) or npm

### Setup

```bash
# Clone the repository
git clone https://github.com/excalidraw/excalidraw.git
cd excalidraw

# Install dependencies
yarn install

# Start development server
yarn start
```

The development server will be available at `http://localhost:3000`.

### Building

```bash
# Build for production
yarn build

# Run tests
yarn test

# Type checking
yarn test:typecheck

# Linting
yarn lint
```

## 📦 Packages

This repository contains multiple packages:

- `@excalidraw/excalidraw` - Main Excalidraw component
- `@excalidraw/utils` - Utility functions
- `@excalidraw/laser-pointer` - Laser pointer functionality
- `@excalidraw/mermaid-to-excalidraw` - Convert Mermaid diagrams to Excalidraw

## 🎨 Customization

### Themes

```jsx
<Excalidraw theme="dark" />
```

### Custom UI

```jsx
<Excalidraw
  UIOptions={{
    canvasActions: {
      loadScene: false,
      export: false,
      toggleTheme: false
    }
  }}
/>
```

## 🔧 API Reference

### Props

- `initialData` - Initial scene data
- `onChange` - Callback when scene changes
- `theme` - Theme mode ('light' | 'dark')
- `UIOptions` - Customize UI elements
- `viewModeEnabled` - Enable view-only mode

For complete API documentation, visit [docs.excalidraw.com](https://docs.excalidraw.com).

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](https://github.com/excalidraw/excalidraw/blob/master/CONTRIBUTING.md) for details.

### Development Workflow

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `yarn test`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with React and TypeScript
- Hand-drawn style inspired by [Rough.js](https://roughjs.com/)
- Icons from [Phosphor Icons](https://phosphoricons.com/)

## 🔗 Links

- [Official Website](https://excalidraw.com)
- [Documentation](https://docs.excalidraw.com)
- [npm Package](https://www.npmjs.com/package/@excalidraw/excalidraw)
- [GitHub Repository](https://github.com/excalidraw/excalidraw)

---

Made with ❤️ by the Excalidraw team

### Option 4: Deploy to Vercel

Deploy your own Excalidraw to Vercel với một click:

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/excalidraw/excalidraw)

Hoặc deploy manually:

1. **Fork repository này**
2. **Tạo tài khoản Vercel** tại [vercel.com](https://vercel.com)
3. **Connect GitHub repository** của bạn
4. **Deploy**: Vercel sẽ tự động detect cấu hình từ `vercel.json`

#### Build Settings được cấu hình sẵn:
- **Build Command**: `yarn build`
- **Output Directory**: `excalidraw-app/build`
- **Install Command**: `yarn install`
- **Node Version**: 18.x (từ `.nvmrc`)

#### Features đã được enable:
- ✅ SPA routing với rewrites
- ✅ Security headers
- ✅ Cache optimization cho static assets
- ✅ PWA support
- ✅ Environment variables
