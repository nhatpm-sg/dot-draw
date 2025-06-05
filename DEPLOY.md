# 🚀 Deploy Excalidraw to Netlify

## Cách deploy nhanh chóng:

### 1. **Tạo tài khoản Netlify**
- Truy cập [netlify.com](https://netlify.com)
- Đăng ký/đăng nhập bằng GitHub account

### 2. **Deploy từ Git Repository**

#### Option A: Deploy từ GitHub (Khuyến nghị)
1. Push code lên GitHub repository
2. Vào Netlify Dashboard → "New site from Git"
3. Chọn GitHub và authorize
4. Chọn repository của bạn
5. Netlify sẽ tự động detect settings từ `netlify.toml`

#### Option B: Drag & Drop build folder
1. Build project locally:
   ```bash
   yarn install
   yarn build
   ```
2. Kéo thả folder `excalidraw-app/build` vào Netlify

### 3. **Build Settings** (Auto-configured từ netlify.toml)
- **Build command**: `yarn build`
- **Publish directory**: `excalidraw-app/build`
- **Node version**: 18

### 4. **Environment Variables** (Optional)
Nếu cần, có thể thêm các ENV vars trong Netlify dashboard:
- `VITE_APP_ENABLE_TRACKING=false`
- `VITE_APP_DISABLE_SENTRY=true`

## 📁 Files đã được chuẩn bị sẵn:

- ✅ `netlify.toml` - Cấu hình build và deploy
- ✅ `public/_redirects` - SPA routing 
- ✅ `.nvmrc` - Node version specification
- ✅ Security headers và cache optimization

## 🔧 Build Scripts có sẵn:

- `yarn build` - Production build
- `yarn build:app` - Build app only  
- `yarn start` - Development server
- `yarn serve` - Serve production build locally

## 🌐 Features được enable:

- ✅ PWA (Progressive Web App)
- ✅ Service Worker caching
- ✅ Font optimization
- ✅ Code splitting
- ✅ Security headers
- ✅ SPA routing

## 🔍 Troubleshooting:

### Build fails:
- Ensure Node.js 18.x is used
- Check if all dependencies are installed
- Verify no TypeScript errors

### App doesn't load:
- Check if `_redirects` file is present
- Verify build output directory is correct

### Performance issues:
- Enable PWA caching
- Check if fonts are loading from cache

## 🚀 Deploy URL:
Sau khi deploy thành công, bạn sẽ có:
- Production URL: `https://yourappname.netlify.app`
- Deploy previews cho mỗi PR
- Auto-deploy khi push to main branch 