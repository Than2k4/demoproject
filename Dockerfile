# Sử dụng image Tomcat 9
FROM tomcat:9.0.96

# Xóa các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Cài đặt thêm công cụ và thư viện cần thiết
RUN apt-get update && apt-get install -y \
    curl \
    libmysql-java 
    # Nếu cần kết nối MySQL, bạn có thể bỏ qua nếu không cần

# Copy file WAR của ứng dụng vào thư mục webapps của Tomcat
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Cấu hình biến môi trường cho ứng dụng
ENV GOOGLE_CLIENT_ID=<1010520136732-i7ivlfqiuov69jmrmfd49ubdl577flbc.apps.googleusercontent.com>
ENV GOOGLE_CLIENT_SECRET=<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>
ENV GOOGLE_REDIRECT_URI=http://localhost:8080/WebsiteBanGiay/login1
ENV JAVA_OPTS="-Dmail.smtp.starttls.enable=true -Dmail.smtp.auth=true"

# Expose cổng 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
