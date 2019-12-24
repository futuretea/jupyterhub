FROM jupyterhub/jupyterhub:1.0.0
RUN apt update -y && chmod -R 777 /home
RUN pip install notebook jupyter_contrib_nbextensions widgetsnbextension tornado==5.1.1 ipywidgets==4.0
RUN useradd admin
RUN echo "admin:admin" | chpasswd
RUN echo "c.JupyterHub.admin_access = True">/srv/jupyterhub/jupyterhub_config.py \
    &&  echo "c.Authenticator.admin_users = {'admin'}">>/srv/jupyterhub/jupyterhub_config.py
