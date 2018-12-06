# docker-elk
# 构建于2018年12月6号   by  losin
1、运行dockerfile构建ELK基础镜像
    (1)创建挂载目录  mkdir -p /home/elk,
    (2)下载jdk并解压改名java放脚本运行目录，
2、运行elastic.dockerfile,构建elasticsearch镜像
    (1)在脚本目录创建all.sh文件，内容如下：
    #!/bin/bash
    echo "* soft nofile 65536" >> /etc/security/limits.conf
    echo "* hard nofile 131072" >> /etc/security/limits.conf
    echo "* soft nproc 2048" >> /etc/security/limits.conf
    echo "* hard nproc 4096" >> /etc/security/limits.conf
    echo "vm.max_map_count=655360" >> /etc/sysctl.conf
    sysctl -p
    chown -R elk:elk /home/elk/elasticsearch-6.4.3
    chown -R elk:elk /home/elk/data/elk/elasticsearchdata
    chown -R elk:elk /home/elk/data/elk/logs
    su - elk -c "/home/elk/elasticsearch-6.4.3/bin/elasticsearch"

3、运行filebeat.dockerfile,构建filebeat镜像
4、运行logstash.dockerfile,构建logstash镜像
5、运行所有镜像即可
