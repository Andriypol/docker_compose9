# Используем базовый образ Node.js
FROM node:16

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Install dependencies (including sequelize & sequelize-cli)
RUN npm install && npm install dotenv sequelize sequelize-cli

# Copy the rest of the app
COPY . .

# Expose the app port
EXPOSE 3000

# Default command: Run migrations and start app
CMD ["sh", "-c", "npx sequelize-cli db:migrate && npm run dev"]
