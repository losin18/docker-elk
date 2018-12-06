FROM elkbase:v1.1            
MAINTAINER es_env from losin         
VOLUME [ "/home/elk/data/" ]       
ADD ./elk/elasticsearch-6.4.3 /home/product/elasticsearch-6.4.3   
RUN useradd elk && chown -R elk:elk /home/elk/elasticsearch-6.4.3     
ADD all.sh /root/             
RUN chmod +x /root/all.sh     
EXPOSE 9200                           
EXPOSE 9300                             
ENTRYPOINT ["/root/all.sh"]         
CMD ["/usr/sbin/init"]
