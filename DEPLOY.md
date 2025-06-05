# 🚀 Deploy Excalidraw to Vercel

## Cách deploy nhanh chóng:

### 1. **Deploy với One-Click** (Khuyến nghị)

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/excalidraw/excalidraw)

### 2. **Deploy từ Git Repository**

#### Bước 1: Tạo tài khoản Vercel
- Truy cập [vercel.com](https://vercel.com)
- Đăng ký/đăng nhập bằng GitHub account

#### Bước 2: Import Project
1. Push code lên GitHub repository
2. Vào Vercel Dashboard → "New Project"
3. Import từ GitHub repository
4. Vercel sẽ tự động detect settings từ `vercel.json`

#### Bước 3: Configure (Auto-configured)
- **Build Command**: `yarn build`
- **Output Directory**: `excalidraw-app/build`
- **Install Command**: `yarn install`
- **Node Version**: 18.x (từ `.nvmrc`)

### 3. **Build Manual** (Testing)
```bash
# Install dependencies
yarn install

# Build production
yarn build

# Test local production build
yarn build:preview
```

### 4. **Environment Variables** (Optional)
Có thể thêm trong Vercel dashboard:
- `VITE_APP_ENABLE_TRACKING=true` (đã có trong vercel.json)
- `VITE_APP_DISABLE_SENTRY=true` (nếu muốn tắt error tracking)
- `VITE_APP_GIT_SHA` (tự động set bởi Vercel)

## 📁 Files đã được chuẩn bị sẵn:

- ✅ `vercel.json` - Cấu hình build, routing và headers
- ✅ `.nvmrc` - Node version specification
- ✅ `package.json` scripts - Build commands
- ✅ SPA routing support
- ✅ Security headers và cache optimization

## 🔧 Build Scripts có sẵn:

- `yarn build` - Production build (cho Vercel)
- `yarn build:app` - Build app với tracking enabled
- `yarn start` - Development server
- `yarn build:preview` - Build và preview locally

## 🌐 Features được enable:

- ✅ PWA (Progressive Web App)
- ✅ Service Worker caching
- ✅ SPA routing với rewrites
- ✅ Security headers (CSP, XSS protection, etc.)
- ✅ Cache optimization cho static assets
- ✅ Font optimization
- ✅ Code splitting
- ✅ Environment variables
- ✅ Git SHA tracking

## 🔍 Troubleshooting:

### Build fails trên Vercel:
- Check Node.js version trong `.nvmrc`
- Verify dependencies trong `package.json`
- Check build logs trong Vercel dashboard

### App không load sau deploy:
- Verify routing rewrites trong `vercel.json`
- Check console errors trong browser
- Verify build output directory

### Performance issues:
- Enable edge caching trong Vercel
- Check static asset caching headers
- Verify PWA caching

## 🚀 Vercel Features:

### Sau khi deploy thành công:
- **Production URL**: `https://yourproject.vercel.app`
- **Preview deployments** cho mỗi branch
- **Auto-deploy** khi push to main branch
- **Edge caching** worldwide
- **Analytics** và performance monitoring

### Vercel CLI (Optional):
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy từ terminal
vercel

# Deploy production
vercel --prod
```

## 🔧 Advanced Configuration:

### Custom Domain:
1. Vào Project Settings trong Vercel
2. Add custom domain
3. Configure DNS records

### Environment Variables:
1. Project Settings → Environment Variables
2. Add variables for Production, Preview, Development

### Build Performance:
- Vercel automatically caches dependencies
- Build time: ~2-3 minutes
- Deploy time: ~30 seconds

---

**Ready to deploy!** 🎉

Chỉ cần push code lên GitHub và connect với Vercel là xong! 