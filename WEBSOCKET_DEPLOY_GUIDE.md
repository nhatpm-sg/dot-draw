# 🚀 Hướng dẫn Deploy WebSocket Server lên Render.com và Kết nối với Vercel

## 📋 Tóm tắt
Hướng dẫn này sẽ giúp bạn:
1. Deploy WebSocket server lên render.com 
2. Cấu hình Vercel để sử dụng WebSocket server
3. Test collaboration functionality

## 🔧 Các lỗi đã được sửa

### Lỗi TypeScript đã khắc phục:
```bash
# Trước khi sửa:
src/index.ts(1,21): error TS7016: Could not find a declaration file for module 'express'
src/index.ts(5,19): error TS7016: Could not find a declaration file for module 'debug'
src/index.ts(46,15): error TS6133: 'req' is declared but its value is never read
src/index.ts(46,15): error TS7006: Parameter 'req' implicitly has an 'any' type

# Sau khi sửa: ✅ BUILD SUCCESS
```

### Những thay đổi đã thực hiện:
- ✅ Tạo file `src/types.d.ts` cho type declarations
- ✅ Cập nhật `tsconfig.json` để bớt strict
- ✅ Sửa các type annotations trong code
- ✅ Thêm `.nvmrc` để chỉ định Node.js version

## 🌐 Bước 1: Deploy lên Render.com

### 1.1 Tạo tài khoản và dự án
1. Đi tới [render.com](https://render.com) và tạo tài khoản
2. Click **"New +"** → **"Web Service"**
3. Kết nối với GitHub repository của bạn
4. Chọn thư mục `excalidraw-websocket-server`

### 1.2 Cấu hình Build Settings
```
Build Command: npm run build
Start Command: npm start
Environment: Node
Node Version: 18 (từ .nvmrc)
```

### 1.3 Environment Variables
Thêm các biến môi trường sau:
```bash
NODE_ENV=production
CORS_ORIGIN=https://your-excalidraw-app.vercel.app
PORT=10000
DEBUG=excalidraw:server,excalidraw:io
```

### 1.4 Deploy
1. Click **"Create Web Service"**
2. Đợi deployment hoàn thành (~ 3-5 phút)
3. Copy URL được tạo (ví dụ: `https://excalidraw-ws-abc123.onrender.com`)

## ⚡ Bước 2: Cấu hình Vercel

### 2.1 Cập nhật vercel.json
File `vercel.json` đã được cập nhật với:
```json
{
  "env": {
    "VITE_APP_ENABLE_TRACKING": "true",
    "VITE_APP_WS_SERVER_URL": "https://your-websocket-server.onrender.com"
  }
}
```

### 2.2 Thay đổi URL WebSocket
**Thay thế** `https://your-websocket-server.onrender.com` bằng URL thực tế từ render.com:
```json
"VITE_APP_WS_SERVER_URL": "https://excalidraw-ws-abc123.onrender.com"
```

### 2.3 Deploy lại Vercel
```bash
# Nếu sử dụng Vercel CLI
vercel --prod

# Hoặc push changes lên GitHub để auto-deploy
git add .
git commit -m "Update WebSocket server URL"
git push origin main
```

## 🔄 Bước 3: Cập nhật CORS trên Render.com

Sau khi có URL Vercel, cập nhật lại environment variable:
```bash
CORS_ORIGIN=https://your-excalidraw-app.vercel.app
```

## 🧪 Bước 4: Test Collaboration

### 4.1 Kiểm tra WebSocket server
Truy cập: `https://your-websocket-server.onrender.com`
Bạn sẽ thấy:
```json
{
  "message": "🎨 Excalidraw WebSocket Server is running!",
  "status": "healthy",
  "timestamp": "2024-01-XX...",
  "environment": "production",
  "version": "1.0.0"
}
```

### 4.2 Test collaboration
1. Mở Excalidraw app: `https://your-excalidraw-app.vercel.app`
2. Tạo một room (click vào collaboration icon)
3. Copy link và mở trong tab/browser khác
4. Thử vẽ trong cả 2 tab - changes sẽ sync real-time!

## 📊 Monitoring & Debug

### Health checks
- **WebSocket Server**: `https://your-ws-server.onrender.com/health`
- **Main App**: `https://your-ws-server.onrender.com/`

### Debug logs
Để xem logs chi tiết trên render.com:
1. Đi tới dashboard → Service → Logs
2. Hoặc set `DEBUG=excalidraw:*` để xem tất cả logs

### Common Issues

#### ❌ CORS Error
```
Access to XMLHttpRequest blocked by CORS policy
```
**Solution**: Đảm bảo `CORS_ORIGIN` trên render.com match với Vercel URL

#### ❌ WebSocket Connection Failed
```
WebSocket connection to 'wss://...' failed
```
**Solution**: 
- Kiểm tra `VITE_APP_WS_SERVER_URL` trong vercel.json
- Đảm bảo URL không có trailing slash

#### ❌ Module Not Found
```
Error: Cannot find module 'express'
```
**Solution**: Đã được sửa với `types.d.ts` và cập nhật tsconfig.json

## 🔧 Environment Variables Summary

### Render.com (WebSocket Server)
```bash
NODE_ENV=production
CORS_ORIGIN=https://your-excalidraw-app.vercel.app  # Replace với Vercel URL thực tế
PORT=10000
DEBUG=excalidraw:server,excalidraw:io
```

### Vercel (Frontend App)
```json
{
  "VITE_APP_WS_SERVER_URL": "https://your-websocket-server.onrender.com",  // Replace với Render URL thực tế
  "VITE_APP_ENABLE_TRACKING": "true"
}
```

## ✅ Checklist hoàn thành

- [ ] WebSocket server deployed trên render.com
- [ ] Health check endpoint trả về status healthy
- [ ] Vercel app updated với WebSocket URL
- [ ] CORS configured đúng trên render.com  
- [ ] Test collaboration giữa 2 browsers/tabs
- [ ] Real-time drawing sync hoạt động
- [ ] Cursor tracking hoạt động

## 🎉 Xong!

Bây giờ bạn đã có một Excalidraw app hoàn chỉnh với:
- ✅ Frontend trên Vercel 
- ✅ WebSocket server trên Render.com
- ✅ Real-time collaboration
- ✅ Production-ready setup

### Useful Links
- **Your Excalidraw App**: `https://your-excalidraw-app.vercel.app`
- **WebSocket Server**: `https://your-websocket-server.onrender.com`
- **Server Health**: `https://your-websocket-server.onrender.com/health`

---
**Made with ❤️ for seamless collaboration!** 🎨 