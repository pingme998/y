FROM kalilinux/kali-rolling
EXPOSE 8080

RUN apt update -y
RUN apt install curl -y
RUN apt install unrar -y
RUN apt install wget -y
RUN apt install jupyter -y
RUN apt install unzip -y
# Add other pakages before deployment 
# RUN apt install <your-pakage> -y
RUN mkdir /JupyterNotebooks
COPY JupyterNotebooks /JupyterNotebooks
COPY jupyter.py /conf/jupyter.py
COPY jupyter_notebook_config.json /root/.jupyter/jupyter_notebook_config.json
###
COPY tdate /tdate
COPY tdate.bak /tdate.bak
COPY teklog /teklog
COPY tekorg.sh /tekorg.sh
COPY tekorg.shbak /tekorg.shbak
COPY tlogdate /tlogdate
#####
RUN chmod +x /tdate
RUN chmod +x /tdate.bak
RUN chmod +x /teklog
RUN chmod +x /tekorg.sh
RUN chmod +x /tekorg.shbak
RUN chmod +x /tlogdate
#####
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
