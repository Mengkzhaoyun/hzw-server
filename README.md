# docker

```bash
# hzw
docker build -t registry.cn-qingdao.aliyuncs.com/wod/hzw:2021 -f .beagle/hzw.dockerfile .
docker push registry.cn-qingdao.aliyuncs.com/wod/hzw:2021

# hzw-data
docker build -t registry.cn-qingdao.aliyuncs.com/wod/hzw-data:2021 -f .beagle/hzw-data.dockerfile .
docker push registry.cn-qingdao.aliyuncs.com/wod/hzw-data:2021
```

## debug

```bash
# hzw
docker run -w /home/pirate -it --rm --entrypoint bash registry.cn-qingdao.aliyuncs.com/wod/hzw:2021

# hzw-data
docker run -it --rm registry.cn-qingdao.aliyuncs.com/wod/hzw-data:2021 sh -c 'ls -ll /home/pirate/programs/mysql/'

# run
docker run -w /home/pirate \
-p 80:80 \
-p 3306:3306 \
-v $PWD/home/pirate/programs/mysql/var:/tmp/mysql/var \
-v $PWD/entrypoint.sh:/home/pirate/entrypoint.sh \
-it --rm \
--entrypoint bash \
registry.cn-qingdao.aliyuncs.com/wod/hzw:2021

cp /tmp/mysql/var /home/pirate/programs/mysql/var -r
sudo chown pirate:pirate /home/pirate/programs/mysql/var
./entrypoint.sh

# debug
docker run -it --rm \
-w /home/pirate \
-v $PWD/home/pirate:/home/pirate \
-v $PWD/www:/home/pirate/www \
-v $PWD/entrypoint.sh:/home/pirate/entrypoint.sh \
-p 3380:80 \
-p 3381:3306 \
--entrypoint bash \
centos:6

groupadd -g 500 pirate && \
useradd -u 500 -g pirate pirate && \
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-6.10.repo && \
yum install -y epel-release && \
yum install -y libevent libmcrypt

cd /home/pirate/programs/nginx/ && sh run.sh

su pirate
./entrypoint.sh

/bin/netstat -anpt
```
