# 第一阶段：编译 Go 程序
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
# 禁用 CGO 并编译
RUN CGO_ENABLED=0 GOOS=linux go build -o my-go-app main.go

# 第二阶段：运行环境
FROM alpine:latest
WORKDIR /root/
# 从编译阶段复制二进制文件
COPY --from=builder /app/my-go-app .
EXPOSE 8083
CMD ["./my-go-app"]