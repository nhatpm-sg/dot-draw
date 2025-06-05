#!/bin/bash

# 🎨 Automated Render.com Deployment for Excalidraw WebSocket Server
echo "🎨 Deploying Excalidraw WebSocket Server to Render.com..."

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Configuration
SERVICE_NAME="${SERVICE_NAME:-excalidraw-websocket-server}"
CORS_ORIGIN="${CORS_ORIGIN:-https://your-excalidraw-app.vercel.app}"

# Check API key
if [ -z "$RENDER_API_KEY" ]; then
    echo -e "${RED}❌ RENDER_API_KEY not set${NC}"
    echo "Get your API key: https://dashboard.render.com/account/settings"
    echo "Then run: export RENDER_API_KEY=your_key"
    exit 1
fi

# Check git remote
if ! git remote get-url origin &> /dev/null; then
    echo -e "${RED}❌ No git remote found${NC}"
    echo "Add GitHub repo first"
    exit 1
fi

REPO_URL=$(git remote get-url origin)
if [[ $REPO_URL == git@github.com:* ]]; then
    REPO_URL=$(echo $REPO_URL | sed 's/git@github.com:/https:\/\/github.com\//' | sed 's/\.git$//')
fi

echo -e "${YELLOW}📋 Config:${NC}"
echo "  Name: $SERVICE_NAME"
echo "  Repo: $REPO_URL"
echo "  CORS: $CORS_ORIGIN"

# Push to GitHub
echo -e "${YELLOW}📤 Pushing to GitHub...${NC}"
git add .
git commit -m "Deploy to Render.com" || true
git push origin main

# Deploy to Render
echo -e "${YELLOW}📡 Creating Render service...${NC}"

response=$(curl -s -X POST "https://api.render.com/v1/services" \
    -H "Authorization: Bearer $RENDER_API_KEY" \
    -H "Content-Type: application/json" \
    -d "{
        \"type\": \"web_service\",
        \"name\": \"$SERVICE_NAME\",
        \"repo\": \"$REPO_URL\",
        \"branch\": \"main\",
        \"buildCommand\": \"npm install && npm run build\",
        \"startCommand\": \"npm start\",
        \"plan\": \"starter\",
        \"region\": \"oregon\",
        \"env\": \"node\",
        \"envVars\": [
            {\"key\": \"NODE_ENV\", \"value\": \"production\"},
            {\"key\": \"CORS_ORIGIN\", \"value\": \"$CORS_ORIGIN\"}
        ],
        \"serviceDetails\": {
            \"healthCheckPath\": \"/health\"
        }
    }")

if echo "$response" | grep -q '"id"'; then
    service_url=$(echo "$response" | grep -o '"url":"[^"]*"' | cut -d'"' -f4)
    if [ -z "$service_url" ]; then
        service_url="https://$SERVICE_NAME.onrender.com"
    fi
    
    echo -e "${GREEN}✅ Success!${NC}"
    echo -e "${GREEN}🌐 URL: $service_url${NC}"
    
    # Update parent .env.production
    if [ -f "../.env.production" ]; then
        sed -i.bak "s|VITE_APP_WS_SERVER_URL=.*|VITE_APP_WS_SERVER_URL=$service_url|g" ../.env.production
        echo -e "${GREEN}✅ Updated ../.env.production${NC}"
    fi
    
    echo ""
    echo -e "${YELLOW}📝 Next: Update Excalidraw with URL: $service_url${NC}"
else
    echo -e "${RED}❌ Failed: $response${NC}"
    exit 1
fi

# Check command line arguments
case "${1:-deploy}" in
    "deploy")
        deploy
        ;;
    "help"|"-h"|"--help")
        echo "🎨 Excalidraw WebSocket Server - Render.com Deployment Script"
        echo ""
        echo "Usage: $0 [command]"
        echo ""
        echo "Commands:"
        echo "  deploy    Deploy the WebSocket server to Render.com (default)"
        echo "  help      Show this help message"
        echo ""
        echo "Environment variables:"
        echo "  RENDER_API_KEY    Your Render.com API key (required)"
        echo "  SERVICE_NAME      Service name (default: excalidraw-websocket-server)"
        echo "  CORS_ORIGIN       CORS origin URL (default: https://your-excalidraw-app.vercel.app)"
        echo ""
        echo "Examples:"
        echo "  $0 deploy"
        echo "  SERVICE_NAME=my-ws-server CORS_ORIGIN=https://myapp.com $0 deploy"
        ;;
    *)
        echo -e "${RED}❌ Unknown command: $1${NC}"
        echo "Use '$0 help' for usage information."
        exit 1
        ;;
esac 