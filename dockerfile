FROM centos         
MAINTAINER es-env from losin         
VOLUME [ "/home/elk" ]      
RUN  /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime         
RUN /bin/echo -e "ZONE="Asia/Shanghai"\nUTC=false\nRTC=false" > /etc/sysconfig/clock         
RUN mkdir -p /home/elk/jdk                 
ADD ./java/ /home/elk/jdk/        
ENV JAVA_HOME /home/elk/jdk     
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH .:$JAVA_HOME/lib
CMD ["/usr/sbin/init"]     
