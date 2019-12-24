FROM jupyterhub/jupyterhub:1.0.0
RUN apt update -y && pip install notebook --upgrade
RUN chmod -R 777 /home
RUN useradd admin
RUN echo "admin:admin" | chpasswd
RUN echo "c.JupyterHub.admin_access = True">/srv/jupyterhub/jupyterhub_config.py \
    &&  echo "c.Authenticator.admin_users = {'admin'}">>/srv/jupyterhub/jupyterhub_config.py
